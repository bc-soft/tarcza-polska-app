# Tarcza Citizen (Flutter)

Aplikacja mobilna platformy **Tarcza Polska**: mapa sytuacyjna, zgłoszenia, **Active Crowd
Verification** (pytania TAK / NIE / NIE WIEM), alerty i schrony. Backend i panel operatora
(Command) są osobnym repo — tutaj jest tylko mobile.

Cykl produktu: **DETECT → VERIFY → MAP → INFORM**. Pełna dokumentacja produktu i architektury:
katalog [`docs/`](docs/).

## Wymagania

- [FVM](https://fvm.app/) (repo trzyma wersję Fluttera w `.fvmrc` — obecnie `3.47.6`)
- Xcode (do builda iOS/symulatora) i/lub Android Studio + SDK (do Androida)
- Dla trybu z prawdziwym backendem: adres API (tunel ngrok zespołu albo lokalny backend)

## Szybki start (tryb mock, bez backendu)

Domyślnie aplikacja startuje w **trybie mock** (`USE_MOCKS=true`) — odgrywa scenariusz demo
(patrz [`docs/09-demo-scenariusz.md`](docs/09-demo-scenariusz.md)) bez żadnego backendu ani
dodatkowej konfiguracji.

```bash
fvm install                     # instaluje wersję Fluttera z .fvmrc (jednorazowo)
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs   # freezed / json_serializable / retrofit
fvm flutter run                 # tryb mock (domyślny) — scenariusz demo
```

Scenariusz demo: **Więcej → Scenariusz demo** — krok po kroku albo „Odtwarzaj automatycznie”.
Klaster 42% → pytanie weryfikacyjne (push + `pending`) → odpowiedź → 76% → granica strefy →
potwierdzenie 96% → alert dla obszaru. Adres demo: Poznań, Jeżyce.

## Uruchomienie z prawdziwym backendem

Backend wymaga pliku z dart-defines (nie jest w repo — zawiera adres tunelu zespołu):

```bash
mkdir -p dart_defines
cat > dart_defines/remote.json <<'JSON'
{
  "USE_MOCKS": "false",
  "API_BASE_URL": "https://<adres-ngrok-lub-backendu>",
  "ENABLE_PUSH": "true"
}
JSON

fvm flutter run --dart-define-from-file=dart_defines/remote.json
```

Warianty bez pliku:

```bash
# lokalny backend, bez pushy
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=API_BASE_URL=http://localhost

# + push FCM/APNs (wymaga google-services.json / GoogleService-Info.plist — patrz niżej)
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=ENABLE_PUSH=true
```

Bez `ENABLE_PUSH` aplikacja działa na samym pollingu (`pending`, `alerts`, mapa co 30 s).
Każde żądanie do backendu ma nagłówek `ngrok-skip-browser-warning: 1` (backend zwykle jest za
tunelem ngrok).

W VS Code gotowe konfiguracje uruchomieniowe są w `.vscode/launch.json`
(`tarcza_polska`, `tarcza_polska (backend ngrok)`, profile/release mode).

### Push (FCM / APNs)

Pliki konfiguracyjne Firebase **nie są commitowane** (sekrety projektu) — trzeba je dołożyć
lokalnie, żeby push działał:

- iOS: `ios/Runner/GoogleService-Info.plist` (projekt Firebase zespołu) +
  `ios/Runner/Runner.entitlements` (`aps-environment`, *Time Sensitive Notifications*).
  Prawdziwy token APNs wymaga zespołu Apple Developer (`DEVELOPMENT_TEAM` w Xcode) — bez niego
  FCM nie wyda tokena i `PUT /devices/me/push-token` nie pójdzie (w logu: „Brak tokena APNs”).
  W Firebase Console musi być wgrany klucz APNs (`.p8`).
- Android: `android/app/google-services.json` — bez niego aplikacja przechodzi na polling.

Test obsługi pushy na symulatorze iOS bez prawdziwego APNs (payload musi mieć
`gcm.message_id`, inaczej `firebase_messaging` go nie przekaże):

```bash
cat > /tmp/push.apns <<'JSON'
{"Simulator Target Bundle":"com.example.tarczaPolska","gcm.message_id":"test-1",
 "aps":{"alert":{"title":"Czy nadal jesteś w tej okolicy?","body":"Otwórz Tarczę."}},
 "type":"location_refresh"}
JSON
xcrun simctl push booted com.example.tarczaPolska /tmp/push.apns
```

### MCP (narzędzia deweloperskie, opcjonalnie)

Jeśli używasz Claude Code / MCP w tym repo, skopiuj `.mcp.json.example` do `.mcp.json` i wstaw
własny klucz Context7 — plik `.mcp.json` jest celowo w `.gitignore` (zawiera sekrety, nie wolno
go commitować).

## Klient API

Klient Retrofit jest generowany z `docs/openapi.json` i **wygenerowany kod jest commitowany**
(`.g.dart`, `.freezed.dart`, `lib/data/remote/api/`) — repo buduje się „z palca”, bez konieczności
odpalania `build_runner` na czysto. Do regeneracji po zmianie kontraktu backendu:

```bash
curl -s -H "ngrok-skip-browser-warning: 1" <API>/api/doc.json | python3 -m json.tool --indent 4 > docs/openapi.json
fvm dart run swagger_parser
fvm dart run build_runner build --delete-conflicting-outputs
```

Wygenerowany klient: `lib/data/remote/api/` (**nie edytować ręcznie**). Mapowanie na modele
domenowe: `lib/data/remote/mappers.dart`. Zgłoszenia do backendu (otwarte punkty kontraktu):
[`docs/backend-requests.md`](docs/backend-requests.md).

## Weryfikacja przed oddaniem / commitem

```bash
fvm flutter analyze                                             # statyczna analiza, 0 błędów
fvm dart run build_runner build --delete-conflicting-outputs    # kod wygenerowany musi być aktualny
```

## Struktura

```
lib/app/        config (USE_MOCKS, API_BASE_URL), DI (get_it), router (go_router), motyw
lib/core/       błędy domenowe, push, lokalizacja (H3, tryb czuwania), storage, widgety
lib/data/       modele (freezed), interfejsy repozytoriów, mock/ (scenariusz demo), remote/
lib/features/   onboarding, map, report, verification, incident, shelters, alerts, settings
ios/Runner/BackgroundLocationManager.swift   tryb czuwania iOS (Significant Location Change)
docs/           dokumentacja produktu, architektury i kontraktu API (źródło prawdy)
```

Stan techniczny (state management, DI, generowanie klienta, mocki) opisany w
[`docs/05-architektura-flutter.md`](docs/05-architektura-flutter.md).
