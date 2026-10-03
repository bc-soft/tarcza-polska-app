import "package:equatable/equatable.dart";

/// Zdarzenie z pusha (`data.type`) — niezależne od transportu (FCM / mock).
sealed class PushEvent extends Equatable {
  const PushEvent();

  /// Parsuje sekcję `data` wiadomości (FCM lub payload lokalnej notyfikacji).
  static PushEvent? fromData(Map<String, dynamic> data) {
    String? str(String key) => data[key]?.toString();
    return switch (str("type")) {
      "verification" when str("verificationId") != null => VerificationPushEvent(
        verificationId: str("verificationId")!,
        incidentId: str("incidentId"),
      ),
      "alert" when str("alertId") != null => AlertPushEvent(alertId: str("alertId")!),
      "location_refresh" => const LocationRefreshPushEvent(),
      _ => null,
    };
  }

  Map<String, String> toData();
}

final class VerificationPushEvent extends PushEvent {
  const VerificationPushEvent({required this.verificationId, this.incidentId});

  final String verificationId;
  final String? incidentId;

  @override
  Map<String, String> toData() => {
    "type": "verification",
    "verificationId": verificationId,
    "incidentId": ?incidentId,
  };

  @override
  List<Object?> get props => [verificationId, incidentId];
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
