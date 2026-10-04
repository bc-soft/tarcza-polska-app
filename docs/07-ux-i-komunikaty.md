# 07. UX i komunikaty

## Zasady

1. **Actionable information, nie surowe dane.** Użytkownik ma wiedzieć, co się dzieje i co może zrobić (np. gdzie jest najbliższy schron).
2. **Szybkość.** Zgłoszenie i odpowiedź na pytanie weryfikacyjne to maksymalnie 1–3 tapnięcia. Użytkownik może być zestresowany, mieć słaby zasięg i jedną rękę wolną.
3. **Jasny status wiarygodności.** Zawsze widać, czy informacja jest niezweryfikowana, prawdopodobna, wysoce wiarygodna czy potwierdzona.
4. **Nie straszyć.** Nie pokazujemy liczb ani szczegółów, które nie pomagają podjąć decyzji.
5. **„NIE WIEM” jest legalną odpowiedzią** i ma równą wagę wizualną co TAK i NIE.

## Stylistyka: command center (motyw jasny)

Aplikacja ma wyglądać jak mobilna końcówka **panelu operatora Tarczy**: techniczna, spokojna,
z czerwienią sygnałową jako jedynym mocnym akcentem. Odwzorowujemy język panelu WWW
(Command Center) — siatka w tle, moduły z cienkim obrysem, nagłówki wersalikami, dane
czcionką monospace — tylko w jasnej skali jasności, żeby czytało się w pełnym słońcu.

> Nie używamy godła ani oznaczeń sugerujących, że to oficjalna aplikacja rządowa.

| Element | Wytyczna |
|---|---|
| Tło | bardzo jasna szarość `#F3F5F8` z delikatną siatką (`GridBackground`, linie `#E6EAF0` co 44 px) |
| Karty / moduły | biel `#FFFFFF`, obrys 1 px `#E1E5EC`, promień 12 px, **bez cienia** |
| Element wewnątrz karty | `#F1F3F7` (kafelek liczby, pole formularza, pigułka), promień 8 px |
| Kolor akcji | czerwień sygnałowa `#E11D2E` — przycisk główny, aktywna zakładka, marka; tekst i ikony czerwone w `#C2142A` (kontrast na bieli) |
| Tekst | `#161A21` treść, `#59616F` drugorzędny, `#858E9D` etykiety wersalikowe, `#0B0E14` nagłówki |
| Nagłówki | **Barlow Condensed ExtraBold**, zawsze WERSALIKAMI („MAPA SYTUACYJNA”, „BRAK WODY”) |
| Tekst interfejsu | **Inter** (font zmienny, grubość osią `wght`) |
| Dane techniczne | **IBM Plex Mono** — identyfikatory, komórki H3, czasy, odległości |
| Nadtytuł (`Eyebrow`) | kropka sygnałowa + mała etykieta wersalikami z szeroką spacją („• COMMAND CENTER”) |
| Odznaki statusu | prostokątne (promień 6 px), wersalikami, ikona + tekst; `confirmed` z pełnym wypełnieniem |
| Kafelek liczby (`StatTile`) | etykieta wersalikami nad dużą liczbą — jak pasek statystyk w panelu |
| Wskaźnik (`MeterBar`) | cienki pasek 5–7 px w kolorze confidence |
| Mapa | podkład **Esri World Light Gray Canvas** (bez klucza API) + osobna warstwa podpisów rysowana nad strefami; kolor zostaje tylko dla statusów i stref H3 |
| Ikony | Material Symbols Outlined w kwadratowej ramce (`PanelIcon`), zawsze z podpisem |
| Nawigacja | dolny pasek z 4 zakładkami (**Mapa**, **Zgłoś**, **Alerty**, **Więcej**), etykiety wersalikami, aktywna na czerwono, krawędź górna `outline` |
| Przyciski | pełnej szerokości, 52 px, promień 8 px, etykiety wersalikami; główny czerwony, drugorzędny `#F1F3F7` z obrysem |
| Komunikaty | pełnoekranowe ekrany sukcesu z ikoną w ramce i jednym przyciskiem |
| Tryb ciemny | nie przewidujemy — motyw jest jeden (jasny) |

Implementacja: jeden `ThemeData` (Material 3, `Brightness.light`) w `lib/app/theme/`
(`tarcza_colors.dart` — paleta, `StatusColors` oraz helpery `readable()` / `tint()`,
`tarcza_typography.dart` — `TarczaFonts`, `app_theme.dart` — motyw). Komponenty wspólne
w `lib/core/widgets/`: `panel_widgets.dart` (`PanelBackdrop`, `GridBackground`, `Eyebrow`,
`DisplayHeading`, `PanelHeader`, `StatTile`, `MeterBar`, `PanelBadge`, `DataText`,
`PanelIcon`) oraz `widgets.dart` (`TarczaCard`, `StatusChip`, `ListTileRow`,
`PrimaryButton`, `InfoRow`).

`scaffoldBackgroundColor` jest przezroczysty — tło (kolor + siatkę) rysuje `PanelBackdrop`
w `builder` `MaterialApp`. Trasy przezroczyste (`OpenContainer`) muszą same opakować się
w `PanelBackdrop`, inaczej prześwituje przez nie przyciemnienie trasy.

Fonty leżą w `assets/fonts/` (Barlow Condensed SemiBold–Black, Inter zmienny,
IBM Plex Mono Medium/SemiBold) — wszystkie na licencji OFL.

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
- Sąsiadujące komórki H3 tego samego incydentu scalamy w jeden obszar (`dissolvePolygons`) —
  rysujemy wspólny obrys, bez siatki plastrów w środku.
- Granica zmienia się w czasie — animuj przejścia, żeby było widać, że obszar „żyje”.
- Marker użytkownika zawsze widoczny; przycisk „wróć do mojej pozycji” i znacznik domu (adres domowy).
- Schrony jako osobna warstwa z ikonami w kolorze statusu.
- Na dole mapy karta incydentu / pytania weryfikacyjnego: biały panel z obrysem w kolorze statusu.
- U góry mapy nagłówek panelu: logo, „• NA ŻYWO · TARCZA POLSKA” i tytuł „MAPA SYTUACYJNA” na gradientowym rozjaśnieniu.

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
