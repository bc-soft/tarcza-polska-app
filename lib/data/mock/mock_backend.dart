import "dart:async";

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/mock/geo_shapes.dart";
import "package:tarcza_polska/data/mock/mock_seed.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Stan „serwera” w trybie mock, współdzielony przez repozytoria `Mock*`
/// i scenariusz demo. Zwraca dokładnie te kształty danych co backend.
class MockBackend {
  MockBackend({DateTime Function()? clock, this.latency = const Duration(milliseconds: 250)})
    : _clock = clock ?? DateTime.now {
    reset();
  }

  final DateTime Function() _clock;

  /// Sztuczne opóźnienie odpowiedzi — UI musi pokazać stany ładowania.
  final Duration latency;

  final _changes = StreamController<void>.broadcast();

  final Map<String, Incident> incidents = {};
  final Map<String, Shelter> shelters = {};
  final Map<String, Alert> alerts = {};
  final Map<String, VerificationQuestion> questions = {};
  final Map<String, ReportStatus> reports = {};
  final Map<String, FuelStation> fuelStations = {};
  final Map<String, List<IncidentTimelineEntry>> timelines = {};

  /// Odpowiedzi tego urządzenia — scenariusz demo reaguje na nie.
  final _answers = StreamController<(VerificationQuestion, VerificationAnswer)>.broadcast();

  LatLng? deviceLocation;
  int _sequence = 0;

  DateTime get now => _clock();

  /// Każda zmiana stanu (mapa, incydenty, alerty).
  Stream<void> get changes => _changes.stream;

  Stream<(VerificationQuestion, VerificationAnswer)> get answers => _answers.stream;

  String nextId(String prefix) => "$prefix-${now.millisecondsSinceEpoch}-${_sequence++}";

  Future<void> delay() => latency == Duration.zero ? Future.value() : Future.delayed(latency);

  void notify() => _changes.add(null);

  void reset() {
    final t = now;
    incidents
      ..clear()
      ..addEntries(MockSeed.backgroundIncidents(t).map((i) => MapEntry(i.id, i)));
    shelters
      ..clear()
      ..addEntries(MockSeed.shelters(t).map((s) => MapEntry(s.id, s)));
    fuelStations
      ..clear()
      ..addEntries(MockSeed.fuelStations(t).map((s) => MapEntry(s.id, s)));
    timelines.clear();
    alerts.clear();
    questions.clear();
    reports.clear();
    notify();
  }

  // --- Zgłoszenia ---------------------------------------------------------------------------

  /// Dołącza zgłoszenie do istniejącego incydentu tego typu (≤1,5 km)
  /// albo zakłada nowy, niezweryfikowany incydent z zasięgiem `Point`.
  /// Wpis osi czasu incydentu (jak `GET /incidents/{id}/timeline`).
  void addTimeline(String incidentId, String type, String label, [Map<String, dynamic>? details]) {
    (timelines[incidentId] ??= []).add(
      IncidentTimelineEntry(type: type, label: label, at: now, details: details ?? const {}),
    );
  }

  /// Obiekt dla zgłoszenia punktowego: wskazany albo najbliższy w promieniu
  /// (stacja 750 m, schron 500 m — jak w backendzie).
  PoiRef? resolvePoi(PoiKind kind, LatLng position, String? poiId) {
    final candidates = switch (kind) {
      PoiKind.fuelStation => fuelStations.values.map(
        (s) => PoiRef(kind: kind, id: s.id, name: s.name, location: s.location),
      ),
      PoiKind.shelter => shelters.values.map(
        (s) => PoiRef(kind: kind, id: s.id, name: s.name, location: s.location),
      ),
    };
    if (poiId != null) return candidates.where((p) => p.id == poiId).firstOrNull;
    final limit = kind == PoiKind.fuelStation ? 750 : 500;
    final near =
        candidates.where((p) => GeoShapes.distanceMeters(p.location!, position) <= limit).toList()
          ..sort(
            (a, b) => GeoShapes.distanceMeters(a.location!, position).compareTo(
              GeoShapes.distanceMeters(b.location!, position),
            ),
          );
    return near.firstOrNull;
  }

