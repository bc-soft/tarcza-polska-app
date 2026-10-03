/// Enumy domenowe. Wartości API są stałe, po angielsku, małymi literami
/// (`backend-specs.md` §12). Nieznane wartości mapujemy na bezpieczny wariant
/// zamiast wywracać parsowanie.
library;

/// Typ zgłoszenia / incydentu.
enum IncidentType {
  powerOutage("power_outage"),
  waterOutage("water_outage"),
  fuelShortage("fuel_shortage"),
  roadBlocked("road_blocked"),
  shelterIssue("shelter_issue"),
  otherThreat("other_threat");

  IncidentType(this.apiValue);

  final String apiValue;

  static IncidentType fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => otherThreat);
}

/// Status incydentu. `resolved` nie pojawia się na mapie.
enum IncidentStatus {
  detected("detected"),
  verifying("verifying"),
  active("active"),
  resolved("resolved");

  IncidentStatus(this.apiValue);

  final String apiValue;

  static IncidentStatus fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => detected);
}

/// Poziom wiarygodności — liczy go backend, mobile tylko prezentuje.
enum ConfidenceLevel {
  unverified("unverified"),
  likely("likely"),
  high("high"),
  confirmed("confirmed");

  ConfidenceLevel(this.apiValue);

  final String apiValue;

  static ConfidenceLevel fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => unverified);
}

enum ShelterStatus {
  open("open"),
  full("full"),
  closed("closed"),
  unknown("unknown");

  ShelterStatus(this.apiValue);

  final String apiValue;

  static ShelterStatus fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => unknown);
}

enum AlertSeverity {
  info("info"),
  warning("warning"),
  danger("danger");

  AlertSeverity(this.apiValue);

  final String apiValue;

  static AlertSeverity fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => warning);
}

/// Odpowiedź na pytanie weryfikacyjne. Wysyłamy dosłownie kliknięty przycisk —
/// interpretację robi backend.
enum VerificationAnswer {
  yes("yes"),
  no("no"),
  unknown("unknown");

  VerificationAnswer(this.apiValue);

  final String apiValue;

  static VerificationAnswer fromApi(String? value) =>
      values.firstWhere((e) => e.apiValue == value, orElse: () => unknown);
}

/// Skąd pochodzi ostatnio wysłana pozycja urządzenia.
enum LocationSource { home, gps, background }
