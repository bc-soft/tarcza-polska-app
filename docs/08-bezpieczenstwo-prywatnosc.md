# 08. Bezpieczeństwo i prywatność (perspektywa mobile)

## Zasada główna

Publiczna aplikacja i Command Center **nie mają** tego samego poziomu szczegółowości. Citizen widzi dane zagregowane; szczegóły źródeł są wyłącznie po stronie Command.

Przykład: Command wie, że kilka raportów pochodzi z konkretnych lokalizacji. Citizen widzi tylko „Potwierdzone zagrożenie w tym obszarze.” — bez dokładnych współrzędnych źródeł i bez informacji mogących stanowić zagrożenie operacyjne.

## Co to znaczy dla klienta Flutter

| Obszar | Wymaganie |
|---|---|
| Modele Citizen | Nie zawierają współrzędnych poszczególnych raportów ani danych źródłowych |
| Tożsamość | Anonimowy identyfikator użytkownika, bez danych osobowych. Docelowo (nice to have) potwierdzenie tożsamości przez mObywatela przeciw botom i Sybil attacks |
| Lokalizacja | Prośba o zgodę z jasnym wyjaśnieniem, po co (weryfikacja i alerty). Zbieraj tylko tyle, ile potrzeba |
| Przybliżona pozycja do backendu | **[DO UZGODNIENIA]** — częstotliwość i dokładność (np. zaokrąglenie / komórka H3 zamiast dokładnych współrzędnych), jeśli backend może wybierać użytkowników na tej podstawie |
| Zdjęcia (po MVP) | Usuwanie EXIF przed wysyłką, zgoda użytkownika, klasyfikacja/moderacja po stronie backendu |
| Cache offline (po MVP) | Przechowuj lokalnie tylko dane publiczne: schrony, procedury, ostatnie alerty, ostatni stan mapy |
| Transport | Komunikacja wyłącznie po HTTPS |
| Logi | Nie loguj lokalizacji ani treści zgłoszeń w logach produkcyjnych |

## Po stronie backendu (dla kontekstu)

RBAC (citizen, analyst, emergency operator, administrator), audit log dostępu do danych wrażliwych, przechowywanie danych tylko przez wymagany okres, agregacja przestrzenna wrażliwych informacji. Mobile nie implementuje tych mechanizmów, ale nie może ich osłabiać (np. przez cache szczegółowych danych).

## Ryzyka nadużyć do uwzględnienia w UX

- Fałszywe zgłoszenia i boty — mobile powinno tylko przekazywać identyfikator, ocena wiarygodności jest po stronie backendu (reputacja po MVP).
- Spam zgłoszeń — rozważ prosty limit/cooldown po stronie klienta jako uzupełnienie (nie jako jedyną ochronę).
- Wymuszenie odpowiedzi — nie sugeruj użytkownikowi „właściwej” odpowiedzi w pytaniu weryfikacyjnym.

## MVP vs produkcja

W MVP nie wymagamy produkcyjnego bezpieczeństwa klasy państwowej, ale zasada separacji Citizen/Command i brak wrażliwych danych w aplikacji powinny być zachowane od początku, bo trudno je dodać później.
