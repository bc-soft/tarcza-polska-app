/// Mapowanie modeli wygenerowanych z `openapi.json` (`lib/data/remote/api/`) na modele
/// domenowe. BLoC-i nie znają typów API — tylko `lib/data/models/`.
library;

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/remote/api/export.dart" as api;

extension GeoJsonGeometryMapper on api.GeoJsonGeometry {
  /// Współrzędne GeoJSON są w kolejności `[lng, lat]`.
  GeoArea? toDomain() {
    final c = coordinates;
    return switch (type) {
      api.GeoJsonGeometryType.point => GeoArea.point(_latLng(c)),
      api.GeoJsonGeometryType.polygon => GeoArea.polygons([_polygon(c)]),
      api.GeoJsonGeometryType.multiPolygon => GeoArea.polygons(
        c.whereType<List<dynamic>>().map(_polygon).toList(),
      ),
      _ => null,
    };
  }

  LatLng? toPoint() => switch (toDomain()) {
    GeoPointArea(:final point) => point,
    _ => null,
  };

  static LatLng _latLng(List<dynamic> c) =>
      LatLng((c[1] as num).toDouble(), (c[0] as num).toDouble());

  static List<LatLng> _ring(List<dynamic> ring) =>
      ring.whereType<List<dynamic>>().map(_latLng).toList();

  static GeoPolygon _polygon(List<dynamic> rings) {
    final parsed = rings.whereType<List<dynamic>>().map(_ring).toList();
    return GeoPolygon(
      outer: parsed.isEmpty ? const [] : parsed.first,
      holes: parsed.length > 1 ? parsed.sublist(1) : const [],
    );
  }
}

IncidentType incidentType(api.ReportType type) => IncidentType.fromApi(type.json);

List<FuelType> toFuelTypes(Iterable<api.FuelType> types) =>
    types.map((t) => FuelType.fromApi(t.json)).nonNulls.toList();

PoiRef? poiRef(api.PoiRef? poi) {
  final kind = PoiKind.fromApi(poi?.kind.json);
  if (poi == null || kind == null) return null;
  return PoiRef(kind: kind, id: poi.id, name: poi.name, location: poi.location?.toPoint());
}

extension CommunityMapper on api.Community {
  Community toDomain() => Community(reports: reports, answers: answers, agreementPct: agreementPct);
}

extension IncidentViewMapper on api.IncidentView {
  Incident toDomain() => Incident(
    id: id,
    type: incidentType(type),
    typeLabel: typeLabel,
    status: IncidentStatus.fromApi(status.json),
    statusLabel: statusLabel,
    confidenceLevel: ConfidenceLevel.fromApi(confidenceLevel.json),
    confidenceLabel: confidenceLabel,
    confidenceScore: confidenceScore.clamp(0, 1),
    startedAt: startedAt,
    lastActivityAt: lastActivityAt,
    lastConfirmedAt: lastConfirmedAt,
    community: community.toDomain(),
    summary: summary,
    area: area?.toDomain(),
    scope: ReportScope.fromApi(scope.json),
    poi: poiRef(poi),
    fuelTypes: toFuelTypes(fuelTypes),
  );
}

extension ShelterViewMapper on api.ShelterView {
  Shelter toDomain() => Shelter(
    id: id,
    name: name,
    address: address,
    location: location.toPoint() ?? const LatLng(0, 0),
    status: ShelterStatus.fromApi(status.json),
    statusLabel: statusLabel,
    capacity: capacity,
    lastConfirmedAt: lastConfirmedAt,
    confirmationCount: confirmationCount,
    distanceMeters: distanceMeters?.toDouble(),
    occupancy: ShelterOccupancy.fromApi(occupancy.json),
    occupancyLabel: occupancyLabel,
    availabilityLabel: availabilityLabel,
  );
}

extension FuelStationFuelMapper on api.FuelStationFuel {
  FuelStatus? toDomain() {
    final fuel = FuelType.fromApi(type.json);
    if (fuel == null) return null;
    return FuelStatus(
      type: fuel,
      label: label,
      status: FuelAvailability.fromApi(status.json),
      statusLabel: statusLabel,
      confirmedAt: confirmedAt,
    );
  }
}

