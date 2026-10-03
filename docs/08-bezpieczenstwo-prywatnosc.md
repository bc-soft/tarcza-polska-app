# 08. Bezpieczeństwo i prywatność (perspektywa mobile)

## Zasada główna

Publiczna aplikacja i Command Center **nie mają** tego samego poziomu szczegółowości. Citizen widzi dane zagregowane; szczegóły źródeł są wyłącznie po stronie Command. Backend to egzekwuje (widok Citizen nie zawiera pozycji zgłoszeń — to nie błąd API).

Przykład: Command wie, że kilka raportów pochodzi z konkretnych lokalizacji. Citizen widzi tylko „Potwierdzone zagrożenie w tym obszarze.”

## Lokalizacja: adres domowy, śledzenie w tle (opt-in), odświeżanie przez push

Backend potrzebuje pozycji urządzenia do dwóch rzeczy: wyboru, kogo zapytać w weryfikacji, i komu dostarczyć alert. Przechowuje **jedną** ostatnią pozycję (bez historii), indeksowaną w komórce H3 res 9 (~175 m). Bez pozycji urządzenie nie dostanie pytania ani alertu.

Przyjęty model — warstwy od najdokładniejszej do zapasowej:

1. **Adres domowy (onboarding).** Użytkownik wpisuje adres domowy → geokodowanie → potwierdzenie pinezką na mapie → `PUT /devices/me/location`. To bazowa pozycja, przy której ludzie spędzają najwięcej czasu, i nie wymaga stałego dostępu do GPS. Adres można zmienić w ustawieniach.
2. **Okresowe przypomnienie push.** Co jakiś czas aplikacja (przez push) prosi użytkownika o wejście do aplikacji w celu aktualizacji lokalizacji, np. „Czy jesteś w domu? Otwórz Tarczę, aby zaktualizować swoją okolicę.” Push ma `data.type = "location_refresh"`.
3. **Aktualizacja przy otwarciu.** Po otwarciu aplikacji (z pusha albo ręcznie) — jeśli użytkownik zgodził się na lokalizację „podczas używania” — pobieramy jednorazowo pozycję GPS i wysyłamy `PUT /devices/me/location`. Bez zgody zostaje adres domowy. Użytkownik może też jednym tapnięciem „wrócić” do adresu domowego.
4. **Zgłoszenie** (`POST /reports`) również aktualizuje pozycję urządzenia (robi to backend).
5. **Śledzenie w tle („Tryb czuwania”, opt-in).** Jeśli użytkownik zgodzi się na lokalizację „zawsze”, aplikacja aktualizuje pozycję także wtedy, gdy jest w tle lub zamknięta. Bez tej zgody działają punkty 1–3. Szczegóły niżej.

Pozycja wysyłana do backendu to zawsze **najświeższa z dostępnych**: tło → GPS przy otwarciu → adres domowy.

### Śledzenie w tle — jak to robimy

Cel nie wymaga precyzji: backend potrzebuje tylko komórki H3 res 9 (~175 m). Dlatego śledzimy z **niską dokładnością i niskim zużyciem baterii**, a do backendu wysyłamy pozycję tylko po zmianie komórki H3 (i w limicie 30/min).

| Platforma | Mechanizm | Działa gdy aplikacja… | Uwagi |
|---|---|---|---|
| **iOS** | **Significant Location Change** (`CLLocationManager.startMonitoringSignificantLocationChanges`) | w tle **i po zamknięciu** — system sam wybudza aplikację | zdarzenie co ~500 m (opiera się o stacje bazowe/Wi-Fi), minimalne zużycie baterii. Wymaga zgody „Zawsze” (`NSLocationAlwaysAndWhenInUseUsageDescription`) i `UIBackgroundModes: location`. Uwaga: wybudzenie trwa ~10 s — wysyłka musi być krótka |
| **Android** | foreground service z `geolocator` (`AndroidSettings` + `ForegroundNotificationConfig`), `LocationAccuracy.low`, `distanceFilter` ~150 m | w tle (stała notyfikacja „Tarcza czuwa w Twojej okolicy”) | wymaga `ACCESS_BACKGROUND_LOCATION` (osobny krok zgody od Androida 11) i `FOREGROUND_SERVICE_LOCATION` (Android 14+). Po ubiciu procesu przez system wznowienie przy następnym otwarciu / pushu |
| **Android (zapas)** | `workmanager` — zadanie okresowe co 15 min: jednorazowa pozycja + `PUT` | także po ubiciu procesu | 15 min to minimum systemowe; Doze może opóźniać |

