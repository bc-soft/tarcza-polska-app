// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FuelTypes _$FuelTypesFromJson(Map<String, dynamic> json) => _FuelTypes(
  value: FuelType.fromJson(json['value'] as String),
  label: json['label'] as String,
);

Map<String, dynamic> _$FuelTypesToJson(_FuelTypes instance) =>
    <String, dynamic>{
      'value': _$FuelTypeEnumMap[instance.value]!,
      'label': instance.label,
    };

const _$FuelTypeEnumMap = {
  FuelType.pb95: 'pb95',
  FuelType.pb98: 'pb98',
  FuelType.diesel: 'diesel',
  FuelType.lpg: 'lpg',
  FuelType.$unknown: r'$unknown',
};