extension FuelStationViewMapper on api.FuelStationView {
  FuelStation toDomain() => FuelStation(
    id: id,
    name: name,
    brand: brand,
    address: address,
    location: location.toPoint() ?? const LatLng(0, 0),
    fuels: fuels.map((f) => f.toDomain()).nonNulls.toList(),
    shortage: shortage,
    missingFuelTypes: toFuelTypes(missingFuelTypes),
    lastConfirmedAt: lastConfirmedAt,
    confirmationCount: confirmationCount,
    distanceMeters: distanceMeters?.toDouble(),
  );
}

extension AlertViewMapper on api.AlertView {
  Alert toDomain() => Alert(
    id: id,
    title: title,
    body: body,
    severity: AlertSeverity.fromApi(severity.json),
    incidentId: incidentId,
    createdAt: createdAt,
    expiresAt: expiresAt,
    active: active,
    area: area.toDomain(),
  );
}

extension MapFeatureMapper on api.MapFeature {
  /// `null` dla nieznanego `kind` (fallback union) i nieobsługiwanej geometrii.
  MapFeature? toDomain() {
    final area = geometry.toDomain();
    final point = geometry.toPoint();
    return switch (properties) {
      api.MapFeaturePropertiesUnionIncident(
        :final id,
        :final type,
        :final typeLabel,
        :final status,
        :final statusLabel,
        :final confidenceLevel,
        :final confidenceLabel,
        :final confidenceScore,
        :final startedAt,
        :final lastActivityAt,
        :final lastConfirmedAt,
        :final community,
        :final summary,
        :final scope,
        :final poi,
        fuelTypes: final fuels,
      ) =>
        MapFeature.incident(
          Incident(
            id: id,
            type: incidentType(type),
            typeLabel: typeLabel,
            status: IncidentStatus.fromApi(status.json),
            statusLabel: statusLabel,
            confidenceLevel: ConfidenceLevel.fromApi(confidenceLevel.json),
            confidenceLabel: confidenceLabel,
            confidenceScore: confidenceScore.clamp(0, 1),
            startedAt: startedAt,
            lastActivityAt: lastActivityAt,
            lastConfirmedAt: lastConfirmedAt,
            community: community.toDomain(),
            summary: summary,
            // Bez zasięgu (i dla incydentów punktowych) geometrią jest `Point`.
            area: area,
            scope: ReportScope.fromApi(scope.json),
            poi: poiRef(poi),
            fuelTypes: toFuelTypes(fuels),
          ),
        ),
      api.MapFeaturePropertiesUnionShelter(
        :final id,
        :final name,
        :final address,
        :final status,
        :final statusLabel,
        :final capacity,
        :final lastConfirmedAt,
        :final confirmationCount,
        :final occupancy,
        :final occupancyLabel,
        :final availabilityLabel,
      ) =>
        point == null
            ? null
            : MapFeature.shelter(
                Shelter(
                  id: id,
                  name: name,
                  address: address,
                  location: point,
                  status: ShelterStatus.fromApi(status.json),
                  statusLabel: statusLabel,
                  capacity: capacity,
                  lastConfirmedAt: lastConfirmedAt,
                  confirmationCount: confirmationCount,
                  occupancy: ShelterOccupancy.fromApi(occupancy.json),
                  occupancyLabel: occupancyLabel,
                  availabilityLabel: availabilityLabel,
                ),
              ),
      api.MapFeaturePropertiesUnionFuelStation(
        :final id,
        :final name,
        :final brand,
        :final address,
        :final fuels,
        :final shortage,
        :final missingFuelTypes,
        :final lastConfirmedAt,
        :final confirmationCount,
      ) =>
        point == null
            ? null
            : MapFeature.fuelStation(
                FuelStation(
                  id: id,
                  name: name,
                  brand: brand,
                  address: address,
                  location: point,
                  fuels: fuels.map((f) => f.toDomain()).nonNulls.toList(),
                  shortage: shortage,
                  missingFuelTypes: toFuelTypes(missingFuelTypes),
                  lastConfirmedAt: lastConfirmedAt,
                  confirmationCount: confirmationCount,
                ),
              ),
      api.MapFeaturePropertiesUnionAlert(
        :final id,
        :final title,
        :final body,
        :final severity,
        :final incidentId,
        :final createdAt,
        :final expiresAt,
        :final active,
      ) =>
        MapFeature.alert(
          Alert(
            id: id,
            title: title,
            body: body,
            severity: AlertSeverity.fromApi(severity.json),
            incidentId: incidentId,
            createdAt: createdAt,
            expiresAt: expiresAt,
            active: active,
            area: area,
          ),
        ),
      api.MapFeaturePropertiesUnionUnknown() => null,
    };
  }
}

