# 08. Bezpieczeństwo i prywatność (perspektywa mobile)

## Zasada główna

Publiczna aplikacja i Command Center **nie mają** tego samego poziomu szczegółowości. Citizen widzi dane zagregowane; szczegóły źródeł są wyłącznie po stronie Command. Backend to egzekwuje (widok Citizen nie zawiera pozycji zgłoszeń — to nie błąd API).

Przykład: Command wie, że kilka raportów pochodzi z konkretnych lokalizacji. Citizen widzi tylko „Potwierdzone zagrożenie w tym obszarze.”

## Lokalizacja: adres domowy + odświeżanie przez push

Backend potrzebuje pozycji urządzenia do dwóch rzeczy: wyboru, kogo zapytać w weryfikacji, i komu dostarczyć alert. Przechowuje **jedną** ostatnią pozycję (bez historii), indeksowaną w komórce H3 res 9 (~175 m). Bez pozycji urządzenie nie dostanie pytania ani alertu.

Przyjęty model (zamiast śledzenia w tle):

1. **Adres domowy (onboarding).** Użytkownik wpisuje adres domowy → geokodowanie → potwierdzenie pinezką na mapie → `PUT /devices/me/location`. To bazowa pozycja, przy której ludzie spędzają najwięcej czasu, i nie wymaga stałego dostępu do GPS. Adres można zmienić w ustawieniach.
2. **Okresowe przypomnienie push.** Co jakiś czas aplikacja (przez push) prosi użytkownika o wejście do aplikacji w celu aktualizacji lokalizacji, np. „Czy jesteś w domu? Otwórz Tarczę, aby zaktualizować swoją okolicę.” Push ma `data.type = "location_refresh"`.
3. **Aktualizacja przy otwarciu.** Po otwarciu aplikacji (z pusha albo ręcznie) — jeśli użytkownik zgodził się na lokalizację „podczas używania” — pobieramy jednorazowo pozycję GPS i wysyłamy `PUT /devices/me/location`. Bez zgody zostaje adres domowy. Użytkownik może też jednym tapnięciem „wrócić” do adresu domowego.
4. **Zgłoszenie** (`POST /reports`) również aktualizuje pozycję urządzenia (robi to backend).
5. **Brak lokalizacji w tle.** Nie prosimy o uprawnienie „zawsze”.

Throttling: wysyłamy nową pozycję tylko gdy zmieniła się komórka H3 (`h3_flutter`) i nie częściej niż limit backendu (30/min).

**[DO UZGODNIENIA]** z backendem (agent backend aktualizuje model danych):
- czy adres domowy jest osobnym polem (`homeLocation`), czy nadpisuje `lastLocation` (wtedy po powrocie GPS-owa pozycja zastępuje dom do następnej aktualizacji),
- kto wysyła push `location_refresh` (backend wg `locationUpdatedAt` vs lokalny harmonogram `flutter_local_notifications`) i jak często (propozycja: gdy pozycja starsza niż 24 h, max 1 dziennie, nie w nocy),
- czy geokodowanie robimy po stronie aplikacji (`geocoding`) czy przez endpoint backendu.

## Co to znaczy dla klienta Flutter

| Obszar | Wymaganie |
|---|---|
| Modele Citizen | Nie zawierają współrzędnych poszczególnych raportów ani danych źródłowych |
| Tożsamość | Anonimowe urządzenie (JWT z `POST /devices`), bez danych osobowych. Docelowo (nice to have) potwierdzenie przez mObywatela przeciw botom/Sybil |
| Token | Wyłącznie w `flutter_secure_storage`; przy 401 usuń i zarejestruj ponownie |
| Adres domowy | Lokalnie w `shared_preferences` (tekst + współrzędne); do backendu tylko współrzędne. Nie logujemy go |
| Zgody | Powiadomienia i lokalizacja „podczas używania” — z jasnym wyjaśnieniem, po co (weryfikacja i alerty w okolicy). Aplikacja działa także bez GPS (adres domowy) |
| Push | Token FCM/APNs nie jest powiązany z tożsamością osoby; treść pusha nie zawiera danych osobowych |
| Zdjęcia (po MVP) | Usuwanie EXIF przed wysyłką, zgoda użytkownika, moderacja po stronie backendu |
| Cache offline (po MVP) | Tylko dane publiczne: schrony, procedury, ostatnie alerty, ostatni stan mapy |
| Transport | Produkcja wyłącznie HTTPS; HTTP tylko lokalnie w dev (`backend-specs.md` §1) |
| Logi | Nie loguj lokalizacji, adresu ani treści zgłoszeń w logach produkcyjnych |

## Po stronie backendu (dla kontekstu)

RBAC, audit log dostępu do danych wrażliwych (np. szczegóły incydentu w Command), brak historii lokalizacji, agregacja przestrzenna na H3, limity (10 zgłoszeń / 10 min, 30 aktualizacji lokalizacji / min, 1 pytanie / 10 min na urządzenie). Mobile nie może tych mechanizmów osłabiać (np. przez cache szczegółowych danych).

## Ryzyka nadużyć do uwzględnienia w UX

- Fałszywe zgłoszenia i boty — mobile przekazuje tylko token urządzenia; wiarygodność ocenia backend.
- Spam zgłoszeń — przy 429 pokaż komunikat, nie ponawiaj automatycznie.
- Wymuszenie odpowiedzi — nie sugeruj „właściwej” odpowiedzi; wyświetl dosłownie `context` + `question` i trzy równorzędne przyciski.
- Push `location_refresh` nie może być natarczywy — rzadko, z możliwością wyłączenia w ustawieniach.

## MVP vs produkcja

W MVP nie wymagamy bezpieczeństwa klasy państwowej, ale separacja Citizen/Command, brak wrażliwych danych w aplikacji i brak śledzenia w tle obowiązują od początku.
