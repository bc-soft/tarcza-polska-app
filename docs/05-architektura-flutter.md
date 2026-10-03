# 05. Architektura Flutter

> Cel: szybki hackathon, możliwość pracy bez działającego backendu, a jednocześnie kod, który da się przełączyć na prawdziwe API bez przepisywania ekranów.
> Źródła prawdy dla API: [`openapi.json`](openapi.json) (kształt endpointów) i [`backend-specs.md`](backend-specs.md) (zachowanie, przykładowe odpowiedzi).

## Zasada nadrzędna: warstwy i podmiana mock/remote

```
UI (widgets)  →  BLoC / Cubit  →  Repository (interfejs)  →  Mock* | Remote* (Retrofit)
```

- Każde repozytorium ma interfejs (`abstract interface class`) i dwie implementacje: `Mock*` (dane lokalne + scenariusz demo z `09-demo-scenariusz.md`) i `Remote*` (wywołuje wygenerowanego klienta Retrofit).
- Wybór implementacji w jednym miejscu: rejestracja w `get_it` sterowana flagą `--dart-define=USE_MOCKS=true`.
- BLoC-i znają tylko interfejsy repozytoriów i modele domenowe. Nie importują DTO z klienta API ani `Dio`.

## Paczki

| Obszar | Paczka | Uwagi |
|---|---|---|
| State management | `flutter_bloc` + `bloc` | `Cubit` dla prostych ekranów, `Bloc` (eventy) tam, gdzie są strumienie i współbieżność (mapa, weryfikacja) |
| Równość stanów | `equatable` | stany i eventy BLoC |
| Transformacje eventów | `bloc_concurrency` | `droppable()` dla wysyłki odpowiedzi/zgłoszenia, `restartable()` dla odświeżania mapy po zmianie bbox |
| DI | `get_it` | rejestracja repozytoriów, klienta API, serwisów; BLoC-i tworzone przez `BlocProvider` z zależnościami z `get_it` |
| Nawigacja | `go_router` | deep linki z pushy (`/verification/:id`, `/alerts/:id`) |
| HTTP | `dio` + `retrofit` | klient generowany z `openapi.json`, patrz niżej |
| Generator klienta | `swagger_parser` (dev) + `retrofit_generator`, `json_serializable`, `build_runner` | |
| Modele domenowe | `freezed` + `json_serializable` | niemutowalne; mapowane z DTO |
| Mapa | `flutter_map` + `latlong2` (OSM) | alternatywa: `maplibre_gl` z OpenFreeMap; obie bez klucza API |
| H3 | `h3_flutter` | komórki H3 (rozdzielczość 9), patrz niżej |
| Lokalizacja (GPS) | `geolocator` | pozycja przy otwarciu + strumień w tle na Androidzie (foreground service) |
| Lokalizacja w tle iOS | własny `MethodChannel` (Swift, `CLLocationManager`) | Significant Location Change — `geolocator` tego nie obsługuje, a działa po zamknięciu aplikacji |
| Zadania okresowe (Android) | `workmanager` | zapasowa aktualizacja pozycji co 15 min |
| Adres domowy → współrzędne | `geocoding` | geokodowanie systemowe (ustalone — backend nie daje endpointu) |
| Push | `firebase_core` + `firebase_messaging` | Android: FCM; iOS: APNs przez FCM |
| Powiadomienia na pierwszym planie | `flutter_local_notifications` | wyświetlenie pusha, gdy aplikacja jest otwarta |
| Bezpieczne przechowywanie | `flutter_secure_storage` | token JWT urządzenia |
| Ustawienia lokalne | `shared_preferences` | adres domowy, flagi onboardingu |

Usunięte z poprzedniej wersji: `flutter_riverpod` (zastąpiony przez BLoC) i `provider` (zbędny przy `flutter_bloc`). Z `pubspec.yaml` usuń `provider`, jeśli nie jest używany bezpośrednio.

## Klient API: Retrofit z `openapi.json`

Klient generujemy z [`openapi.json`](openapi.json) paczką `swagger_parser`, która produkuje interfejsy `@RestApi()` Retrofit i DTO `json_serializable`/`freezed`. Plik spec kopiujemy z repo backendu (tam: `make openapi`) do `docs/openapi.json` i commitujemy razem z wygenerowanym kodem.

`swagger_parser.yaml` (w root projektu):

