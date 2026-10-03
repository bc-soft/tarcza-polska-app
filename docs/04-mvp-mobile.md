# 04. MVP — aplikacja mobilna

MVP ma pokazać przede wszystkim unikalny mechanizm Tarczy (Active Crowd Verification), a nie wszystkie możliwe zastosowania. Najważniejsze: pokazać, że mechanizm działa end-to-end.

## Zakres MVP

### 0. Onboarding
Zgoda na powiadomienia, wpisanie adresu domowego (pozycja bazowa), opcjonalna zgoda na lokalizację „podczas używania”, rejestracja anonimowego urządzenia (`POST /devices`).

### 1. Mapa
Użytkownik widzi: swoją lokalizację (lub dom), aktywne incydenty, obszary problemów, schrony, aktywne alerty — jedno wywołanie `GET /map?bbox`.

### 2. Raportowanie
Typy zgłoszeń: brak prądu, brak wody, brak paliwa, nieprzejezdna droga, problem ze schronem, inne zagrożenie.

Flow: **typ → lokalizacja → opcjonalny opis → wyślij**.

Flow ma być jak najkrótszy — to sytuacja kryzysowa.

### 3. Active Verification
Push (FCM / APNs) + in-app prompt (`GET /verifications/pending` przy otwarciu), np.:

> W Twojej okolicy zgłoszono: brak prądu. Czy w tej chwili masz dostęp do prądu?

Odpowiedzi: **TAK / NIE / NIE WIEM**.

### 4. Schrony
Mapa schronów ze statusem: otwarty / pełny / zamknięty / brak danych. Użytkownik może potwierdzić status.

### 5. Alerty
Użytkownik widzi komunikaty dotyczące obszaru, w którym się znajduje (push + `GET /alerts?lat&lng`).

### 6. Aktualizacja lokalizacji
Push `location_refresh` okresowo zachęca do otwarcia aplikacji; przy otwarciu wysyłamy aktualną pozycję. Opcjonalnie **tryb czuwania** (śledzenie w tle za zgodą „zawsze”) — po fazie core, patrz `08-bezpieczenstwo-prywatnosc.md`.

## Proponowane ekrany

| Ekran | Cel |
|---|---|
| Onboarding | zgody, adres domowy (z pinezką na mapie) |
| Mapa (główny) | incydenty, strefy, schrony, moja pozycja |
| Szczegóły incydentu | status, confidence, zasięg, aktualny komunikat |
| Nowe zgłoszenie | wybór typu → lokalizacja → opis → wyślij |
| Verification prompt | pytanie + TAK / NIE / NIE WIEM (modal / pełny ekran z notyfikacji) |
| Szczegóły schronu | status, pojemność, ostatnie potwierdzenie, przycisk potwierdzenia |
| Lista alertów | alerty dla mojego obszaru |
| Ekran alertu | pełnoekranowy alert z komunikatem operatora |
| Ustawienia | zmiana adresu domowego, powiadomienia, (dev) tryb mock / scenariusz demo |

Stylistyka ekranów: w duchu mObywatela (patrz `07-ux-i-komunikaty.md`).

## Poza MVP (nie robimy teraz)

- pełna integracja mObywatela,
- produkcyjna integracja z systemami państwowymi,
- rozbudowany system reputacji,
- perfekcyjny algorytm granic,
- produkcyjne bezpieczeństwo klasy państwowej.

Zdjęcia, tryb offline, historia incydentu — patrz `10-roadmapa-priorytety.md`.

## Kryteria „gotowe”

- [ ] Użytkownik zgłasza problem i widzi go na mapie.
- [ ] Użytkownik podaje adres domowy, urządzenie ma pozycję w backendzie.
- [ ] Użytkownik odbiera verification prompt (push i polling) i odpowiada.
- [ ] Mapa pokazuje strefę incydentu i jej zmiany.
- [ ] Widać status/confidence incydentu.
- [ ] Użytkownik w obszarze dostaje alert od operatora.
- [ ] Push `location_refresh` otwiera aplikację i aktualizuje pozycję.
- [ ] (opcjonalnie) Tryb czuwania: zmiana okolicy przy zamkniętej aplikacji aktualizuje pozycję w backendzie (iOS i Android).
- [ ] Całość działa na danych mockowych bez backendu i na prawdziwym API (przełącznik `USE_MOCKS`, patrz `05-architektura-flutter.md`).
