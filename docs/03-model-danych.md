# 03. Model danych

> Modele opisują to, co aplikacja wysyła i odbiera, zgodnie z [`openapi.json`](openapi.json) i [`backend-specs.md`](backend-specs.md).
> **Model danych zostanie jeszcze zaktualizowany przez agenta backend** — po zmianie spec regenerujemy klienta Retrofit i aktualizujemy ten plik. Modele domenowe w Dart są niemutowalne (`freezed`).

Wartości enumów są stałe, po angielsku, małymi literami. Etykiety po polsku przychodzą z backendu (`typeLabel`, `statusLabel`, `confidenceLabel`).

## Device

Anonimowa instalacja aplikacji (brak kont).

| Pole | Opis |
|---|---|
| `deviceId` | UUID |
| `token` | JWT (tylko w odpowiedzi `POST /devices`), przechowywany w `flutter_secure_storage` |
| `platform` | `ios` / `android` / `web` / `simulator` |
| `hasPushToken` | czy backend zna token FCM |
| `lastLocation` | GeoJSON `Point` lub `null` |
| `h3Cell` | komórka H3 res 9 ostatniej pozycji |
| `locationUpdatedAt` | czas ostatniej aktualizacji |

**[DO UZGODNIENIA]**: pole na adres domowy (`homeLocation` / `homeAddress`) — patrz `08-bezpieczenstwo-prywatnosc.md`. Lokalnie adres domowy (tekst + współrzędne) trzymamy w `shared_preferences`.

## Report (aplikacja **tworzy**)

Request `CreateReportRequest`:

| Pole | Opis |
|---|---|
| `type` | `ReportType`: `power_outage`, `water_outage`, `fuel_shortage`, `road_blocked`, `shelter_issue`, `other_threat` |
| `lat`, `lng` | lokalizacja zgłoszenia |
| `description` | opcjonalny, maks. 1000 znaków |

Odpowiedź 202: `reportId`, `h3Cell`, `createdAt`. Status (`GET /reports/{id}`): `reportId`, `type`, `createdAt`, `incident` (`id`, `status`, `confidenceLevel`, `confidenceScore`) lub `null`, dopóki zgłoszenie nie zostanie dołączone.

Zdjęcia: brak endpointu — nie w MVP.

## Incident (aplikacja **odczytuje**)

| Pole | Opis |
|---|---|
| `id`, `type`, `typeLabel` | |
| `status` | `detected` / `verifying` / `active` / `resolved` (resolved nie pojawia się na mapie) |
| `confidenceLevel`, `confidenceLabel` | patrz Confidence |
| `confidenceScore` | 0–1, pokazujemy jako procent |
| `startedAt`, `lastActivityAt`, `lastConfirmedAt?` | |
| `community` | `reports`, `answers`, `agreementPct` (`null`, gdy brak odpowiedzi) |
| `summary?` | krótki opis dla Citizen |
| `area` | GeoJSON `MultiPolygon` (zasięg) albo `Point` (zasięg niewyznaczony). Na mapie jako `geometry` Feature |

Citizen **nie** dostaje surowych zgłoszeń, ich pozycji ani źródeł.

## Map (`GET /map?bbox`)

GeoJSON `FeatureCollection`; `properties.kind` ∈ `incident` | `shelter` | `alert`. Mapujemy na sealed class `MapFeature` (`IncidentFeature`, `ShelterFeature`, `AlertFeature`). Parsowanie współrzędnych: `LatLng(c[1], c[0])`.

## VerificationQuestion

| Pole | Opis |
|---|---|
| `verificationId`, `incidentId` | |
| `type`, `typeLabel` | typ incydentu |
| `question` | np. „Czy w tej chwili masz dostęp do prądu?” |
| `context` | np. „W Twojej okolicy zgłoszono: brak prądu.” |
| `options` | `["yes", "no", "unknown"]` |
| `sentAt`, `expiresAt` | pytanie żyje 90 s |
| `answered` | bool |

## VerificationResponse

Request `RespondRequest`: `{ "answer": "yes" | "no" | "unknown" }` (w UI: TAK / NIE / NIE WIEM). Wysyłamy dosłownie kliknięty przycisk — interpretację („NIE” na „czy masz prąd?” = problem) robi backend. Lokalizacja przy odpowiedzi nie jest wysyłana (backend zna ostatnią pozycję urządzenia).

Odpowiedź: `verificationId`, `incidentId`, `thanks`.

## Shelter

| Pole | Opis |
|---|---|
| `id`, `name`, `address` | |
| `location` | GeoJSON `Point` |
| `status`, `statusLabel` | `ShelterStatus`: `open` / `closed` / `full` / `unknown` |
| `capacity` | |
| `lastConfirmedAt`, `confirmationCount` | |
| `distanceMeters` | tylko w wariancie `?lat&lng` (10 najbliższych) |

Potwierdzenie: `ConfirmShelterStatusRequest` `{ "status": "open", "comment": "..." }` → zaktualizowany schron.

## Alert

`id`, `title`, `body`, `severity` (`info` / `warning` / `danger`), `incidentId?`, `createdAt`, `expiresAt`, `active`, `area` (GeoJSON, tylko w `GET /alerts/{id}` i na mapie).

## Confidence

| `confidenceLevel` | Etykieta | Znaczenie |
|---|---|---|
| `unverified` | Niezweryfikowane | pojedyncze zgłoszenie |
| `likely` | Prawdopodobne | wiele niezależnych zgłoszeń z obszaru |
| `high` | Wysoka wiarygodność | potwierdzone przez większą liczbę odpowiadających |
| `confirmed` | Potwierdzone | społeczność + źródło zewnętrzne/oficjalne |

### Zasada

Confidence liczy backend deterministycznie (liczba niezależnych raportów, rozkład geograficzny, świeżość, potwierdzenia/zaprzeczenia, źródła zewnętrzne). **Aplikacja mobilna nigdy nie liczy confidence samodzielnie** — tylko prezentuje `confidenceLevel`, `confidenceScore` i `community.agreementPct`.
