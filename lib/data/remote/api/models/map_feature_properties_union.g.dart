// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_feature_properties_union.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapFeaturePropertiesUnionIncident _$MapFeaturePropertiesUnionIncidentFromJson(
  Map<String, dynamic> json,
) => MapFeaturePropertiesUnionIncident(
  id: json['id'] as String,
  type: ReportType.fromJson(json['type'] as String),
  typeLabel: json['typeLabel'] as String,
  status: IncidentStatus.fromJson(json['status'] as String),
  statusLabel: json['statusLabel'] as String,
  confidenceLevel: ConfidenceLevel.fromJson(json['confidenceLevel'] as String),
  confidenceLabel: json['confidenceLabel'] as String,
  confidenceScore: (json['confidenceScore'] as num).toDouble(),
  startedAt: DateTime.parse(json['startedAt'] as String),
  lastActivityAt: DateTime.parse(json['lastActivityAt'] as String),
  community: Community.fromJson(json['community'] as Map<String, dynamic>),
  scope: ReportScope.fromJson(json['scope'] as String),
  poi: json['poi'] == null
      ? null
      : PoiRef.fromJson(json['poi'] as Map<String, dynamic>),
  fuelTypes: (json['fuelTypes'] as List<dynamic>)
      .map((e) => FuelType.fromJson(e as String))
      .toList(),
  kind: IncidentFeaturePropertiesKind.fromJson(json['kind'] as String),
  lastConfirmedAt: json['lastConfirmedAt'] == null
      ? null
      : DateTime.parse(json['lastConfirmedAt'] as String),
  summary: json['summary'] as String?,
);

Map<String, dynamic> _$MapFeaturePropertiesUnionIncidentToJson(
  MapFeaturePropertiesUnionIncident instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$ReportTypeEnumMap[instance.type]!,
  'typeLabel': instance.typeLabel,
  'status': _$IncidentStatusEnumMap[instance.status]!,
  'statusLabel': instance.statusLabel,
  'confidenceLevel': _$ConfidenceLevelEnumMap[instance.confidenceLevel]!,
  'confidenceLabel': instance.confidenceLabel,
  'confidenceScore': instance.confidenceScore,
  'startedAt': instance.startedAt.toIso8601String(),
  'lastActivityAt': instance.lastActivityAt.toIso8601String(),
  'community': instance.community,
  'scope': _$ReportScopeEnumMap[instance.scope]!,
  'poi': instance.poi,
  'fuelTypes': instance.fuelTypes.map((e) => _$FuelTypeEnumMap[e]!).toList(),
  'kind': _$IncidentFeaturePropertiesKindEnumMap[instance.kind]!,
  'lastConfirmedAt': instance.lastConfirmedAt?.toIso8601String(),
  'summary': instance.summary,
};

const _$ReportTypeEnumMap = {
  ReportType.powerOutage: 'power_outage',
  ReportType.waterOutage: 'water_outage',
  ReportType.fuelShortage: 'fuel_shortage',
  ReportType.roadBlocked: 'road_blocked',
  ReportType.shelterIssue: 'shelter_issue',
  ReportType.otherThreat: 'other_threat',
  ReportType.$unknown: r'$unknown',
};

const _$IncidentStatusEnumMap = {
  IncidentStatus.detected: 'detected',
  IncidentStatus.verifying: 'verifying',
  IncidentStatus.active: 'active',
  IncidentStatus.resolved: 'resolved',
  IncidentStatus.$unknown: r'$unknown',
};

const _$ConfidenceLevelEnumMap = {
  ConfidenceLevel.unverified: 'unverified',
  ConfidenceLevel.likely: 'likely',
  ConfidenceLevel.high: 'high',
  ConfidenceLevel.confirmed: 'confirmed',
  ConfidenceLevel.$unknown: r'$unknown',
};

const _$ReportScopeEnumMap = {
  ReportScope.area: 'area',
  ReportScope.point: 'point',
  ReportScope.$unknown: r'$unknown',
};

const _$FuelTypeEnumMap = {
  FuelType.pb95: 'pb95',
  FuelType.pb98: 'pb98',
  FuelType.diesel: 'diesel',
  FuelType.lpg: 'lpg',
  FuelType.$unknown: r'$unknown',
};

const _$IncidentFeaturePropertiesKindEnumMap = {
  IncidentFeaturePropertiesKind.incident: 'incident',
  IncidentFeaturePropertiesKind.$unknown: r'$unknown',
};

