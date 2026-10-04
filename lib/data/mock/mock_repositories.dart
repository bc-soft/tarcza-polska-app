import "dart:async";

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/core/location/h3_service.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/mock/geo_shapes.dart";
import "package:tarcza_polska/data/mock/mock_backend.dart";
import "package:tarcza_polska/data/mock/mock_seed.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

class MockDeviceRepository implements DeviceRepository {
  MockDeviceRepository(this._backend, this._tokenStorage, this._h3);

  final MockBackend _backend;
  final TokenStorage _tokenStorage;
  final H3Service _h3;
  bool _hasPushToken = false;
  bool _locationRefresh = true;

  @override
  Future<bool> isRegistered() async => await _tokenStorage.readToken() != null;

  @override
  Future<String> ensureRegistered({String? pushToken}) async {
    await _backend.delay();
    _hasPushToken = pushToken != null;
    final existing = await _tokenStorage.readDeviceId();
    if (existing != null && await isRegistered()) return existing;
    final deviceId = _backend.nextId("device");
    await _tokenStorage.save(token: "mock-token-$deviceId", deviceId: deviceId);
    return deviceId;
  }

  @override
  Future<DeviceProfile> getProfile() async {
    await _backend.delay();
    final location = _backend.deviceLocation;
    return DeviceProfile(
      deviceId: await _tokenStorage.readDeviceId() ?? "mock-device",
      platform: "simulator",
      hasPushToken: _hasPushToken,
      lastLocation: location,
      h3Cell: location == null ? null : _h3.cellFor(location),
      locationUpdatedAt: location == null ? null : _backend.now,
      locationRefresh: _locationRefresh,
    );
  }

  @override
  Future<String?> updateLocation(
    LatLng position, {
    required LocationSource source,
    double? accuracyMeters,
  }) async {
    await _backend.delay();
    _backend.deviceLocation = position;
    return _h3.cellFor(position);
  }

  @override
  Future<void> updatePushToken(String pushToken) async => _hasPushToken = true;

  @override
  Future<void> updatePreferences({required bool locationRefresh}) async {
    await _backend.delay();
    _locationRefresh = locationRefresh;
  }
}

class MockMapRepository implements MapRepository {
  MockMapRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<List<MapFeature>> getMap(BBox bbox) async {
    await _backend.delay();
    return [
      for (final i in _backend.incidents.values)
        if (i.status != IncidentStatus.resolved &&
            bbox.intersects(i.area?.outlinePoints ?? const []))
          MapFeature.incident(i),
      for (final s in _backend.shelters.values)
        if (bbox.contains(s.location)) MapFeature.shelter(s),
      for (final s in _backend.fuelStations.values)
        if (bbox.contains(s.location)) MapFeature.fuelStation(s),
      for (final a in _backend.activeAlerts())
        if (a.area != null && bbox.intersects(a.area!.outlinePoints)) MapFeature.alert(a),
    ];
  }

  @override
  Stream<List<MapFeature>> watchMap(BBox bbox) async* {
    yield await getMap(bbox);
    await for (final _ in _backend.changes) {
      yield await getMap(bbox);
    }
  }
}

class MockIncidentRepository implements IncidentRepository {
  MockIncidentRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<Incident> getIncident(String id) async {
    await _backend.delay();
    return _backend.incidents[id] ?? (throw const NotFoundFailure());
  }

  @override
  Future<List<IncidentTimelineEntry>> getTimeline(String id) async {
    await _backend.delay();
    if (!_backend.incidents.containsKey(id)) throw const NotFoundFailure();
    return [...?_backend.timelines[id]]..sort((a, b) => a.at.compareTo(b.at));
  }

  @override
  Future<List<Incident>> getIncidentsAt(LatLng position) async {
    await _backend.delay();
    return _backend.incidents.values
        .where((i) => i.status != IncidentStatus.resolved)
        .where((i) => i.area != null)
        .where((i) => GeoShapes.distanceMeters(i.area!.center, position) < 1500)
        .toList();
  }
}

class MockReportRepository implements ReportRepository {
  MockReportRepository(this._backend, this._h3);

  final MockBackend _backend;
  final H3Service _h3;

  /// Limit jak w backendzie: 10 zgłoszeń / 10 min.
  final _sent = <DateTime>[];

  @override
  Future<List<ReportTypeOption>> getTypes() async => MockSeed.reportTypes;

