# 05. Architektura Flutter

> Całość to **[REKOMENDACJA]**. Cel: szybki hackathon, możliwość pracy bez gotowego backendu.

## Zasada nadrzędna: mobile niezależny od backendu

Backend robi inny programista, więc aplikacja ma działać na **mockach**, a przełączenie na prawdziwe API ma być zmianą jednej linijki (DI), nie przepisywaniem ekranów.

```
UI (widgets)  →  Controllers/Notifiers  →  Repository (interfejs)  →  Mock | Remote
```

Każde repozytorium ma interfejs (`abstract class`) i dwie implementacje: `Mock*` (dane lokalne, symulacja scenariusza demo) i `Remote*` (HTTP/WebSocket).

## Proponowane paczki

| Obszar | Paczka | Uwagi |
|---|---|---|
| State management | `flutter_riverpod` | proste DI + podmiana mock/remote |
| Nawigacja | `go_router` | deep linki z notyfikacji |
| Mapa | `flutter_map` (OSM) | bez klucza API; alternatywa: `google_maps_flutter` |
| Lokalizacja | `geolocator` | uprawnienia + strumień pozycji |
| HTTP | `dio` | |
| Modele | `freezed` + `json_serializable` | niemutowalne modele |
| Push | `firebase_messaging` + `flutter_local_notifications` | fallback: polling / WebSocket |
| Geo (komórki) | `h3_flutter` | tylko jeśli backend zwraca H3 |

## Struktura katalogów

```
lib/
  main.dart
  app/                  # router, theme, DI, konfiguracja
  core/                 # wspólne: lokalizacja, błędy, utils, widgety bazowe
  data/
    models/             # Report, Incident, Shelter, Alert, VerificationRequest...
    repositories/       # interfejsy
    mock/               # implementacje mockowe + scenariusz demo
    remote/             # implementacje HTTP/WS
  features/
    map/
    report/
    verification/
    incident/
    shelters/
    alerts/
test/
```

Każdy `feature` ma własne `presentation/` (ekrany, widgety) i `application/` (notifiery/kontrolery).

## Moduły i odpowiedzialności

| Moduł | Odpowiada za |
|---|---|
| `map` | mapa, markery, rysowanie stref incydentów, pozycja użytkownika |
| `report` | flow zgłoszenia i wysyłka |
| `verification` | odbiór pytań, odpowiedzi TAK/NIE/NIE WIEM |
| `incident` | szczegóły, status, confidence |
| `shelters` | mapa schronów, status, potwierdzenie |
| `alerts` | lista i ekran alertu |

## Aktualizacje „na żywo”

Strefa incydentu i confidence zmieniają się w czasie. **[DO UZGODNIENIA]** z backendem: WebSocket/SSE czy polling co N sekund. Na hackathon wystarczy polling; kod repozytoriów powinien eksponować `Stream<...>`, żeby zmiana transportu nie dotykała UI.

## Symulacja demo w trybie mock

`MockIncidentRepository` powinien umieć odtworzyć scenariusz z `09-demo-scenariusz.md` (kroki czasowe: cluster → pytania → zmiana confidence → granica → CONFIRMED → alert), sterowany np. ukrytym przyciskiem w ustawieniach dev.

## Konwencje

- Brak logiki biznesowej confidence w UI — tylko prezentacja.
- Żadnych twardych współrzędnych źródeł w modelach Citizen.
- Teksty UI w jednym miejscu (przygotowanie pod multilingual — nice to have).
