# Tarcza Citizen (Flutter)

Aplikacja mobilna platformy Tarcza Polska: mapa sytuacji, zgłoszenia, **Active Crowd Verification**
(pytania TAK / NIE / NIE WIEM), alerty i schrony. Dokumentacja produktu i architektury: `docs/`.

## Uruchomienie

```bash
fvm flutter pub get
fvm dart run build_runner build          # freezed / json_serializable / retrofit
fvm flutter run                          # tryb mock (domyślny) — scenariusz demo bez backendu
```

Prawdziwy backend (`backend-specs.md` §1, §14):

```bash
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=API_BASE_URL=http://localhost
# + push FCM/APNs (wymaga google-services.json / GoogleService-Info.plist):
fvm flutter run --dart-define=USE_MOCKS=false --dart-define=ENABLE_PUSH=true
```

Bez `ENABLE_PUSH` aplikacja działa na samym pollingu (`pending`, `alerts`, mapa co 30 s).
Każde żądanie ma nagłówek `ngrok-skip-browser-warning: 1` (backend za tunelem ngrok).

## Scenariusz demo (tryb mock)

**Więcej → Scenariusz demo**: krok po kroku albo „Odtwarzaj automatycznie”.
Klaster 42% → pytanie weryfikacyjne (push + `pending`) → odpowiedź → 76% → granica strefy →
potwierdzenie 96% → alert dla obszaru. Adres demo: Poznań, Jeżyce.

## Klient API

`docs/openapi.json` → `fvm dart run swagger_parser` → `lib/data/remote/api/` (nie edytować ręcznie).
Spec nie opisuje jeszcze schematów odpowiedzi, więc odpowiedzi czytamy przez ręczny interfejs
Retrofit `lib/data/remote/citizen_api.dart` z DTO w `lib/data/remote/dto/` (wg `backend-specs.md`).
Po uzupełnieniu spec: regenerować klienta i usunąć ręczne DTO.

## Struktura

```
lib/app/        config, DI (get_it, przełącznik USE_MOCKS), router (go_router), motyw
lib/core/       błędy domenowe, push, lokalizacja (H3, tryb czuwania), storage, widgety
lib/data/       modele (freezed), interfejsy repozytoriów, mock/ (scenariusz demo), remote/
lib/features/   onboarding, map, report, verification, incident, shelters, alerts, settings
ios/Runner/BackgroundLocationManager.swift   tryb czuwania iOS (Significant Location Change)
```
