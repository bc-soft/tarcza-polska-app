/// Konfiguracja buildu przekazywana przez `--dart-define`.
///
/// Przykłady:
/// ```bash
/// fvm flutter run                                    # tryb mock (domyślny)
/// fvm flutter run --dart-define-from-file=dart_defines/remote.json   # backend (ngrok)
/// fvm flutter run --dart-define=USE_MOCKS=false \
///   --dart-define=API_BASE_URL=http://localhost      # lokalny backend
/// fvm flutter run --dart-define=USE_MOCKS=false \
///   --dart-define=ENABLE_PUSH=true                   # + Firebase (wymaga plików konfiguracyjnych)
/// ```
abstract final class AppConfig {
  /// `true` — repozytoria `Mock*` i scenariusz demo; `false` — `Remote*` (Retrofit).
  static const bool useMocks = bool.fromEnvironment("USE_MOCKS", defaultValue: true);

  /// Adres backendu (bez prefiksu `/api/v1` i bez końcowego `/`).
  /// Domyślnie wspólny tunel ngrok zespołu backendu.
  static const String apiBaseUrl = String.fromEnvironment(
    "API_BASE_URL",
    defaultValue: "https://6d88-213-241-25-155.ngrok-free.app",
  );

  /// Włącza Firebase Cloud Messaging. Wymaga `google-services.json` /
  /// `GoogleService-Info.plist`, więc domyślnie wyłączone — aplikacja działa
  /// wtedy na samym pollingu.
  static const bool enablePush = bool.fromEnvironment("ENABLE_PUSH");

  static const String appVersion = "0.1.0";

  /// Odświeżanie mapy, `pending` i alertów, gdy aplikacja jest na pierwszym planie.
  static const Duration pollInterval = Duration(seconds: 30);

  /// Rozdzielczość H3 używana przez backend (krawędź ~175 m).
  static const int h3Resolution = 9;
}
