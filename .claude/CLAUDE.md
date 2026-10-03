## Tarcza Polska — kontekst projektu

Aplikacja mobilna **Tarcza Citizen** (Flutter) na hackathon. Backend i panel Command robi inny programista — nie implementujemy ich tutaj.

Cykl produktu: DETECT → VERIFY → MAP → INFORM. Kluczowa innowacja: **Active Crowd Verification**.

Zasada przewodnia: każda funkcja musi pomagać szybciej wykryć problem, lepiej go zweryfikować, określić zasięg albo skuteczniej poinformować ludzi. Jeśli nie — pomijamy w MVP.

### Dokumentacja (czytaj zależnie od zadania)

- @docs/README.md — spis i konwencje
- @docs/01-produkt.md — cel, problem, product statement
- @docs/02-mechanizm-core.md — weryfikacja, rola mobile
- @docs/03-model-danych.md — modele, confidence
- @docs/04-mvp-mobile.md — zakres, ekrany, flow
- @docs/05-architektura-flutter.md — struktura, paczki, mocki
- @docs/06-kontrakt-api.md — oczekiwania wobec backendu
- @docs/07-ux-i-komunikaty.md — statusy, kolory, teksty
- @docs/08-bezpieczenstwo-prywatnosc.md — lokalizacja, dane wrażliwe
- @docs/09-demo-scenariusz.md — demo i dane seed
- @docs/10-roadmapa-priorytety.md — fazy i priorytety

### Zasady dla Claude

- Pracuj na interfejsach repozytoriów z implementacją mock; nie zakładaj gotowego backendu.
- Mobile nigdy nie liczy confidence — tylko prezentuje to, co zwraca backend.
- Modele Citizen nie zawierają dokładnych współrzędnych źródeł zgłoszeń.
- Sekcje **[DO UZGODNIENIA]** w docs to otwarte decyzje — nie zgaduj, zapytaj lub zaznacz założenie.
- Dokumentacja i komentarze po polsku, nazwy techniczne po angielsku.