  @override
  Future<ReportReceipt> createReport({
    required IncidentType type,
    required LatLng position,
    String? description,
    String? poiId,
    List<FuelType> fuelTypes = const [],
  }) async {
    await _backend.delay();
    final now = _backend.now;
    _sent.removeWhere((t) => now.difference(t) > const Duration(minutes: 10));
    if (_sent.length >= 10) {
      throw RateLimitedFailure(
        retryAfter: const Duration(minutes: 10) - now.difference(_sent.first),
      );
    }
    if ((description?.length ?? 0) > 1000) {
      throw const ValidationFailure(violations: {"description": "Maksymalnie 1000 znaków."});
    }
    final kind = MockSeed.reportTypes.where((t) => t.type == type).firstOrNull?.poiKind;
    final poi = kind == null ? null : _backend.resolvePoi(kind, position, poiId);
    if (kind != null && poi == null) {
      // Jak backend: brak obiektu w pobliżu → 422 `poi_required`.
      throw const ValidationFailure(violations: {"poiId": "Wybierz obiekt z listy."});
    }
    if (kind == PoiKind.fuelStation && fuelTypes.isEmpty) {
      throw const ValidationFailure(violations: {"fuelTypes": "Wybierz co najmniej jedno paliwo."});
    }
    _sent.add(now);
    final receipt = _backend.createReport(type, position, poi: poi, fuelTypes: fuelTypes);
    return receipt.copyWith(h3Cell: _h3.cellFor(position));
  }

  @override
  Future<ReportStatus> getReportStatus(String reportId) async {
    await _backend.delay();
    return _backend.reports[reportId] ?? (throw const NotFoundFailure());
  }
}

class MockVerificationRepository implements VerificationRepository {
  MockVerificationRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<List<VerificationQuestion>> getPending() async {
    await _backend.delay();
    return _backend.pendingQuestions();
  }

  @override
  Future<VerificationQuestion> getQuestion(String verificationId) async {
    await _backend.delay();
    return _backend.questions[verificationId] ?? (throw const NotFoundFailure());
  }

  @override
  Future<VerificationResult> respond(String verificationId, VerificationAnswer answer) async {
    await _backend.delay();
    return _backend.respond(verificationId, answer);
  }
}

class MockShelterRepository implements ShelterRepository {
  MockShelterRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<List<Shelter>> getNearest(LatLng position) async {
    await _backend.delay();
    final list =
        _backend.shelters.values
            .map((s) => s.copyWith(distanceMeters: GeoShapes.distanceMeters(position, s.location)))
            .toList()
          ..sort((a, b) => a.distanceMeters!.compareTo(b.distanceMeters!));
    return list.take(10).toList();
  }

  @override
  Future<List<Shelter>> getInBbox(BBox bbox) async {
    await _backend.delay();
    return _backend.shelters.values.where((s) => bbox.contains(s.location)).toList();
  }

  @override
  Future<Shelter> getShelter(String id) async {
    await _backend.delay();
    return _backend.shelters[id] ?? (throw const NotFoundFailure());
  }

  @override
  Future<Shelter> confirmStatus(
    String id,
    ShelterStatus status, {
    ShelterOccupancy? occupancy,
    String? comment,
  }) async {
    await _backend.delay();
    return _backend.confirmShelter(id, status, occupancy: occupancy);
  }
}

class MockFuelStationRepository implements FuelStationRepository {
  MockFuelStationRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<List<FuelStation>> getNearest(LatLng position) async {
    await _backend.delay();
    return _backend.fuelStations.values
        .map((s) => s.copyWith(distanceMeters: GeoShapes.distanceMeters(position, s.location)))
        .toList()
      ..sort((a, b) => a.distanceMeters!.compareTo(b.distanceMeters!));
  }

  @override
  Future<FuelStation> getStation(String id) async {
    await _backend.delay();
    return _backend.fuelStations[id] ?? (throw const NotFoundFailure());
  }

  @override
  Future<FuelStation> confirmStatus(
    String id, {
    required List<FuelType> fuelTypes,
    required bool available,
    String? comment,
  }) async {
    await _backend.delay();
    return _backend.confirmFuel(id, fuelTypes, available: available);
  }
}

class MockGuidanceRepository implements GuidanceRepository {
  MockGuidanceRepository(this._backend);

  final MockBackend _backend;

  @override
  Future<List<Procedure>> getProcedures({IncidentType? type}) async {
    await _backend.delay();
    return MockSeed.procedures
        .where((p) => p.appliesTo.isEmpty || (type != null && p.appliesTo.contains(type)))
        .toList()
      ..sort((a, b) => b.priority.compareTo(a.priority));
  }
}

class MockAlertRepository implements AlertRepository {
  MockAlertRepository(this._backend);

  final MockBackend _backend;

  /// W trybie mock alert dostaje każde urządzenie — demo nie zależy od adresu domowego.
  @override
  Future<List<Alert>> getAlertsAt(LatLng position) async {
    await _backend.delay();
    return _backend.activeAlerts().map((a) => a.copyWith(area: null)).toList();
  }

  @override
  Future<Alert> getAlert(String id) async {
    await _backend.delay();
    return _backend.alerts[id] ?? (throw const NotFoundFailure());
  }
}
