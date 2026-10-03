// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_feature_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentFeatureProperties _$IncidentFeaturePropertiesFromJson(
  Map<String, dynamic> json,
) => _IncidentFeatureProperties(
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

Map<String, dynamic> _$IncidentFeaturePropertiesToJson(
  _IncidentFeatureProperties instance,
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
