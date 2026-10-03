## Tarcza Polska — kontekst projektu

Aplikacja mobilna **Tarcza Citizen** (Flutter) na hackathon. Backend i panel Command robi inny programista — nie implementujemy ich tutaj.

Cykl produktu: DETECT → VERIFY → MAP → INFORM. Kluczowa innowacja: **Active Crowd Verification**.

Zasada przewodnia: każda funkcja musi pomagać szybciej wykryć problem, lepiej go zweryfikować, określić zasięg albo skuteczniej poinformować ludzi. Jeśli nie — pomijamy w MVP.

### Dokumentacja (czytaj zależnie od zadania)

- @docs/backend-specs.md — przewodnik integracyjny backendu (źródło prawdy dla zachowania API)
- docs/openapi.json — spec OpenAPI, z niej generujemy klienta Retrofit (`swagger_parser`)
- @docs/01-produkt.md — cel, problem, product statement
- @docs/02-mechanizm-core.md — weryfikacja, rola mobile
- @docs/03-model-danych.md — modele, confidence
- @docs/04-mvp-mobile.md — zakres, ekrany, flow
- @docs/05-architektura-flutter.md — BLoC, get_it, Retrofit, push, H3, struktura, mocki
- @docs/06-kontrakt-api.md — ustalony kontrakt API (skrót), otwarte punkty
- @docs/07-ux-i-komunikaty.md — stylistyka (mObywatel), statusy, kolory, teksty
- @docs/08-bezpieczenstwo-prywatnosc.md — lokalizacja (adres domowy, tło, push), dane wrażliwe
- @docs/09-demo-scenariusz.md — demo i dane seed
- @docs/10-roadmapa-priorytety.md — fazy i priorytety

### Zasady dla Claude

- State management: **BLoC** (`flutter_bloc`), DI: `get_it`. Nie używaj Riverpod ani Provider.
- Klient API: **Retrofit** generowany z `docs/openapi.json` (`swagger_parser` → `lib/data/remote/api/`, nie edytuj ręcznie). Brakujące schematy odpowiedzi → ręczne DTO wg `backend-specs.md`.
- Push: Firebase Cloud Messaging (Android) / APNs przez FCM (iOS); zawsze z fallbackiem na polling.
- Lokalizacja: adres domowy + aktualizacja przy otwarciu aplikacji (push `location_refresh`) + opcjonalny tryb czuwania w tle (opt-in, zgoda „zawsze”): iOS — Significant Location Change (natywnie, działa po zamknięciu), Android — foreground service `geolocator` + `workmanager`. Niska dokładność, wysyłka tylko po zmianie komórki H3 res 9, bez historii.
- UI w stylu zbliżonym do mObywatela (bez logo/godła).
- Pracuj na interfejsach repozytoriów z implementacjami `Mock*` i `Remote*`; przełącznik `USE_MOCKS`.
- Model danych może się jeszcze zmienić (aktualizuje go agent backend) — po zmianie `openapi.json` regeneruj klienta.
- Mobile nigdy nie liczy confidence — tylko prezentuje to, co zwraca backend.
- Modele Citizen nie zawierają dokładnych współrzędnych źródeł zgłoszeń.
- Sekcje **[DO UZGODNIENIA]** w docs to otwarte decyzje — nie zgaduj, zapytaj lub zaznacz założenie.
- Dokumentacja i komentarze po polsku, nazwy techniczne po angielsku.