```yaml
swagger_parser:
  schema_path: docs/openapi.json
  output_directory: lib/data/remote/api
  name: tarcza_api
  json_serializer: freezed
  use_freezed3: true
  root_client: true
  root_client_name: TarczaApi
  include_paths:
    - "/api/v1/**"          # endpointy /api/command/* są dla panelu operatora, nie generujemy ich
  unknown_enum_value: true  # nowe wartości enumów z backendu nie wywalą parsowania
```

`build.yaml` (kolejność generatorów):

```yaml
global_options:
  freezed:
    runs_before:
      - json_serializable
  json_serializable:
    runs_before:
      - retrofit_generator
```

Generowanie:

```bash
dart run swagger_parser
dart run build_runner build -d
```

### Luki w spec (ważne)

Aktualny `openapi.json` opisuje schematy **requestów** (`RegisterDeviceRequest`, `UpdateLocationRequest`, `CreateReportRequest`, `RespondRequest`, `ConfirmShelterStatusRequest`, enumy `ReportType`, `ShelterStatus`, `VerificationAnswer`), ale większość **odpowiedzi** nie ma schematu (jedynie `POST /devices`). Wygenerowane metody zwrócą wtedy `dynamic`/`void`.

Do czasu uzupełnienia spec przez backend:

1. Modele odpowiedzi piszemy ręcznie w `lib/data/remote/dto/` na podstawie przykładów z `backend-specs.md` (sekcje 3–9).
2. Metody bez schematu odpowiedzi opakowujemy w `Remote*Repository` (`fromJson` na `dynamic`) albo dopisujemy ręczny interfejs Retrofit z typowanymi zwrotkami.
3. Po aktualizacji spec (agent backendu aktualizuje model danych) regenerujemy klienta i usuwamy ręczne DTO.

**Stan na spec 1.1.0:** schematy odpowiedzi są w `openapi.json`, ręczne DTO odpowiedzi zostały usunięte; repozytoria mapują wygenerowane modele w `lib/data/remote/mappers.dart`. `MapFeature.properties` to `oneOf` z dyskryminatorem `kind` (`swagger_parser` → sealed union, `fallback_union: unknown` dla nowych `kind`). Ręcznie zostaje tylko koperta błędów `ErrorResponse` (`lib/data/remote/dto/`).

### Dio: interceptory

- `AuthInterceptor` — dokleja `Authorization: Bearer <token>` z `flutter_secure_storage`; pomija `POST /api/v1/devices` i `GET /api/v1/health`.
- Obsługa 401 — usuwa token i ponownie rejestruje urządzenie (`POST /devices`), potem ponawia żądanie raz.
- `ErrorInterceptor` — mapuje `{"error": {"code", "message", "violations"}}` na wyjątki domenowe (`ValidationFailure` z polami, `RateLimited`, `QuestionExpired` dla 410, `AlreadyAnswered` dla 409 itd.). BLoC-i łapią wyjątki domenowe, nie `DioException`.
- `baseUrl` z `--dart-define=API_BASE_URL=...` (patrz `backend-specs.md` §1).

## Push: Firebase Cloud Messaging / Apple APNs

- Jedna integracja `firebase_messaging` dla obu platform. Na iOS FCM dostarcza wiadomości przez **APNs**: w konsoli Firebase wgrywamy klucz APNs (`.p8`), w Xcode włączamy capability *Push Notifications* i *Background Modes → Remote notifications*.
- Pliki konfiguracyjne: `android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist` (ten sam projekt Firebase co konto serwisowe backendu). Nie commitujemy ich do publicznego repo.
- Token FCM: przy rejestracji urządzenia (`pushToken` w `POST /devices`) i przy każdej rotacji (`onTokenRefresh` → `PUT /devices/me/push-token`).
- Obsługa: `onMessage` (pierwszy plan: od razu pokaż ekran/arkusz), `onMessageOpenedApp` i `getInitialMessage` (start z pusha → `go_router`), `onBackgroundMessage` (tylko logika lekka, bez UI).
- `PushService` (singleton w `get_it`) wystawia `Stream<PushEvent>`; BLoC-i subskrybują strumień zamiast bezpośrednio `FirebaseMessaging`.

Typy pushy (`data.type`):

| `data.type` | Pola | Akcja |
|---|---|---|
| `verification` | `verificationId`, `incidentId`, `incidentType`, `expiresAt` | ekran pytania weryfikacyjnego (wygasłe z pusha pomijamy) |
| `alert` | `alertId` | ekran alertu |
| `location_refresh` | — | otwarcie aplikacji → aktualizacja lokalizacji. Wysyła backend, patrz `08-bezpieczenstwo-prywatnosc.md` |

