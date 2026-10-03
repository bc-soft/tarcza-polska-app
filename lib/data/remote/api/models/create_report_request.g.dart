// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReportRequest _$CreateReportRequestFromJson(Map<String, dynamic> json) =>
    _CreateReportRequest(
      type: ReportType.fromJson(json['type'] as String),
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      description: json['description'] as String?,
      poiId: json['poiId'] as String?,
      fuelTypes: (json['fuelTypes'] as List<dynamic>?)
          ?.map((e) => FuelType2.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$CreateReportRequestToJson(
  _CreateReportRequest instance,
) => <String, dynamic>{
  'type': _$ReportTypeEnumMap[instance.type]!,
  'lat': instance.lat,
  'lng': instance.lng,
  'description': instance.description,
  'poiId': instance.poiId,
  'fuelTypes': instance.fuelTypes?.map((e) => _$FuelType2EnumMap[e]!).toList(),
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

const _$FuelType2EnumMap = {
  FuelType2.pb95: 'pb95',
  FuelType2.pb98: 'pb98',
  FuelType2.diesel: 'diesel',
  FuelType2.lpg: 'lpg',
  FuelType2.$unknown: r'$unknown',
};