extension VerificationQuestionMapper on api.VerificationQuestion {
  VerificationQuestion toDomain() {
    final kind = PoiKind.fromApi(poi?.kind.json);
    final ref = poi;
    return VerificationQuestion(
      verificationId: verificationId,
      incidentId: incidentId,
      type: incidentType(type),
      typeLabel: typeLabel,
      question: question,
      context: context,
      poi: ref == null || kind == null ? null : PoiRef(kind: kind, id: ref.id, name: ref.name),
      options: options
          .where((api.VerificationAnswer o) => o != api.VerificationAnswer.$unknown)
          .map((api.VerificationAnswer o) => VerificationAnswer.fromApi(o.json))
          .toSet()
          .toList(),
      sentAt: sentAt,
      expiresAt: expiresAt,
      answered: answered,
    );
  }
}

extension VerificationResultMapper on api.VerificationResult {
  VerificationResult toDomain() =>
      VerificationResult(verificationId: verificationId, incidentId: incidentId, thanks: thanks);
}

extension ReportTypeOptionMapper on api.ReportTypeOption {
  ReportTypeOption toDomain() => ReportTypeOption(
    type: incidentType(value),
    label: label,
    scope: ReportScope.fromApi(scope.json),
    poiKind: PoiKind.fromApi(poiKind?.json),
    fuelTypes: [
      for (final f in fuelTypes)
        if (FuelType.fromApi(f.value.json) case final type?)
          FuelTypeOption(type: type, label: f.label),
    ],
  );
}

extension ReportAcceptedMapper on api.ReportAccepted {
  ReportReceipt toDomain() => ReportReceipt(
    reportId: reportId,
    h3Cell: h3Cell,
    createdAt: createdAt,
    scope: ReportScope.fromApi(scope.json),
    poi: poiRef(poi),
  );
}

extension ReportStatusViewMapper on api.ReportStatusView {
  ReportStatus toDomain() {
    final ref = incident;
    return ReportStatus(
      reportId: reportId,
      type: incidentType(type),
      typeLabel: typeLabel,
      createdAt: createdAt,
      incident: ref == null
          ? null
          : ReportIncidentRef(
              id: ref.id,
              status: IncidentStatus.fromApi(ref.status.json),
              confidenceLevel: ConfidenceLevel.fromApi(ref.confidenceLevel.json),
              confidenceScore: ref.confidenceScore,
              typeLabel: ref.typeLabel,
              statusLabel: ref.statusLabel,
              confidenceLabel: ref.confidenceLabel,
            ),
    );
  }
}

extension IncidentTimelineEntryMapper on api.IncidentTimelineEntry {
  IncidentTimelineEntry toDomain() =>
      IncidentTimelineEntry(type: type.json ?? "unknown", label: label, at: at, details: details);
}

extension ProcedureMapper on api.Procedure {
  Procedure toDomain() => Procedure(
    id: id,
    title: title,
    summary: summary,
    steps: steps,
    appliesTo: appliesTo.map(incidentType).toList(),
    priority: priority,
  );
}

extension DeviceProfileMapper on api.DeviceProfile {
  DeviceProfile toDomain() => DeviceProfile(
    deviceId: deviceId,
    platform: platform,
    hasPushToken: hasPushToken,
    lastLocation: lastLocation?.toPoint(),
    h3Cell: h3Cell,
    locationUpdatedAt: locationUpdatedAt,
    locationSource: LocationSource.values.where((s) => s.name == locationSource?.json).firstOrNull,
    locationRefresh: preferences.locationRefresh,
  );
}

api.LocationSource locationSourceToApi(LocationSource source) => switch (source) {
  LocationSource.home => api.LocationSource.home,
  LocationSource.gps => api.LocationSource.gps,
  LocationSource.background => api.LocationSource.background,
};

api.FuelType2 fuelTypeToApi(FuelType type) => api.FuelType2.fromJson(type.apiValue);
