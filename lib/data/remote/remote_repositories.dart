import "dart:async";

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/remote/api/export.dart" as api;
import "package:tarcza_polska/data/remote/citizen_api.dart";
import "package:tarcza_polska/data/remote/device_registrar.dart";
import "package:tarcza_polska/data/remote/dto/dtos.dart";
import "package:tarcza_polska/data/remote/interceptors/error_interceptor.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

class RemoteDeviceRepository implements DeviceRepository {
  RemoteDeviceRepository(this._api, this._registrar, this._tokenStorage);

  final CitizenApi _api;
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
  Future<DeviceProfile> getProfile() => guardApi(() async => (await _api.getDeviceMe()).toDomain());

  @override
  Future<String?> updateLocation(LatLng position, {double? accuracyMeters}) => guardApi(() async {
    final result = await _api.putDeviceLocation(
      api.UpdateLocationRequest(
        lat: position.latitude,
        lng: position.longitude,
        accuracyMeters: accuracyMeters,
      ),
    );
    return result.h3Cell;
  });

  @override
  Future<void> updatePushToken(String pushToken) => guardApi(
    () => _api.putDevicePushToken(api.UpdatePushTokenRequest(pushToken: pushToken)),
  );
}

class RemoteMapRepository implements MapRepository {
  RemoteMapRepository(this._api);

  final CitizenApi _api;

  @override
  Future<List<MapFeature>> getMap(BBox bbox) => guardApi(() async {
    final collection = await _api.getMap(bbox.toQuery());
    return collection.features.map(mapFeatureFromDto).nonNulls.toList();
  });

  /// Polling co [AppConfig.pollInterval]. Błąd pojedynczego odpytania trafia do
  /// strumienia, ale nie przerywa kolejnych prób.
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

  final CitizenApi _api;

  @override
  Future<Incident> getIncident(String id) =>
      guardApi(() async => (await _api.getIncident(id)).toDomain());

  @override
  Future<List<Incident>> getIncidentsAt(LatLng position) => guardApi(() async {
    final list = await _api.getIncidents(lat: position.latitude, lng: position.longitude);
    return list.map((e) => e.toDomain()).toList();
  });
}

class RemoteReportRepository implements ReportRepository {
  RemoteReportRepository(this._api);

  final CitizenApi _api;

  @override
  Future<List<ReportTypeOption>> getTypes() => guardApi(() async {
    final types = await _api.getReportTypes();
    return types.map((e) => e.toDomain()).toList();
  });

  @override
  Future<ReportReceipt> createReport({
    required IncidentType type,
    required LatLng position,
    String? description,
  }) => guardApi(() async {
    final trimmed = description?.trim();
    final receipt = await _api.createReport(
      api.CreateReportRequest(
        type: api.ReportType.fromJson(type.apiValue),
        lat: position.latitude,
        lng: position.longitude,
        description: (trimmed == null || trimmed.isEmpty) ? null : trimmed,
      ),
    );
    return receipt.toDomain();
  });

  @override
  Future<ReportStatus> getReportStatus(String reportId) =>
      guardApi(() async => (await _api.getReport(reportId)).toDomain());
}

class RemoteVerificationRepository implements VerificationRepository {
  RemoteVerificationRepository(this._api);

  final CitizenApi _api;

  @override
  Future<List<VerificationQuestion>> getPending() => guardApi(() async {
    final list = await _api.getPendingVerifications();
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<VerificationQuestion> getQuestion(String verificationId) =>
      guardApi(() async => (await _api.getVerification(verificationId)).toDomain());

  @override
  Future<VerificationResult> respond(String verificationId, VerificationAnswer answer) =>
      guardApi(() async {
        final result = await _api.respond(
          verificationId,
          api.RespondRequest(answer: api.VerificationAnswer.fromJson(answer.apiValue)),
        );
        return result.toDomain();
      });
}

class RemoteShelterRepository implements ShelterRepository {
  RemoteShelterRepository(this._api);

  final CitizenApi _api;

  @override
  Future<List<Shelter>> getNearest(LatLng position) => guardApi(() async {
    final list = await _api.getShelters(lat: position.latitude, lng: position.longitude);
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<List<Shelter>> getInBbox(BBox bbox) => guardApi(() async {
    final list = await _api.getShelters(bbox: bbox.toQuery());
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<Shelter> getShelter(String id) =>
      guardApi(() async => (await _api.getShelter(id)).toDomain());

  @override
  Future<Shelter> confirmStatus(String id, ShelterStatus status, {String? comment}) =>
      guardApi(() async {
        final trimmed = comment?.trim();
        final shelter = await _api.confirmShelter(
          id,
          api.ConfirmShelterStatusRequest(
            status: api.ShelterStatus.fromJson(status.apiValue),
            comment: (trimmed == null || trimmed.isEmpty) ? null : trimmed,
          ),
        );
        return shelter.toDomain();
      });
}

class RemoteAlertRepository implements AlertRepository {
  RemoteAlertRepository(this._api);

  final CitizenApi _api;

  @override
  Future<List<Alert>> getAlertsAt(LatLng position) => guardApi(() async {
    final list = await _api.getAlerts(lat: position.latitude, lng: position.longitude);
    return list.map((e) => e.toDomain()).toList();
  });

  @override
  Future<Alert> getAlert(String id) => guardApi(() async => (await _api.getAlert(id)).toDomain());
}
