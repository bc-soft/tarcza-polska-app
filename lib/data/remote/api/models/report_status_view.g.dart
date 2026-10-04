// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_status_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportStatusView _$ReportStatusViewFromJson(Map<String, dynamic> json) =>
    _ReportStatusView(
      reportId: json['reportId'] as String,
      type: ReportType.fromJson(json['type'] as String),
      typeLabel: json['typeLabel'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      incident: json['incident'] == null
          ? null
          : ReportIncidentRef.fromJson(
              json['incident'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ReportStatusViewToJson(_ReportStatusView instance) =>
    <String, dynamic>{
      'reportId': instance.reportId,
      'type': _$ReportTypeEnumMap[instance.type]!,
      'typeLabel': instance.typeLabel,
      'createdAt': instance.createdAt.toIso8601String(),
      'incident': instance.incident,
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
