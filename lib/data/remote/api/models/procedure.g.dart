// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Procedure _$ProcedureFromJson(Map<String, dynamic> json) => _Procedure(
  id: json['id'] as String,
  title: json['title'] as String,
  summary: json['summary'] as String,
  steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
  appliesTo: (json['appliesTo'] as List<dynamic>)
      .map((e) => ReportType.fromJson(e as String))
      .toList(),
  priority: (json['priority'] as num).toInt(),
);

Map<String, dynamic> _$ProcedureToJson(
  _Procedure instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'summary': instance.summary,
  'steps': instance.steps,
  'appliesTo': instance.appliesTo.map((e) => _$ReportTypeEnumMap[e]!).toList(),
  'priority': instance.priority,
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
