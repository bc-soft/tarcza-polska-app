# 06. Kontrakt z backendem

> Dokument roboczy do uzgodnienia z programistą backendu. Wszystko poniżej to **[DO UZGODNIENIA]** — to propozycja wyjściowa oparta na tym, czego potrzebuje mobile. Po ustaleniu zapisz tu finalne ścieżki i payloady.

## Czego mobile potrzebuje

| Potrzeba | Propozycja endpointu | Metoda |
|---|---|---|
| Wysłanie zgłoszenia | `/reports` | POST |
| Incydenty w okolicy (widok mapy) | `/incidents?bbox=...` lub `?lat&lng&radius` | GET |
| Szczegóły incydentu (wersja Citizen) | `/incidents/{id}` | GET |
| Pobranie oczekujących pytań weryfikacyjnych | `/verification-requests/pending` | GET |
| Odpowiedź na pytanie | `/verification-requests/{id}/responses` | POST |
| Schrony w okolicy | `/shelters?...` | GET |
| Potwierdzenie statusu schronu | `/shelters/{id}/confirmations` | POST |
| Alerty dla obszaru | `/alerts?lat&lng` | GET |
| Rejestracja urządzenia / tokenu push | `/devices` | POST |
| Aktualizacja przybliżonej lokalizacji | `/devices/{id}/location` | PUT |

## Pytania do backendu

1. **Obszar incydentu**: poligon GeoJSON czy lista komórek (H3/geohash) z confidence na komórkę?
2. **Confidence**: sam poziom (`UNVERIFIED`…`CONFIRMED`), czy także liczba?
3. **Lokalizacja urządzenia**: jak często i z jaką dokładnością wysyłać, żeby backend mógł wybierać użytkowników do pytań? (patrz `08-bezpieczenstwo-prywatnosc.md`)
4. **Push**: FCM? Czy na hackathon wystarczy polling `/verification-requests/pending`?
5. **Transport live**: WebSocket / SSE / polling?
6. **Tożsamość**: anonimowy token generowany przy pierwszym uruchomieniu — kto go wydaje?
7. **Format błędów** i wersjonowanie API.
8. **Wygaszanie pytań**: po jakim czasie `expiresAt`, czy odpowiedź można zmienić?
9. **Dane Citizen vs Command**: potwierdzenie, że endpointy Citizen zwracają wyłącznie zagregowane dane (bez współrzędnych źródeł).

## Przykładowe payloady (propozycja)

Zgłoszenie:
```json
{
  "type": "power_outage",
  "location": { "lat": 52.4064, "lng": 16.9252 },
  "description": "Brak prądu od 10 minut",
  "timestamp": "2026-10-03T18:42:00Z"
}
```

Pytanie weryfikacyjne:
```json
{
  "id": "vr_123",
  "incidentId": "inc_45",
  "type": "power_outage",
  "question": "Czy w tej chwili masz dostęp do prądu?",
  "expiresAt": "2026-10-03T18:52:00Z"
}
```

Odpowiedź:
```json
{ "answer": "NO", "timestamp": "2026-10-03T18:43:10Z" }
```

Incydent (widok Citizen):
```json
{
  "id": "inc_45",
  "type": "power_outage",
  "status": "active",
  "confidence": "HIGH_CONFIDENCE",
  "area": { "...": "format do uzgodnienia" },
  "summary": "Potwierdzona awaria energetyczna w tym obszarze.",
  "startedAt": "2026-10-03T18:35:00Z",
  "lastConfirmedAt": "2026-10-03T18:44:00Z",
  "responseStats": { "negativeShare": 0.86 }
}
```

## Do czasu uzgodnienia

Pracuj na interfejsach repozytoriów + implementacjach mockowych (`05-architektura-flutter.md`). Po ustaleniu kontraktu zaimplementuj `Remote*` bez zmian w UI.
