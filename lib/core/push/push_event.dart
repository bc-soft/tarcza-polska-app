import "package:equatable/equatable.dart";

/// Zdarzenie z pusha (`data.type`) — niezależne od transportu (FCM / mock).
sealed class PushEvent extends Equatable {
  const PushEvent();

  /// Parsuje sekcję `data` wiadomości (FCM lub payload lokalnej notyfikacji).
  /// [opened] — użytkownik tapnął notyfikację (a nie push przyszedł na pierwszym planie).
  static PushEvent? fromData(Map<String, dynamic> data, {bool opened = false}) {
    String? str(String key) => data[key]?.toString();
    return switch (str("type")) {
      "verification" when str("verificationId") != null => VerificationPushEvent(
        verificationId: str("verificationId")!,
        incidentId: str("incidentId"),
        // `data.type` to zawsze "verification" — typ incydentu jest w `data.incidentType`.
        incidentType: str("incidentType"),
        expiresAt: DateTime.tryParse(str("expiresAt") ?? ""),
        opened: opened,
      ),
      "alert" when str("alertId") != null => AlertPushEvent(alertId: str("alertId")!),
      "location_refresh" => const LocationRefreshPushEvent(),
      _ => null,
    };
  }

  Map<String, String> toData();
}

final class VerificationPushEvent extends PushEvent {
  const VerificationPushEvent({
    required this.verificationId,
    this.incidentId,
    this.incidentType,
    this.expiresAt,
    this.opened = false,
  });

  final String verificationId;
  final String? incidentId;
  final String? incidentType;

  /// Pytanie żyje 90 s — wygasłe odrzucamy bez dociągania `GET /verifications/{id}`.
  final DateTime? expiresAt;

  /// Otwarte z notyfikacji — wygasłe pytanie pokazujemy wtedy jako „wygasło” (`§10`).
  final bool opened;

  @override
  Map<String, String> toData() => {
    "type": "verification",
    "verificationId": verificationId,
    "incidentId": ?incidentId,
    "incidentType": ?incidentType,
    "expiresAt": ?expiresAt?.toIso8601String(),
  };

  @override
  List<Object?> get props => [verificationId, incidentId, incidentType, expiresAt, opened];
}

final class AlertPushEvent extends PushEvent {
  const AlertPushEvent({required this.alertId});

  final String alertId;

  @override
  Map<String, String> toData() => {"type": "alert", "alertId": alertId};

  @override
  List<Object?> get props => [alertId];
}

/// **[DO UZGODNIENIA]** z backendem — przyjęty `data.type = "location_refresh"` (docs/08).
final class LocationRefreshPushEvent extends PushEvent {
  const LocationRefreshPushEvent();

  @override
  Map<String, String> toData() => {"type": "location_refresh"};

  @override
  List<Object?> get props => const [];
}