Aplikacja musi działać także bez pushy (backend lokalnie tylko loguje pushe, gdy brak `FIREBASE_CREDENTIALS`): polling `GET /verifications/pending` i `GET /alerts` przy starcie, wznowieniu i co 30 s na ekranie mapy.

## Lokalizacja: adres domowy, tło (opt-in), odświeżanie na żądanie

Model (szczegóły i uzasadnienie w `08-bezpieczenstwo-prywatnosc.md`):

1. **Onboarding**: użytkownik wpisuje adres domowy → geokodowanie (`geocoding`) → potwierdzenie pinezką na mapie → `PUT /devices/me/location`. To jest bazowa pozycja urządzenia.
2. **Otwarcie aplikacji** (ręcznie albo z pusha `location_refresh`): jeśli jest zgoda na GPS, pobieramy jednorazowo pozycję (`geolocator`) i wysyłamy `PUT /devices/me/location`. Bez zgody — zostaje adres domowy.
3. **Tryb czuwania (opt-in, zgoda „zawsze”)**: aktualizacja w tle, także po zamknięciu aplikacji (iOS). Szczegóły platformowe w `08-bezpieczenstwo-prywatnosc.md`.

Za to odpowiada `LocationRepository` + `LocationCubit` (stan: `homeAddress`, `lastSentAt`, `h3Cell`, `source: home | gps | background`, `backgroundEnabled`).

### Śledzenie w tle — implementacja

```
BackgroundLocationService (interfejs, core/location/)
  ├─ IosSignificantChangeService   — MethodChannel → Swift: startMonitoringSignificantLocationChanges
  └─ AndroidForegroundService      — geolocator getPositionStream(AndroidSettings + ForegroundNotificationConfig)
                                     + workmanager (co 15 min) jako zapas
```

- **Wysyłka z tła bez UI.** Po wybudzeniu przez system (szczególnie iOS po zamknięciu aplikacji) nie ma działającego drzewa widgetów ani BLoC-ów. Dlatego wysyłka pozycji w tle to osobna, minimalna ścieżka: odczyt tokena i `API_BASE_URL` → policzenie komórki H3 → jeśli inna niż ostatnio wysłana: `PUT /devices/me/location`. Bez `get_it` z pełnym grafem zależności.
  - iOS: najprościej i najpewniej wysyłać **natywnie w Swift** (`URLSession`) w handlerze `didUpdateLocations` — token zapisany w Keychain przez `flutter_secure_storage` jest dostępny natywnie (ten sam service/account), ostatnią komórkę H3 trzymamy w `UserDefaults`. Porównanie komórek można też zastąpić progiem odległości ~150 m po stronie Swift.
  - Android: callback `workmanager` / strumień foreground service działa w izolacie Dart — używa lekkiego `Dio` + `flutter_secure_storage` + `h3_flutter`.
- Wszystkie ścieżki (otwarcie, tło, zgłoszenie) zapisują lokalnie `lastSentCell` i `lastSentAt`, żeby nie dublować wysyłek.
- Konfiguracja natywna: iOS `Info.plist` (`NSLocationWhenInUseUsageDescription`, `NSLocationAlwaysAndWhenInUseUsageDescription`, `UIBackgroundModes: location, remote-notification`); Android `AndroidManifest.xml` (`ACCESS_COARSE_LOCATION`, `ACCESS_FINE_LOCATION`, `ACCESS_BACKGROUND_LOCATION`, `FOREGROUND_SERVICE`, `FOREGROUND_SERVICE_LOCATION`, `POST_NOTIFICATIONS`).
- Tryb czuwania jest **po fazie core** (patrz `10-roadmapa-priorytety.md`) — demo musi działać bez niego.

Ustalone (spec 1.1.0): adres domowy i GPS nadpisują jedną pozycję w `PUT /devices/me/location`; rozróżnia je pole `source: home | gps | background`.

## H3

Backend indeksuje pozycje w komórkach **H3 rozdzielczości 9** (krawędź ~175 m, np. `891e24aa5c7ffff`) i zwraca `h3Cell` w `PUT /devices/me/location`, `POST /reports` i `GET /devices/me`.

Użycie po stronie aplikacji (`h3_flutter`):

