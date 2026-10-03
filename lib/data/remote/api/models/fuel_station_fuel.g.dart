// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuel_station_fuel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FuelStationFuel _$FuelStationFuelFromJson(Map<String, dynamic> json) =>
    _FuelStationFuel(
      type: FuelType.fromJson(json['type'] as String),
      label: json['label'] as String,
      status: FuelAvailability.fromJson(json['status'] as String),
      statusLabel: json['statusLabel'] as String,
      confirmedAt: json['confirmedAt'] == null
          ? null
          : DateTime.parse(json['confirmedAt'] as String),
    );

Map<String, dynamic> _$FuelStationFuelToJson(_FuelStationFuel instance) =>
    <String, dynamic>{
      'type': _$FuelTypeEnumMap[instance.type]!,
      'label': instance.label,
      'status': _$FuelAvailabilityEnumMap[instance.status]!,
      'statusLabel': instance.statusLabel,
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
    };

const _$FuelTypeEnumMap = {
  FuelType.pb95: 'pb95',
  FuelType.pb98: 'pb98',
  FuelType.diesel: 'diesel',
  FuelType.lpg: 'lpg',
  FuelType.$unknown: r'$unknown',
};

const _$FuelAvailabilityEnumMap = {
  FuelAvailability.unknown: 'unknown',
  FuelAvailability.available: 'available',
  FuelAvailability.unavailable: 'unavailable',
  FuelAvailability.$unknown: r'$unknown',
};