iOS nie jest więc „ciężki” — tylko nie da się na nim ciągłego GPS-a w tle bez dużego kosztu baterii i ryzyka odrzucenia w App Store. Significant Location Change jest dokładnie do takiego przypadku i jest wystarczający dla H3 res 9.

Zasady trybu czuwania:

- **Opt-in**, proponowany po onboardingu (nie wymuszany), z jasnym wyjaśnieniem: „Dzięki temu dostaniesz alert i pytanie weryfikacyjne tam, gdzie właśnie jesteś, a nie tylko w domu.” Wyłączany w ustawieniach jednym przełącznikiem.
- Zgoda „Zawsze” prosi system w dwóch krokach (najpierw „podczas używania”, potem „zawsze”) — tak wymagają iOS i Android 11+.
- Gdy tryb jest aktywny i pozycja świeża, push `location_refresh` jest zbędny — backend wysyła go tylko przy przestarzałym `locationUpdatedAt`, więc obie warstwy się nie dublują.
- Bez historii: w tle tylko nadpisujemy jedną pozycję w backendzie, lokalnie nie zapisujemy śladu.
- App Store / Google Play wymagają uzasadnienia lokalizacji w tle (opis w recenzji, deklaracja w Play Console). Na hackathon wystarczą buildy deweloperskie.

Throttling: wysyłamy nową pozycję tylko gdy zmieniła się komórka H3 (`h3_flutter`) i nie częściej niż limit backendu (30/min).

**Ustalone z backendem (2026-10-03, spec 1.1.0):**
- adres domowy **nadpisuje** jedyną pozycję (`lastLocation`; wygrywa ostatni `PUT`). `PUT /devices/me/location` przyjmuje `source: home | gps | background` (brak = `gps`), profil zwraca `locationSource`. Osobne `homeLocation` odłożone na po demo,
- push `location_refresh` wysyła **backend**: gdy `locationUpdatedAt` starsze niż 24 h, maks. 1 / dobę, nie między 21:00 a 8:00, nie do urządzeń niewidzianych od 30 dni. Użytkownik wyłącza przypomnienia przez `PUT /devices/me/preferences { "locationRefresh": false }` (przełącznik w ustawieniach),
- geokodowanie zostaje **systemowe** (`geocoding`) — backend nie zna adresu, tylko współrzędne.

## Co to znaczy dla klienta Flutter

| Obszar | Wymaganie |
|---|---|
| Modele Citizen | Nie zawierają współrzędnych poszczególnych raportów ani danych źródłowych |
| Tożsamość | Anonimowe urządzenie (JWT z `POST /devices`), bez danych osobowych. Docelowo (nice to have) potwierdzenie przez mObywatela przeciw botom/Sybil |
| Token | Wyłącznie w `flutter_secure_storage`; przy 401 usuń i zarejestruj ponownie |
| Adres domowy | Lokalnie w `shared_preferences` (tekst + współrzędne); do backendu tylko współrzędne. Nie logujemy go |
| Zgody | Powiadomienia i lokalizacja „podczas używania” — z jasnym wyjaśnieniem, po co (weryfikacja i alerty w okolicy). Lokalizacja „zawsze” tylko dla trybu czuwania (opt-in). Aplikacja działa także bez GPS (adres domowy) |
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

W MVP nie wymagamy bezpieczeństwa klasy państwowej, ale separacja Citizen/Command, brak wrażliwych danych w aplikacji, brak historii lokalizacji i dobrowolność śledzenia w tle obowiązują od początku.