- **Throttling wysyłki lokalizacji** (otwarcie i tło): wysyłamy nową pozycję tylko gdy zmieniła się komórka H3 (zamiast progu „150 m”) i nie częściej niż limit backendu (30/min).
- **Prezentacja prywatności**: w ustawieniach pokazujemy użytkownikowi „Twoja okolica” jako heksagon komórki, nie dokładny punkt.
- **Opcjonalnie (mapa)**: gdy backend zacznie zwracać zasięg incydentu jako listę komórek, rysujemy heksagony (`cellToBoundary`) zamiast `MultiPolygon`. Obecnie API zwraca GeoJSON `MultiPolygon`/`Point`.

Mobile nie liczy na H3 żadnej logiki biznesowej (zasięg, confidence) — to wyłącznie prezentacja i throttling.

## Struktura katalogów

```
lib/
  main.dart
  app/                    # MaterialApp.router, go_router, theme (styl mObywatel), DI (get_it), config
  core/
    error/                # wyjątki domenowe, mapowanie error.code
    push/                 # PushService (FCM/APNs), routing z pushy
    location/             # geolocator, geocoding, h3 helpers, BackgroundLocationService
    widgets/              # wspólne komponenty UI (karty, przyciski, status chip)
  data/
    models/               # modele domenowe (freezed): Incident, Shelter, Alert, VerificationQuestion, Report...
    repositories/         # interfejsy
    mock/                 # implementacje mockowe + scenariusz demo
    remote/
      api/                # WYGENEROWANE przez swagger_parser — nie edytować ręcznie
      dto/                # ręczne DTO odpowiedzi (do czasu uzupełnienia spec)
      interceptors/
      *_repository_remote.dart
  features/
    onboarding/           # zgody, adres domowy
    map/
    report/
    verification/
    incident/
    shelters/
    alerts/
    settings/             # adres domowy, tryb czuwania (tło), powiadomienia, dev: tryb mock / scenariusz demo
test/
```

Każdy `feature` ma `bloc/` (bloc/cubit, state, event) i `view/` (strony, widgety). Konwencja nazewnicza jak w `flutter_bloc`: `MapBloc`, `MapEvent`, `MapState`; strona `MapPage` tworzy `BlocProvider`, widok `MapView` go konsumuje.

## Moduły i odpowiedzialności

| Moduł | BLoC | Odpowiada za |
|---|---|---|
| `onboarding` | `OnboardingCubit` | zgody (powiadomienia, lokalizacja), adres domowy, rejestracja urządzenia, propozycja trybu czuwania |
| `map` | `MapBloc` | `GET /map?bbox`, polling 30 s, warstwy incydentów/schronów/alertów, pozycja użytkownika |
| `report` | `ReportCubit` | typ → lokalizacja → opis → `POST /reports`, obsługa 429 |
| `verification` | `VerificationBloc` | `pending` + pushe, odliczanie do `expiresAt`, odpowiedź, 409/410 |
| `incident` | `IncidentCubit` | szczegóły `GET /incidents/{id}` |
| `shelters` | `SheltersCubit` | najbliższe schrony, szczegóły, potwierdzenie statusu |
| `alerts` | `AlertsCubit` | lista `GET /alerts?lat&lng`, ekran alertu |
| (globalny) | `LocationCubit`, `DeviceCubit` | pozycja / adres domowy, token i profil urządzenia |

## Aktualizacje „na żywo”

Backend: push + polling (SSE/Mercure jest tylko dla panelu operatora). Repozytoria eksponują `Stream<...>` (np. `watchMap(bbox)`), a BLoC konsumuje je przez `emit.forEach`, więc zmiana transportu nie dotyka UI.

## Symulacja demo w trybie mock

`MockIncidentRepository` + `MockVerificationRepository` odtwarzają scenariusz z `09-demo-scenariusz.md` (cluster → pytanie → wzrost confidence → granica → `confirmed` → alert), sterowany ukrytym przyciskiem w ustawieniach dev. Mocki zwracają dokładnie ten sam kształt danych co `backend-specs.md`.

## Konwencje

- Brak logiki confidence w UI — tylko prezentacja `confidenceLevel`/`confidenceScore`/etykiet z backendu.
- Żadnych współrzędnych źródeł zgłoszeń w modelach Citizen.
- Teksty UI w jednym miejscu (`flutter_localizations` + ARB), etykiety enumów preferencyjnie z backendu (`typeLabel`, `statusLabel`, `confidenceLabel`).
- Kod wygenerowany (`lib/data/remote/api/`, `*.g.dart`, `*.freezed.dart`) nie jest edytowany ręcznie.
