// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_accepted.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportAccepted _$ReportAcceptedFromJson(Map<String, dynamic> json) =>
    _ReportAccepted(
      reportId: json['reportId'] as String,
      h3Cell: json['h3Cell'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      scope: ReportScope.fromJson(json['scope'] as String),
      poi: json['poi'] == null
          ? null
          : PoiRef.fromJson(json['poi'] as Map<String, dynamic>),
      fuelTypes: (json['fuelTypes'] as List<dynamic>)
          .map((e) => FuelType.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$ReportAcceptedToJson(
  _ReportAccepted instance,
) => <String, dynamic>{
  'reportId': instance.reportId,
  'h3Cell': instance.h3Cell,
  'createdAt': instance.createdAt.toIso8601String(),
  'scope': _$ReportScopeEnumMap[instance.scope]!,
  'poi': instance.poi,
  'fuelTypes': instance.fuelTypes.map((e) => _$FuelTypeEnumMap[e]!).toList(),
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
