// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_incident_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportIncidentRef _$ReportIncidentRefFromJson(Map<String, dynamic> json) =>
    _ReportIncidentRef(
      id: json['id'] as String,
      type: ReportType.fromJson(json['type'] as String),
      typeLabel: json['typeLabel'] as String,
      status: IncidentStatus.fromJson(json['status'] as String),
      statusLabel: json['statusLabel'] as String,
      confidenceLevel: ConfidenceLevel.fromJson(
        json['confidenceLevel'] as String,
      ),
      confidenceLabel: json['confidenceLabel'] as String,
      confidenceScore: (json['confidenceScore'] as num).toDouble(),
    );

Map<String, dynamic> _$ReportIncidentRefToJson(_ReportIncidentRef instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'typeLabel': instance.typeLabel,
      'status': _$IncidentStatusEnumMap[instance.status]!,
      'statusLabel': instance.statusLabel,
      'confidenceLevel': _$ConfidenceLevelEnumMap[instance.confidenceLevel]!,
      'confidenceLabel': instance.confidenceLabel,
      'confidenceScore': instance.confidenceScore,
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
