// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_station_feature_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FuelStationFeatureProperties _$FuelStationFeaturePropertiesFromJson(
  Map<String, dynamic> json,
) => _FuelStationFeatureProperties(
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

Map<String, dynamic> _$FuelStationFeaturePropertiesToJson(
  _FuelStationFeatureProperties instance,
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

const _$FuelTypeEnumMap = {
  FuelType.pb95: 'pb95',
  FuelType.pb98: 'pb98',
  FuelType.diesel: 'diesel',
  FuelType.lpg: 'lpg',
  FuelType.$unknown: r'$unknown',
};

const _$FuelStationFeaturePropertiesKindEnumMap = {
  FuelStationFeaturePropertiesKind.fuelStation: 'fuel_station',
  FuelStationFeaturePropertiesKind.$unknown: r'$unknown',
};
