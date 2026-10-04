# Tarcza Citizen (Flutter)

Aplikacja mobilna platformy Tarcza Polska: mapa sytuacji, zgłoszenia, **Active Crowd Verification**
(pytania TAK / NIE / NIE WIEM), alerty i schrony. Dokumentacja produktu i architektury: `docs/`.

## Uruchomienie

```bash
fvm flutter pub get
fvm dart run build_runner build          # freezed / json_serializable / retrofit
fvm flutter run                          # tryb mock (domyślny) — scenariusz demo bez backendu
```

Prawdziwy backend — tunel ngrok zespołu (`dart_defines/remote.json`, w VS Code konfiguracja
„tarcza_polska (backend ngrok)”):

```bash
fvm flutter run --dart-define-from-file=dart_defines/remote.json
# lokalny backend:
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=API_BASE_URL=http://localhost
# + push FCM/APNs (wymaga google-services.json / GoogleService-Info.plist):
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=ENABLE_PUSH=true
```

Bez `ENABLE_PUSH` aplikacja działa na samym pollingu (`pending`, `alerts`, mapa co 30 s).

### Push (FCM / APNs)

- `dart_defines/remote.json` ma `ENABLE_PUSH=true`. iOS: `ios/Runner/GoogleService-Info.plist`
  (projekt Firebase `tarcza-polska`, nie commitujemy) + `ios/Runner/Runner.entitlements`
  (`aps-environment`, *Time Sensitive Notifications*). Android: brak `google-services.json` —
  aplikacja przechodzi na polling.
- **Prawdziwy token APNs wymaga zespołu Apple Developer** (`DEVELOPMENT_TEAM` w Xcode) — bez
  niego FCM nie wyda tokena i `PUT /devices/me/push-token` nie pójdzie (w logu: „Brak tokena APNs”).
  W Firebase Console musi być wgrany klucz APNs (`.p8`).
- Test obsługi pushy na symulatorze bez APNs (payload musi mieć `gcm.message_id`, inaczej
  `firebase_messaging` go nie przekaże):

```bash
cat > /tmp/push.apns <<'JSON'
{"Simulator Target Bundle":"com.example.tarczaPolska","gcm.message_id":"test-1",
 "aps":{"alert":{"title":"Czy nadal jesteś w tej okolicy?","body":"Otwórz Tarczę."}},
 "type":"location_refresh"}
JSON
xcrun simctl push booted com.example.tarczaPolska /tmp/push.apns
```
Każde żądanie ma nagłówek `ngrok-skip-browser-warning: 1` (backend za tunelem ngrok).

## Scenariusz demo (tryb mock)

**Więcej → Scenariusz demo**: krok po kroku albo „Odtwarzaj automatycznie”.
Klaster 42% → pytanie weryfikacyjne (push + `pending`) → odpowiedź → 76% → granica strefy →
potwierdzenie 96% → alert dla obszaru. Adres demo: Poznań, Jeżyce.

## Klient API

```bash
curl -s -H "ngrok-skip-browser-warning: 1" <API>/api/doc.json | python3 -m json.tool --indent 4 > docs/openapi.json
fvm dart run swagger_parser && fvm dart run build_runner build
```

Wygenerowany klient: `lib/data/remote/api/` (nie edytować ręcznie). Mapowanie na modele domenowe:
`lib/data/remote/mappers.dart`. Zgłoszenia do backendu: `docs/backend-requests.md`.

## Struktura

```
lib/app/        config, DI (get_it, przełącznik USE_MOCKS), router (go_router), motyw
lib/core/       błędy domenowe, push, lokalizacja (H3, tryb czuwania), storage, widgety
lib/data/       modele (freezed), interfejsy repozytoriów, mock/ (scenariusz demo), remote/
lib/features/   onboarding, map, report, verification, incident, shelters, alerts, settings
ios/Runner/BackgroundLocationManager.swift   tryb czuwania iOS (Significant Location Change)
```
