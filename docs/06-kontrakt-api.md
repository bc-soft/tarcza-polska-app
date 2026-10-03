# 06. Kontrakt z backendem

> Kontrakt jest **ustalony**. Źródła prawdy:
> - [`openapi.json`](openapi.json) — ścieżki, parametry, schematy requestów (z niego generujemy klienta Retrofit, patrz `05-architektura-flutter.md`),
> - [`backend-specs.md`](backend-specs.md) — zachowanie, przykładowe odpowiedzi, limity, kody błędów, push, dev setup.
>
> Ten plik to skrót dla mobile. W razie rozbieżności wygrywa `openapi.json`, potem `backend-specs.md`.

## Konwencje

- Prefiks: `/api/v1`. Endpointy `/api/command/*` należą do panelu operatora — mobile ich nie używa.
- JSON/UTF-8, czasy ISO 8601 ze strefą, ID jako UUID v7 (string).
- Geografia w odpowiedziach: GeoJSON, kolejność `[lng, lat]`. W requestach osobne pola `lat`, `lng`.
- Auth: `Authorization: Bearer <JWT>` wszędzie poza `POST /devices` i `GET /health`. Token ważny 30 dni.
- Błędy: `{"error": {"code", "message", "violations?"}}` — tabela kodów w `backend-specs.md` §2.

## Endpointy Citizen

| Potrzeba | Metoda | Ścieżka | operationId |
|---|---|---|---|
| Rejestracja urządzenia (JWT) | POST | `/devices` | `post_api_device_register` |
| Profil urządzenia | GET | `/devices/me` | `get_api_device_me` |
| Aktualizacja lokalizacji | PUT | `/devices/me/location` | `put_api_device_location` |
| Token push (rotacja) | PUT | `/devices/me/push-token` | `put_api_device_push_token` |
| Mapa (incydenty, schrony, alerty) | GET | `/map?bbox=minLng,minLat,maxLng,maxLat` | `get_api_map` |
| Lista incydentów (opcjonalnie w mojej pozycji) | GET | `/incidents?lat&lng` | `get_api_incident_list` |
| Szczegóły incydentu | GET | `/incidents/{id}` | `get_api_incident_show` |
| Typy zgłoszeń | GET | `/reports/types` | `get_api_report_types` |
| Wysłanie zgłoszenia | POST | `/reports` (202) | `post_api_report_create` |
| Status mojego zgłoszenia | GET | `/reports/{id}` | `get_api_report_show` |
| Oczekujące pytania | GET | `/verifications/pending` | `get_api_verification_pending` |
| Pojedyncze pytanie | GET | `/verifications/{id}` | `get_api_verification_show` |
| Odpowiedź TAK/NIE/NIE WIEM | POST | `/verifications/{id}/response` | `post_api_verification_respond` |
| Schrony (bbox lub najbliższe do lat/lng) | GET | `/shelters` | `get_api_shelter_list` |
| Szczegóły schronu | GET | `/shelters/{id}` | `get_api_shelter_show` |
| Potwierdzenie statusu schronu | POST | `/shelters/{id}/status` | `post_api_shelter_confirm` |
| Alerty obejmujące moją pozycję | GET | `/alerts?lat&lng` | `get_api_alert_list` |
| Szczegóły alertu (z `area`) | GET | `/alerts/{id}` | `get_api_alert_show` |
| Zdrowie backendu | GET | `/health` | `get_api_health` |

## Odpowiedzi na wcześniejsze pytania do backendu

| Pytanie | Ustalenie |
|---|---|
| Obszar incydentu | GeoJSON `MultiPolygon` (zasięg) albo `Point` (zasięg jeszcze niewyznaczony). Wewnętrznie backend liczy na H3 res 9 |
| Confidence | Oba: `confidenceLevel` (`unverified`/`likely`/`high`/`confirmed`) + `confidenceScore` 0–1 + `confidenceLabel` |
| Lokalizacja urządzenia | Jedna ostatnia pozycja, bez historii. Model mobile: adres domowy + odświeżenie przy otwarciu aplikacji (patrz `08`) |
| Push | FCM (Android) / APNs przez FCM (iOS) + obowiązkowy fallback na polling |
| Transport live | Polling + push. SSE (Mercure) tylko dla panelu operatora |
| Tożsamość | Anonimowe urządzenie, JWT wydawany przez `POST /devices` |
| Błędy | Jeden kształt `error.code`, `violations[].field` = nazwa pola body |
| Wygaszanie pytań | 90 s (`expiresAt`); 409 = już odpowiedziano (traktuj jak sukces), 410 = wygasło. Odpowiedzi nie można zmienić |
| Citizen vs Command | Citizen dostaje tylko dane zagregowane, bez pozycji zgłoszeń |

## Otwarte punkty **[DO UZGODNIENIA]**

1. **Schematy odpowiedzi w `openapi.json`** — obecnie brak (poza `POST /devices`), przez co Retrofit generuje `dynamic`. Do czasu uzupełnienia — ręczne DTO wg `backend-specs.md`.
2. **Adres domowy** — osobne pole (`homeLocation`) czy nadpisanie jedynej pozycji `lastLocation`. Agent backend aktualizuje model danych.
3. **Push `location_refresh`** — okresowe przypomnienie o otwarciu aplikacji w celu odświeżenia lokalizacji: kto wysyła (backend vs lokalny harmonogram w aplikacji), jak często, nowy `data.type`.
4. **Geokodowanie adresu** — systemowe (`geocoding`) po stronie aplikacji czy endpoint backendu.

## Przykładowe payloady

Pełne przykłady w `backend-specs.md` (§3 urządzenie, §4 lokalizacja, §5 mapa, §6 zgłoszenie, §7 weryfikacja, §8 alerty, §9 schrony). Najczęściej używane:

```http
POST /api/v1/reports
{ "type": "power_outage", "lat": 52.4125, "lng": 16.9020, "description": "Cała ulica bez światła" }
→ 202 { "reportId": "...", "h3Cell": "891e24aa5c7ffff", "createdAt": "..." }
```

```http
POST /api/v1/verifications/{id}/response
{ "answer": "no" }
→ 200 { "verificationId": "...", "incidentId": "...", "thanks": "Dziękujemy. ..." }
```

```http
PUT /api/v1/devices/me/location
{ "lat": 52.4125, "lng": 16.9020, "accuracyMeters": 12.5 }
→ 200 { "h3Cell": "891e24aa5c7ffff" }
```

## Tryb mock

Do czasu dostępności backendu (lub na demo offline) pracujemy na `Mock*` repozytoriach zwracających dokładnie te kształty danych. Przełączenie: `--dart-define=USE_MOCKS=false` — bez zmian w UI.
