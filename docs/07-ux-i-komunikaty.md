# 07. UX i komunikaty

## Zasady

1. **Actionable information, nie surowe dane.** Użytkownik ma wiedzieć, co się dzieje i co może zrobić (np. gdzie jest najbliższy punkt pomocy).
2. **Szybkość.** Zgłoszenie i odpowiedź na pytanie weryfikacyjne to maksymalnie 1–3 tapnięcia. Użytkownik może być zestresowany, mieć słaby zasięg i jedną rękę wolną.
3. **Jasny status wiarygodności.** Zawsze widać, czy informacja jest niepotwierdzona, prawdopodobna, wysoce wiarygodna czy potwierdzona.
4. **Nie straszyć.** Nie pokazujemy surowych liczb ani szczegółów, które nie pomagają podjąć decyzji.
5. **„NIE WIEM” jest legalną odpowiedzią** i ma równą wagę wizualną co TAK i NIE.

## Statusy confidence w UI

| Poziom | Etykieta w UI | Kolor (propozycja) | Znaczenie dla użytkownika |
|---|---|---|---|
| `UNVERIFIED` | Niezweryfikowane | szary | Pojedyncze zgłoszenie, traktuj ostrożnie |
| `LIKELY` | Prawdopodobne | żółty | Wiele niezależnych zgłoszeń |
| `HIGH_CONFIDENCE` | Wysoka pewność | pomarańczowy | Potwierdzone przez wielu użytkowników |
| `CONFIRMED` | Potwierdzone | czerwony / niebieski | Źródło oficjalne lub zewnętrzne |

Kolory są **[REKOMENDACJA]**; ważne, żeby nie opierać znaczenia wyłącznie na kolorze (dostępność) — dodaj ikonę i tekst.

## Statusy schronu

| Status | Etykieta | Kolor |
|---|---|---|
| `open` | Otwarty | zielony |
| `closed` | Zamknięty | czerwony |
| `unknown` | Brak danych | szary |

Po MVP: dostępność miejsc (dużo / mało / pełny).

## Mapa

- Strefa incydentu: półprzezroczysty obszar, kolor zależny od typu/confidence.
- Granica strefy może się zmieniać — animuj przejścia, żeby użytkownik widział, że obszar „żyje”.
- Marker użytkownika zawsze widoczny; przycisk „wróć do mojej pozycji”.
- Schrony jako osobna warstwa z własnymi ikonami.

## Teksty (przykłady z projektu)

**Verification prompt**
> W Twojej okolicy zgłoszono brak prądu.
> Czy u Ciebie również występuje ten problem?
> [TAK] [NIE] [NIE WIEM]

**Pytanie weryfikacyjne (krótkie)**
> Czy w tej chwili masz dostęp do prądu?

**Alert / INFORM**
> Potwierdzono awarię energetyczną w Twojej okolicy.

**Rozszerzony INFORM**
> Potwierdzono rozległą awarię energetyczną w Twoim obszarze. Problem zgłasza 86% odpowiadających użytkowników. Najbliższy działający punkt pomocy znajduje się 1,2 km od Ciebie.

**Citizen widzi** (bez dokładnych współrzędnych źródeł):
> Potwierdzone zagrożenie w tym obszarze.

## Stany specjalne do zaprojektowania

- brak lokalizacji / brak zgody na lokalizację,
- brak sieci (komunikat; pełny tryb offline po MVP),
- pytanie weryfikacyjne wygasło,
- zgłoszenie wysłane / w kolejce,
- loading i animacje (faza Polish).
