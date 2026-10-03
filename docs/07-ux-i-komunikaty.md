# 07. UX i komunikaty

## Zasady

1. **Actionable information, nie surowe dane.** Użytkownik ma wiedzieć, co się dzieje i co może zrobić (np. gdzie jest najbliższy schron).
2. **Szybkość.** Zgłoszenie i odpowiedź na pytanie weryfikacyjne to maksymalnie 1–3 tapnięcia. Użytkownik może być zestresowany, mieć słaby zasięg i jedną rękę wolną.
3. **Jasny status wiarygodności.** Zawsze widać, czy informacja jest niezweryfikowana, prawdopodobna, wysoce wiarygodna czy potwierdzona.
4. **Nie straszyć.** Nie pokazujemy liczb ani szczegółów, które nie pomagają podjąć decyzji.
5. **„NIE WIEM” jest legalną odpowiedzią** i ma równą wagę wizualną co TAK i NIE.

## Stylistyka: w duchu mObywatela

Aplikacja ma wyglądać jak „urzędowa”, godna zaufania aplikacja państwowa — wizualnie bliska **mObywatelowi**: spokojna, czytelna, bez krzykliwych kolorów poza statusami zagrożeń.

> Inspiracja stylem, nie kopia: nie używamy logo mObywatela, godła ani oznaczeń sugerujących, że to oficjalna aplikacja rządowa.

| Element | Wytyczna |
|---|---|
| Tło | jasne: biel na kartach, bardzo jasna szarość (`#F5F6F8`) jako tło ekranu |
| Kolor główny | granat/niebieski „urzędowy” (propozycja `#0052A5`) — przyciski główne, aktywne zakładki, linki |
| Akcent | czerwień biało-czerwona (`#DC143C`) oszczędnie: wyróżnienia marki, alerty `danger` |
| Karty | białe, zaokrąglone rogi (~12–16 px), delikatny cień lub cienki obrys; jedna informacja = jedna karta (jak „dokumenty” w mObywatelu) |
| Typografia | bezszeryfowa, duża i czytelna (system / Inter / Lato); nagłówki pogrubione, granatowe; tekst ciemnoszary |
| Nawigacja | dolny pasek (`NavigationBar`) z 3–4 zakładkami: **Mapa**, **Zgłoś**, **Alerty**, **Więcej** (schrony, ustawienia) |
| Ikony | proste, liniowe (Material Symbols Outlined), zawsze z podpisem |
| Przyciski | pełnej szerokości, wysokie (min. 48–56 px), zaokrąglone; główny wypełniony granatem, drugorzędny obrysowany |
| Listy | jak w mObywatelu: wiersz z ikoną po lewej, tytułem i podtytułem, strzałką `›` po prawej |
| Komunikaty | pełnoekranowe ekrany sukcesu/potwierdzenia z dużą ikoną i jednym przyciskiem („Dziękujemy…”) |
| Tryb ciemny | po MVP; na demo tylko jasny |

Implementacja: jeden `ThemeData` (Material 3, `ColorScheme.fromSeed` nadpisany powyższymi kolorami) w `lib/app/theme/`, kolory statusów jako `ThemeExtension`, komponenty wspólne w `lib/core/widgets/` (`TarczaCard`, `StatusChip`, `PrimaryButton`, `ListTileRow`).

## Statusy confidence w UI

Kolory zgodne z panelem operatora (`backend-specs.md` §5), etykiety z backendu (`confidenceLabel`):

| `confidenceLevel` | Etykieta | Kolor | Znaczenie dla użytkownika |
|---|---|---|---|
| `unverified` | Niezweryfikowane | `#64748B` szary | pojedyncze zgłoszenie, traktuj ostrożnie |
| `likely` | Prawdopodobne | `#F59E0B` bursztyn | wiele niezależnych zgłoszeń |
| `high` | Wysoka wiarygodność | `#F97316` pomarańcz | potwierdzone przez wielu mieszkańców |
| `confirmed` | Potwierdzone | `#EF4444` czerwień | społeczność + źródło oficjalne/zewnętrzne |

Znaczenie nie może opierać się wyłącznie na kolorze (dostępność) — zawsze ikona + tekst. `confidenceScore` pokazujemy jako procent (np. „76%”), `community.agreementPct` jako „Problem zgłasza 86% odpowiadających”.

## Statusy schronu

| `status` | Etykieta | Kolor |
|---|---|---|
| `open` | Otwarty | zielony |
| `full` | Pełny | bursztyn |
| `closed` | Zamknięty | czerwony |
| `unknown` | Brak danych | szary |

## Ważność alertu

| `severity` | Kolor |
|---|---|
| `info` | niebieski |
| `warning` | bursztyn |
| `danger` | czerwień |

## Mapa

- Incydent z `MultiPolygon`: wypełnienie ~35% przezroczystości + obrys w kolorze confidence. Incydent z `Point`: marker.
- Granica zmienia się w czasie — animuj przejścia, żeby było widać, że obszar „żyje”.
- Marker użytkownika zawsze widoczny; przycisk „wróć do mojej pozycji” i znacznik domu (adres domowy).
- Schrony jako osobna warstwa z ikonami w kolorze statusu.
- Na dole mapy karta (bottom sheet) w stylu mObywatela z incydentem / pytaniem weryfikacyjnym.

## Teksty

**Verification prompt** (wyświetlamy dosłownie `context` + `question` z API)
> W Twojej okolicy zgłoszono: brak prądu.
> Czy w tej chwili masz dostęp do prądu?
> [TAK] [NIE] [NIE WIEM] — z odliczaniem do `expiresAt` (90 s)

**Po odpowiedzi** — tekst `thanks` z API:
> Dziękujemy. Twoja odpowiedź pomaga wyznaczyć zasięg problemu.

**Po zgłoszeniu**
> Dziękujemy, sprawdzamy to z innymi mieszkańcami.

**Przypomnienie o lokalizacji (push `location_refresh`)** — treść wysyła backend (ustalone)
> Czy nadal jesteś w tej okolicy? Otwórz Tarczę, aby otrzymywać właściwe alerty.

**Propozycja trybu czuwania**
> Włącz tryb czuwania, aby dostawać alerty i pytania tam, gdzie właśnie jesteś — nie tylko w domu. Tarcza nie zapisuje historii Twoich lokalizacji.
> [Włącz] [Nie teraz]

**Alert / INFORM** — `title` + `body` z API, np.
> Potwierdzono awarię prądu. Problem zgłasza większość użytkowników w Twojej okolicy.
> [Pokaż na mapie] [Najbliższy schron]

**Citizen widzi** (bez dokładnych współrzędnych źródeł):
> Potwierdzone zagrożenie w tym obszarze.

## Stany specjalne do zaprojektowania

- onboarding: zgoda na powiadomienia, adres domowy, zgoda na lokalizację (opcjonalna), propozycja trybu czuwania (zgoda „zawsze”, dwuetapowa),
- tryb czuwania aktywny: stała notyfikacja na Androidzie („Tarcza czuwa w Twojej okolicy”), status i przełącznik w ustawieniach,
- brak lokalizacji / odmowa GPS (działamy na adresie domowym),
- brak sieci (komunikat; pełny offline po MVP),
- pytanie weryfikacyjne wygasło (410) / już odpowiedziane (409 → jak sukces),
- limit zgłoszeń (429) — komunikat bez automatycznego ponawiania,
- zgłoszenie wysłane, incydent jeszcze nieprzypisany,
- loading i animacje (faza Polish).
