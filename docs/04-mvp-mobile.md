# 04. MVP — aplikacja mobilna

MVP ma pokazać przede wszystkim unikalny mechanizm Tarczy (Active Crowd Verification), a nie wszystkie możliwe zastosowania. Najważniejsze: pokazać, że mechanizm działa end-to-end.

## Zakres MVP

### 1. Mapa
Użytkownik widzi: swoją lokalizację, aktywne incydenty, obszary problemów, schrony.

### 2. Raportowanie
Typy zgłoszeń: brak prądu, brak wody, brak paliwa, nieprzejezdna droga, problem ze schronem, inne zagrożenie.

Flow: **typ → lokalizacja → opcjonalny opis → wyślij**.

Flow ma być jak najkrótszy — to sytuacja kryzysowa.

### 3. Active Verification
Push / in-app prompt, np.:

> W Twojej okolicy zgłoszono brak prądu. Czy u Ciebie również występuje ten problem?

Odpowiedzi: **TAK / NIE / NIE WIEM**.

### 4. Schrony
Mapa schronów ze statusem: otwarty / zamknięty / brak danych. Użytkownik może potwierdzić status.

### 5. Alerty
Użytkownik widzi komunikaty dotyczące obszaru, w którym się znajduje.

## Proponowane ekrany

| Ekran | Cel |
|---|---|
| Mapa (główny) | incydenty, strefy, schrony, moja pozycja |
| Szczegóły incydentu | status, confidence, zasięg, aktualny komunikat |
| Nowe zgłoszenie | wybór typu → lokalizacja → opis → wyślij |
| Verification prompt | pytanie + TAK / NIE / NIE WIEM (modal / pełny ekran z notyfikacji) |
| Szczegóły schronu | status, pojemność, ostatnie potwierdzenie, przycisk potwierdzenia |
| Lista alertów | alerty dla mojego obszaru |
| Ekran alertu | pełnoekranowy alert z komunikatem operatora |

## Poza MVP (nie robimy teraz)

- pełna integracja mObywatela,
- produkcyjna integracja z systemami państwowymi,
- rozbudowany system reputacji,
- perfekcyjny algorytm granic,
- produkcyjne bezpieczeństwo klasy państwowej.

Zdjęcia, tryb offline, dostępność schronów (dużo/mało/pełny), historia incydentu i automatyczne push — patrz `10-roadmapa-priorytety.md`.

## Kryteria „gotowe”

- [ ] Użytkownik zgłasza problem i widzi go na mapie.
- [ ] Użytkownik odbiera verification prompt i odpowiada.
- [ ] Mapa pokazuje strefę incydentu i jej zmiany.
- [ ] Widać status/confidence incydentu.
- [ ] Użytkownik w obszarze dostaje alert od operatora.
- [ ] Całość działa na danych mockowych bez backendu (patrz `05-architektura-flutter.md`).