  ReportReceipt createReport(
    IncidentType type,
    LatLng position, {
    PoiRef? poi,
    List<FuelType> fuelTypes = const [],
  }) {
    final t = now;
    final reportId = nextId("report");
    deviceLocation = position;

    final match = incidents.values
        .where((i) => i.type == type && i.status != IncidentStatus.resolved)
        .where((i) => poi == null ? i.poi == null : i.poi?.id == poi.id)
        .where((i) => i.area != null)
        .where((i) => poi != null || GeoShapes.distanceMeters(i.area!.center, position) <= 1500)
        .firstOrNull;

    final Incident incident;
    if (match != null) {
      incident = match.copyWith(
        lastActivityAt: t,
        community: match.community.copyWith(reports: match.community.reports + 1),
      );
    } else {
      incident = Incident(
        id: nextId("incident"),
        type: type,
        typeLabel: MockSeed.typeLabel(type),
        status: IncidentStatus.detected,
        confidenceLevel: ConfidenceLevel.unverified,
        confidenceLabel: MockSeed.confidenceLabels[ConfidenceLevel.unverified]!,
        confidenceScore: 0.15,
        startedAt: t,
        lastActivityAt: t,
        community: const Community(reports: 1),
        // Zgłoszenie punktowe: incydent w miejscu obiektu, bez poligonu.
        area: GeoArea.point(poi?.location ?? position),
        scope: poi == null ? ReportScope.area : ReportScope.point,
        poi: poi,
        fuelTypes: fuelTypes,
      );
      addTimeline(incident.id, "created", "Wykryto skupisko zgłoszeń", {"reports": 1});
    }
    if (poi?.kind == PoiKind.fuelStation && fuelTypes.isNotEmpty) {
      _markFuel(poi!.id, fuelTypes, available: false);
    }

    reports[reportId] = ReportStatus(reportId: reportId, type: type, createdAt: t);
    // Jak w backendzie: łączenie w incydent dzieje się w tle po ~1 s.
    Timer(const Duration(milliseconds: 1200), () {
      incidents[incident.id] = incident;
      reports[reportId] = reports[reportId]!.copyWith(
        incident: ReportIncidentRef(
          id: incident.id,
          status: incident.status,
          confidenceLevel: incident.confidenceLevel,
          confidenceScore: incident.confidenceScore,
        ),
      );
      notify();
    });
    return ReportReceipt(
      reportId: reportId,
      createdAt: t,
      scope: poi == null ? ReportScope.area : ReportScope.point,
      poi: poi,
    );
  }

  // --- Weryfikacja --------------------------------------------------------------------------

  List<VerificationQuestion> pendingQuestions() =>
      questions.values.where((q) => !q.answered && !q.isExpiredAt(now)).toList()
        ..sort((a, b) => b.sentAt.compareTo(a.sentAt));

  VerificationResult respond(String verificationId, VerificationAnswer answer) {
    final question = questions[verificationId];
    if (question == null) throw const NotFoundFailure();
    if (question.answered) throw const AlreadyAnsweredFailure();
    if (question.isExpiredAt(now)) throw const QuestionExpiredFailure();

    final answered = question.copyWith(answered: true);
    questions[verificationId] = answered;
    _answers.add((answered, answer));
    return VerificationResult(
      verificationId: verificationId,
      incidentId: question.incidentId,
      thanks: "Dziękujemy. Twoja odpowiedź pomaga wyznaczyć zasięg problemu.",
    );
  }

  // --- Schrony ------------------------------------------------------------------------------

  Shelter confirmShelter(String id, ShelterStatus status, {ShelterOccupancy? occupancy}) {
    final shelter = shelters[id];
    if (shelter == null) throw const NotFoundFailure();
    final occ = status == ShelterStatus.closed
        ? ShelterOccupancy.unknown
        : (occupancy ?? shelter.occupancy);
    final updated = shelter.copyWith(
      status: status,
      statusLabel: MockSeed.shelterLabels[status]!,
      occupancy: occ,
      occupancyLabel: MockSeed.occupancyLabels[occ],
      lastConfirmedAt: now,
      confirmationCount: shelter.confirmationCount + 1,
    );
    shelters[id] = updated;
    notify();
    return updated;
  }

  FuelStation confirmFuel(String id, List<FuelType> types, {required bool available}) {
    if (!fuelStations.containsKey(id)) throw const NotFoundFailure();
    _markFuel(id, types, available: available);
    notify();
    return fuelStations[id]!;
  }

  void _markFuel(String id, List<FuelType> types, {required bool available}) {
    final station = fuelStations[id];
    if (station == null) return;
    final t = now;
    final fuels = [...station.fuels];
    for (final type in types) {
      final status = FuelStatus(
        type: type,
        label: MockSeed.fuelLabels[type]!,
        status: available ? FuelAvailability.available : FuelAvailability.unavailable,
        statusLabel: available ? "Dostępne" : "Brak",
        confirmedAt: t,
      );
      final index = fuels.indexWhere((f) => f.type == type);
      if (index >= 0) {
        fuels[index] = status;
      } else {
        fuels.add(status);
      }
    }
    final missing = [
      for (final f in fuels)
        if (f.status == FuelAvailability.unavailable) f.type,
    ];
    fuelStations[id] = station.copyWith(
      fuels: fuels,
      shortage: missing.isNotEmpty,
      missingFuelTypes: missing,
      lastConfirmedAt: t,
      confirmationCount: station.confirmationCount + 1,
    );
  }

  List<Alert> activeAlerts() =>
      alerts.values.where((a) => a.active && a.expiresAt.isAfter(now)).toList()
        ..sort((a, b) => (b.createdAt ?? now).compareTo(a.createdAt ?? now));

  Future<void> dispose() async {
    await _changes.close();
    await _answers.close();
  }
}
