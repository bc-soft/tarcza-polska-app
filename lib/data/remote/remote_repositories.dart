import "dart:async";

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/remote/api/export.dart" as api;
import "package:tarcza_polska/data/remote/device_registrar.dart";
import "package:tarcza_polska/data/remote/interceptors/error_interceptor.dart";
import "package:tarcza_polska/data/remote/mappers.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

/// Repozytoria na kliencie wygenerowanym z `docs/openapi.json` (`swagger_parser`).

class RemoteDeviceRepository implements DeviceRepository {
  RemoteDeviceRepository(this._api, this._registrar, this._tokenStorage);

  final api.TarczaApi _api;
  final DeviceRegistrar _registrar;
  final TokenStorage _tokenStorage;

  @override
  Future<bool> isRegistered() async => await _tokenStorage.readToken() != null;

  @override
  Future<String> ensureRegistered({String? pushToken}) => guardApi(() async {
    final existing = await _tokenStorage.readDeviceId();
    if (existing != null && await isRegistered()) return existing;
    return await _registrar.register(pushToken: pushToken);
  });

  @override
  Future<DeviceProfile> getProfile() =>
      guardApi(() async => (await _api.devices.getApiDeviceMe()).toDomain());

  @override
  Future<String?> updateLocation(
    LatLng position, {
    required LocationSource source,
    double? accuracyMeters,
  }) => guardApi(() async {
    final result = await _api.devices.putApiDeviceLocation(
      body: api.UpdateLocationRequest(
        lat: position.latitude,
        lng: position.longitude,
        accuracyMeters: accuracyMeters,
        source: locationSourceToApi(source),
      ),
    );
    return result.h3Cell;
  });

  @override
  Future<void> updatePushToken(String pushToken) => guardApi(
    () => _api.devices.putApiDevicePushToken(
      body: api.UpdatePushTokenRequest(pushToken: pushToken),
    ),
  );

  @override
  Future<void> updatePreferences({required bool locationRefresh}) => guardApi(
    () => _api.devices.putApiDevicePreferences(
      body: api.UpdatePreferencesRequest(locationRefresh: locationRefresh),
    ),
  );
}

class RemoteMapRepository implements MapRepository {
  RemoteMapRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<MapFeature>> getMap(BBox bbox) => guardApi(() async {
    final collection = await _api.incidents.getApiMap(bbox: bbox.toQuery());
    return collection.features.map((f) => f.toDomain()).nonNulls.toList();
  });

  /// Polling co [AppConfig.pollInterval] (z `ETag` — patrz `EtagCacheInterceptor`).
  /// Błąd pojedynczego odpytania trafia do strumienia, ale nie przerywa kolejnych prób.
  @override
  Stream<List<MapFeature>> watchMap(BBox bbox) async* {
    while (true) {
      try {
        yield await getMap(bbox);
      } on Object catch (e, st) {
        yield* Stream<List<MapFeature>>.error(e, st);
      }
      await Future<void>.delayed(AppConfig.pollInterval);
    }
  }
}

class RemoteIncidentRepository implements IncidentRepository {
  RemoteIncidentRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<Incident> getIncident(String id) =>
      guardApi(() async => (await _api.incidents.getApiIncidentShow(id: id)).toDomain());

