// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_type_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportTypeOption _$ReportTypeOptionFromJson(Map<String, dynamic> json) =>
    _ReportTypeOption(
      value: ReportType.fromJson(json['value'] as String),
      label: json['label'] as String,
      scope: ReportScope.fromJson(json['scope'] as String),
      poiKind: json['poiKind'] == null
          ? null
          : PoiKind.fromJson(json['poiKind'] as String),
      fuelTypes: (json['fuelTypes'] as List<dynamic>)
          .map((e) => FuelTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReportTypeOptionToJson(_ReportTypeOption instance) =>
    <String, dynamic>{
      'value': _$ReportTypeEnumMap[instance.value]!,
      'label': instance.label,
      'scope': _$ReportScopeEnumMap[instance.scope]!,
      'poiKind': _$PoiKindEnumMap[instance.poiKind],
      'fuelTypes': instance.fuelTypes,
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

const _$ReportScopeEnumMap = {
  ReportScope.area: 'area',
  ReportScope.point: 'point',
  ReportScope.$unknown: r'$unknown',
};

const _$PoiKindEnumMap = {
  PoiKind.fuelStation: 'fuel_station',
  PoiKind.shelter: 'shelter',
  PoiKind.$unknown: r'$unknown',
};
