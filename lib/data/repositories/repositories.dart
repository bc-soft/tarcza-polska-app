/// Interfejsy repozytoriów. BLoC-i znają tylko te interfejsy i modele domenowe.
/// Implementacje: `Mock*` (`lib/data/mock/`) i `Remote*` (`lib/data/remote/`),
/// wybierane w `lib/app/di/injection.dart` flagą `USE_MOCKS`.
///
/// Wszystkie metody rzucają wyłącznie `TarczaFailure`.
library;

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/models.dart";

abstract interface class DeviceRepository {
  /// Czy mamy zapisany token urządzenia.
  Future<bool> isRegistered();

  /// `POST /devices`, jeśli brak tokena. Zwraca `deviceId`.
  Future<String> ensureRegistered({String? pushToken});

  /// `GET /devices/me`.
  Future<DeviceProfile> getProfile();

  /// `PUT /devices/me/location` — zwraca komórkę H3 nadaną przez backend.
  Future<String?> updateLocation(LatLng position, {double? accuracyMeters});

  /// `PUT /devices/me/push-token` (przy każdej rotacji tokena FCM).
  Future<void> updatePushToken(String pushToken);
}

abstract interface class MapRepository {
  /// Jednorazowe `GET /map?bbox`.
  Future<List<MapFeature>> getMap(BBox bbox);

  /// Strumień stanu mapy dla okna — polling (remote) lub zmiany scenariusza (mock).
  /// Pierwsza wartość jest emitowana od razu.
  Stream<List<MapFeature>> watchMap(BBox bbox);
}

abstract interface class IncidentRepository {
  Future<Incident> getIncident(String id);

  /// Incydenty obejmujące podaną pozycję.
  Future<List<Incident>> getIncidentsAt(LatLng position);
}

abstract interface class ReportRepository {
  Future<List<ReportTypeOption>> getTypes();

  /// `POST /reports` (202). Rzuca `RateLimitedFailure` przy 429.
  Future<ReportReceipt> createReport({
    required IncidentType type,
    required LatLng position,
    String? description,
  });

  Future<ReportStatus> getReportStatus(String reportId);
}

abstract interface class VerificationRepository {
  Future<List<VerificationQuestion>> getPending();

  Future<VerificationQuestion> getQuestion(String verificationId);

  /// Rzuca `AlreadyAnsweredFailure` (409) i `QuestionExpiredFailure` (410).
  Future<VerificationResult> respond(String verificationId, VerificationAnswer answer);
}

abstract interface class ShelterRepository {
  /// 10 najbliższych, z `distanceMeters`.
  Future<List<Shelter>> getNearest(LatLng position);

  Future<List<Shelter>> getInBbox(BBox bbox);

  Future<Shelter> getShelter(String id);

  Future<Shelter> confirmStatus(String id, ShelterStatus status, {String? comment});
}

abstract interface class AlertRepository {
  /// Aktywne alerty obejmujące pozycję.
  Future<List<Alert>> getAlertsAt(LatLng position);

  /// Szczegóły alertu (z `area`).
  Future<Alert> getAlert(String id);
}