  @override
  Future<List<IncidentTimelineEntry>> getTimeline(String id) => guardApi(() async {
    final list = await _api.incidents.getApiIncidentTimeline(id: id);
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<List<Incident>> getIncidentsAt(LatLng position) => guardApi(() async {
    final list = await _api.incidents.getApiIncidentList(
      lat: position.latitude,
      lng: position.longitude,
    );
    return list.map((e) => e.toDomain()).toList();
  });
}

class RemoteReportRepository implements ReportRepository {
  RemoteReportRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<ReportTypeOption>> getTypes() => guardApi(() async {
    final types = await _api.reports.getApiReportTypes();
    return types.map((e) => e.toDomain()).toList();
  });

  @override
  Future<ReportReceipt> createReport({
    required IncidentType type,
    required LatLng position,
    String? description,
    String? poiId,
    List<FuelType> fuelTypes = const [],
  }) => guardApi(() async {
    final trimmed = description?.trim();
    final receipt = await _api.reports.postApiReportCreate(
      body: api.CreateReportRequest(
        type: api.ReportType.fromJson(type.apiValue),
        lat: position.latitude,
        lng: position.longitude,
        description: (trimmed == null || trimmed.isEmpty) ? null : trimmed,
        poiId: poiId,
        fuelTypes: fuelTypes.isEmpty ? null : fuelTypes.map(fuelTypeToApi).toList(),
      ),
    );
    return receipt.toDomain();
  });

  @override
  Future<ReportStatus> getReportStatus(String reportId) =>
      guardApi(() async => (await _api.reports.getApiReportShow(id: reportId)).toDomain());
}

class RemoteVerificationRepository implements VerificationRepository {
  RemoteVerificationRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<VerificationQuestion>> getPending() => guardApi(() async {
    final list = await _api.verification.getApiVerificationPending();
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<VerificationQuestion> getQuestion(String verificationId) => guardApi(
    () async => (await _api.verification.getApiVerificationShow(id: verificationId)).toDomain(),
  );

  @override
  Future<VerificationResult> respond(String verificationId, VerificationAnswer answer) =>
      guardApi(() async {
        final result = await _api.verification.postApiVerificationRespond(
          id: verificationId,
          body: api.RespondRequest(answer: api.VerificationAnswer.fromJson(answer.apiValue)),
        );
        return result.toDomain();
      });
}

class RemoteShelterRepository implements ShelterRepository {
  RemoteShelterRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<Shelter>> getNearest(LatLng position) => guardApi(() async {
    final list = await _api.shelters.getApiShelterList(
      lat: position.latitude,
      lng: position.longitude,
    );
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<List<Shelter>> getInBbox(BBox bbox) => guardApi(() async {
    final list = await _api.shelters.getApiShelterList(bbox: bbox.toQuery());
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<Shelter> getShelter(String id) =>
      guardApi(() async => (await _api.shelters.getApiShelterShow(id: id)).toDomain());

  @override
  Future<Shelter> confirmStatus(
    String id,
    ShelterStatus status, {
    ShelterOccupancy? occupancy,
    String? comment,
  }) => guardApi(() async {
    final trimmed = comment?.trim();
    final shelter = await _api.shelters.postApiShelterConfirm(
      id: id,
      body: api.ConfirmShelterStatusRequest(
        status: api.ShelterStatus.fromJson(status.apiValue),
        comment: (trimmed == null || trimmed.isEmpty) ? null : trimmed,
        // Dla zamkniętego schronu zapełnienie nie ma sensu (`backend-specs` §19).
        occupancy: status == ShelterStatus.closed || occupancy == null
            ? null
            : api.ShelterOccupancy2.fromJson(occupancy.apiValue),
      ),
    );
    return shelter.toDomain();
  });
}

class RemoteFuelStationRepository implements FuelStationRepository {
  RemoteFuelStationRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<FuelStation>> getNearest(LatLng position) => guardApi(() async {
    final list = await _api.fuelStations.getApiFuelStationList(
      lat: position.latitude,
      lng: position.longitude,
    );
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<FuelStation> getStation(String id) =>
      guardApi(() async => (await _api.fuelStations.getApiFuelStationShow(id: id)).toDomain());

  @override
  Future<FuelStation> confirmStatus(
    String id, {
    required List<FuelType> fuelTypes,
    required bool available,
    String? comment,
  }) => guardApi(() async {
    final trimmed = comment?.trim();
    final station = await _api.fuelStations.postApiFuelStationConfirm(
      id: id,
      body: api.ConfirmFuelStatusRequest(
        fuelTypes: fuelTypes.map(fuelTypeToApi).toList(),
        available: available,
        comment: (trimmed == null || trimmed.isEmpty) ? null : trimmed,
      ),
    );
    return station.toDomain();
  });
}

class RemoteGuidanceRepository implements GuidanceRepository {
  RemoteGuidanceRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<Procedure>> getProcedures({IncidentType? type}) => guardApi(() async {
    final list = await _api.guidance.getApiProcedures(
      type: type == null ? null : api.ReportType.fromJson(type.apiValue),
    );
    return (list.map((e) => e.toDomain()).toList()
      ..sort((a, b) => b.priority.compareTo(a.priority)));
  });
}

class RemoteAlertRepository implements AlertRepository {
  RemoteAlertRepository(this._api);

  final api.TarczaApi _api;

  @override
  Future<List<Alert>> getAlertsAt(LatLng position) => guardApi(() async {
    final list = await _api.alerts.getApiAlertList(lat: position.latitude, lng: position.longitude);
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<Alert> getAlert(String id) =>
      guardApi(() async => (await _api.alerts.getApiAlertShow(id: id)).toDomain());
}
