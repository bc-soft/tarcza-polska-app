# 03. Model danych

Modele opisują to, co aplikacja mobilna wysyła i odbiera. Kształt JSON jest do potwierdzenia z backendem (`06-kontrakt-api.md`). W Dart modele powinny być niemutowalne (np. `freezed`).

## Report

Pojedyncze zgłoszenie użytkownika (aplikacja go **tworzy**).

| Pole | Opis |
|---|---|
| `type` | `power_outage`, `water_outage`, `fuel_shortage`, `road_blocked`, `shelter_issue`, `other_hazard` |
| `location` | lat/lng (patrz `08-bezpieczenstwo-prywatnosc.md`) |
| `timestamp` | czas zgłoszenia |
| `description` | opcjonalny opis |
| `photo` | opcjonalne zdjęcie (po MVP) |
| `reporterId` | anonimowy identyfikator (nie dane osobowe) |
| `sourceConfidence` | wiarygodność źródła — ustawia backend, nie klient |

## Incident

Zdarzenie zbudowane z jednego lub wielu raportów (aplikacja go **odczytuje**).

Przykład: `Power outage — Poznań / Jeżyce`.

| Pole | Opis |
|---|---|
| `id`, `type`, `status` | podstawowe dane |
| `confidence` | poziom wiarygodności (patrz niżej) |
| `area` | obszar zdarzenia **[DO UZGODNIENIA]** — poligon GeoJSON vs lista komórek H3/geohash z confidence na komórkę |
| `startedAt` | czas rozpoczęcia |
| `lastConfirmedAt` | czas ostatniego potwierdzenia |
| `summary` | krótki opis dla Citizen (bez danych wrażliwych) |
| `responseStats` | zagregowane odpowiedzi, np. odsetek „NIE” wśród odpowiadających |

Citizen **nie** dostaje powiązanych raportów, dokładnych współrzędnych źródeł ani surowych danych (to domena Command).

## Verification Request

Pytanie do użytkownika, np. „Czy w tej chwili masz dostęp do prądu?”

Pola: `id`, `incidentId`, `question`, `type`, `expiresAt`.

## Verification Response

Odpowiedź użytkownika: `YES` / `NO` / `UNKNOWN` (w UI: TAK / NIE / NIE WIEM) + `requestId` + `timestamp` + lokalizacja w momencie odpowiedzi **[DO UZGODNIENIA]**.

## Shelter

| Pole | Opis |
|---|---|
| `id`, `name`, `location` | podstawowe dane |
| `status` | `open` / `closed` / `unknown` |
| `capacity` | pojemność |
| `availability` | po MVP: `many` / `few` / `full` |
| `lastConfirmedAt` | ostatnie potwierdzenie |
| `userReportsCount` | liczba raportów użytkowników |

Użytkownik może potwierdzić status schronu.

## Alert

Komunikat przypisany do obszaru: `id`, `title`, `body`, `area`, `severity`, `createdAt`, `incidentId?`.

## Confidence

Cztery poziomy, które aplikacja wyświetla:

| Poziom | Znaczenie |
|---|---|
| `UNVERIFIED` | Pojedynczy raport |
| `LIKELY` | Wiele niezależnych raportów z tego samego obszaru |
| `HIGH_CONFIDENCE` | Crowdsourcing potwierdzony przez większą liczbę użytkowników |
| `CONFIRMED` | Potwierdzenie społeczności + wiarygodne źródło zewnętrzne lub oficjalne |

Wartość liczbowa (np. 42% → 76% → 96% w demo) jest opcjonalnym dodatkiem. **[DO UZGODNIENIA]**: czy backend zwraca obie wartości.

### Zasada

Confidence liczy backend, możliwie deterministycznie, na podstawie: liczby niezależnych raportów, rozkładu geograficznego, świeżości, liczby potwierdzeń i zaprzeczeń, jakości źródeł zewnętrznych oraz wiarygodności reporterów. AI dostarcza dowodów, ale nie jest jedynym arbitrem. **Aplikacja mobilna nigdy nie liczy confidence samodzielnie.**
