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
  /// [source] pozwala backendowi odróżnić adres domowy od GPS i trybu czuwania.
  Future<String?> updateLocation(
    LatLng position, {
    required LocationSource source,
    double? accuracyMeters,
  });

  /// `PUT /devices/me/push-token` (przy każdej rotacji tokena FCM).
  Future<void> updatePushToken(String pushToken);

  /// `PUT /devices/me/preferences` — zgoda na przypomnienia `location_refresh`.
  Future<void> updatePreferences({required bool locationRefresh});
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

  /// Oś czasu incydentu, rosnąco (`GET /incidents/{id}/timeline`).
  Future<List<IncidentTimelineEntry>> getTimeline(String id);

  /// Incydenty obejmujące podaną pozycję.
  Future<List<Incident>> getIncidentsAt(LatLng position);
}

abstract interface class ReportRepository {
  Future<List<ReportTypeOption>> getTypes();

  /// `POST /reports` (202). Rzuca `RateLimitedFailure` przy 429.
  /// Zgłoszenia punktowe (`fuel_shortage`, `shelter_issue`) podają [poiId] (i [fuelTypes]);
  /// bez `poiId` backend bierze najbliższy obiekt albo zwraca 422 `poi_required`.
  Future<ReportReceipt> createReport({
    required IncidentType type,
    required LatLng position,
    String? description,
    String? poiId,
    List<FuelType> fuelTypes = const [],
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

  /// [occupancy] pomijamy dla `closed`.
  Future<Shelter> confirmStatus(
    String id,
    ShelterStatus status, {
    ShelterOccupancy? occupancy,
    String? comment,
  });
}

abstract interface class FuelStationRepository {
  /// Najbliższe stacje (z `distanceMeters`).
  Future<List<FuelStation>> getNearest(LatLng position);

  Future<FuelStation> getStation(String id);

  /// Potwierdzenie stanu przez osobę na stacji — bez tworzenia zgłoszenia.
  Future<FuelStation> confirmStatus(
    String id, {
    required List<FuelType> fuelTypes,
    required bool available,
    String? comment,
  });
}

/// Procedury „co robić” (`GET /procedures`).
abstract interface class GuidanceRepository {
  /// Procedury dla typu plus ogólne; bez [type] — wszystkie ogólne.
  Future<List<Procedure>> getProcedures({IncidentType? type});
}

abstract interface class AlertRepository {
  /// Aktywne alerty obejmujące pozycję.
  Future<List<Alert>> getAlertsAt(LatLng position);

  /// Szczegóły alertu (z `area`).
  Future<Alert> getAlert(String id);
}