MapFeaturePropertiesUnionShelter _$MapFeaturePropertiesUnionShelterFromJson(
  Map<String, dynamic> json,
) => MapFeaturePropertiesUnionShelter(
  id: json['id'] as String,
  name: json['name'] as String,
  status: ShelterStatus.fromJson(json['status'] as String),
  statusLabel: json['statusLabel'] as String,
  occupancy: ShelterOccupancy.fromJson(json['occupancy'] as String),
  occupancyLabel: json['occupancyLabel'] as String,
  confirmationCount: (json['confirmationCount'] as num).toInt(),
  kind: ShelterFeaturePropertiesKind.fromJson(json['kind'] as String),
  address: json['address'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  availability: json['availability'] == null
      ? null
      : ShelterAvailability.fromJson(json['availability'] as String),
  availabilityLabel: json['availabilityLabel'] as String?,
  lastConfirmedAt: json['lastConfirmedAt'] == null
      ? null
      : DateTime.parse(json['lastConfirmedAt'] as String),
  distanceMeters: (json['distanceMeters'] as num?)?.toInt(),
);

Map<String, dynamic> _$MapFeaturePropertiesUnionShelterToJson(
  MapFeaturePropertiesUnionShelter instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': _$ShelterStatusEnumMap[instance.status]!,
  'statusLabel': instance.statusLabel,
  'occupancy': _$ShelterOccupancyEnumMap[instance.occupancy]!,
  'occupancyLabel': instance.occupancyLabel,
  'confirmationCount': instance.confirmationCount,
  'kind': _$ShelterFeaturePropertiesKindEnumMap[instance.kind]!,
  'address': instance.address,
  'capacity': instance.capacity,
  'availability': _$ShelterAvailabilityEnumMap[instance.availability],
  'availabilityLabel': instance.availabilityLabel,
  'lastConfirmedAt': instance.lastConfirmedAt?.toIso8601String(),
  'distanceMeters': instance.distanceMeters,
};

const _$ShelterStatusEnumMap = {
  ShelterStatus.unknown: 'unknown',
  ShelterStatus.open: 'open',
  ShelterStatus.closed: 'closed',
  ShelterStatus.full: 'full',
  ShelterStatus.$unknown: r'$unknown',
};

const _$ShelterOccupancyEnumMap = {
  ShelterOccupancy.unknown: 'unknown',
  ShelterOccupancy.plenty: 'plenty',
  ShelterOccupancy.limited: 'limited',
  ShelterOccupancy.full: 'full',
  ShelterOccupancy.$unknown: r'$unknown',
};

const _$ShelterFeaturePropertiesKindEnumMap = {
  ShelterFeaturePropertiesKind.shelter: 'shelter',
  ShelterFeaturePropertiesKind.$unknown: r'$unknown',
};

const _$ShelterAvailabilityEnumMap = {
  ShelterAvailability.unknown: 'unknown',
  ShelterAvailability.always: 'always',
  ShelterAvailability.onDemand: 'on_demand',
  ShelterAvailability.scheduled: 'scheduled',
  ShelterAvailability.$unknown: r'$unknown',
};

MapFeaturePropertiesUnionFuelStation
_$MapFeaturePropertiesUnionFuelStationFromJson(Map<String, dynamic> json) =>
    MapFeaturePropertiesUnionFuelStation(
      id: json['id'] as String,
      name: json['name'] as String,
      fuels: (json['fuels'] as List<dynamic>)
          .map((e) => FuelStationFuel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortage: json['shortage'] as bool,
      missingFuelTypes: (json['missingFuelTypes'] as List<dynamic>)
          .map((e) => FuelType.fromJson(e as String))
          .toList(),
      confirmationCount: (json['confirmationCount'] as num).toInt(),
      kind: FuelStationFeaturePropertiesKind.fromJson(json['kind'] as String),
      brand: json['brand'] as String?,
      address: json['address'] as String?,
      lastConfirmedAt: json['lastConfirmedAt'] == null
          ? null
          : DateTime.parse(json['lastConfirmedAt'] as String),
      distanceMeters: (json['distanceMeters'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MapFeaturePropertiesUnionFuelStationToJson(
  MapFeaturePropertiesUnionFuelStation instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'fuels': instance.fuels,
  'shortage': instance.shortage,
  'missingFuelTypes': instance.missingFuelTypes
      .map((e) => _$FuelTypeEnumMap[e]!)
      .toList(),
  'confirmationCount': instance.confirmationCount,
  'kind': _$FuelStationFeaturePropertiesKindEnumMap[instance.kind]!,
  'brand': instance.brand,
  'address': instance.address,
  'lastConfirmedAt': instance.lastConfirmedAt?.toIso8601String(),
  'distanceMeters': instance.distanceMeters,
};

const _$FuelStationFeaturePropertiesKindEnumMap = {
  FuelStationFeaturePropertiesKind.fuelStation: 'fuel_station',
  FuelStationFeaturePropertiesKind.$unknown: r'$unknown',
};

MapFeaturePropertiesUnionAlert _$MapFeaturePropertiesUnionAlertFromJson(
  Map<String, dynamic> json,
) => MapFeaturePropertiesUnionAlert(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  severity: AlertSeverity.fromJson(json['severity'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  active: json['active'] as bool,
  kind: AlertFeaturePropertiesKind.fromJson(json['kind'] as String),
  incidentId: json['incidentId'] as String?,
);

Map<String, dynamic> _$MapFeaturePropertiesUnionAlertToJson(
  MapFeaturePropertiesUnionAlert instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'severity': _$AlertSeverityEnumMap[instance.severity]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
  'active': instance.active,
  'kind': _$AlertFeaturePropertiesKindEnumMap[instance.kind]!,
  'incidentId': instance.incidentId,
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.danger: 'danger',
  AlertSeverity.$unknown: r'$unknown',
};

const _$AlertFeaturePropertiesKindEnumMap = {
  AlertFeaturePropertiesKind.alert: 'alert',
  AlertFeaturePropertiesKind.$unknown: r'$unknown',
};

MapFeaturePropertiesUnionUnknown _$MapFeaturePropertiesUnionUnknownFromJson(
  Map<String, dynamic> json,
) => MapFeaturePropertiesUnionUnknown($type: json['kind'] as String?);

Map<String, dynamic> _$MapFeaturePropertiesUnionUnknownToJson(
  MapFeaturePropertiesUnionUnknown instance,
) => <String, dynamic>{'kind': instance.$type};
