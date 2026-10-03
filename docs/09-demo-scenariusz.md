# 09. Scenariusz demo

Demo pokazuje cały sens Tarczy w kilka minut: **społeczeństwo → system → operator → społeczeństwo**.

## Przebieg

| # | Wydarzenie | Co widać na mobile |
|---|---|---|
| 1 | Kilku użytkowników zgłasza BRAK PRĄDU | Zgłoszenie pojawia się w systemie |
| 2 | Backend wykrywa cluster. Command: *POSSIBLE POWER OUTAGE*, confidence 42% | Na mapie pojawia się wstępna strefa (niezweryfikowana/prawdopodobna) |
| 3 | System wysyła pytanie do użytkowników w pobliżu: „Czy w tej chwili masz dostęp do prądu?” | **Verification prompt** u użytkownika (push + `pending`), odliczanie 90 s |
| 4 | Większość odpowiada NIE. Confidence 42% → 76% | Status incydentu rośnie, strefa się pogłębia |
| 5 | System pyta użytkowników dalej od centrum. Część odpowiada TAK | Granica strefy zawęża się / przesuwa |
| 6 | System automatycznie wyznacza granicę awarii | Dynamiczna strefa na mapie |
| 7 | AI / operator dołącza komunikat operatora energetycznego. Confidence 76% → 96%, `confirmed` | Status zmienia się na „Potwierdzone” |
| 8 | Operator wysyła komunikat do wyznaczonego obszaru | — |
| 9 | Użytkownik w obszarze otrzymuje: „Potwierdzono awarię energetyczną w Twojej okolicy.” | **Ekran alertu** |

## Co mobile musi umieć, żeby to pokazać

- Pokazać verification prompt i wysłać odpowiedź (kroki 3–5).
- Animowanie zmiany confidence i granicy strefy (kroki 4–6).
- Pokazać zmianę statusu na CONFIRMED (krok 7).
- Odebrać i wyświetlić alert dla obszaru (krok 9).

## Dane seed / mock

Zalecane przygotować:

- kilkanaście pozycji użytkowników wokół wybranego punktu (np. Poznań / Jeżyce),
- sekwencję odpowiedzi TAK/NIE z rosnącą odległością od centrum,
- kilka schronów z różnymi statusami,
- gotowy alert tekstowy dla kroku 9,
- wartości confidence: 42% → 76% → 96%.

Tryb mock (`05-architektura-flutter.md`) powinien umieć odegrać cały scenariusz sterowany ręcznie lub timerem, żeby demo było powtarzalne i niezależne od backendu. Jeśli backend będzie gotowy, przełącz na niego bez zmian w UI.

## Demo na prawdziwym backendzie

Szczegóły w `backend-specs.md` §14. Skrót (w repo backendu):

```bash
make up && make seed      # backend + schrony w Poznaniu + operatorzy
make simulate             # 700 wirtualnych urządzeń + awaria prądu na Jeżycach (52.4121, 16.9012)
```

Telefon demo: adres domowy na Jeżycach (np. `52.4125, 16.9020`), push skonfigurowany (`FIREBASE_CREDENTIALS` w backendzie). Alert wysyłamy z panelu operatora (`/command`, formularz „Wyślij komunikat do obszaru”).

## Checklista przed prezentacją

- [ ] Scenariusz przechodzi od początku do końca bez restartu.
- [ ] Brak ekranów ładowania, które „wiszą”.
- [ ] Kolory statusów czytelne z odległości (rzutnik).
- [ ] Pushe dochodzą na Androidzie i iOS (APNs skonfigurowane w Firebase).
- [ ] Zapasowy plan: nagrany film lub tryb mock offline.
