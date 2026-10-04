// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_fuel_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmFuelStatusRequest _$ConfirmFuelStatusRequestFromJson(
  Map<String, dynamic> json,
) => _ConfirmFuelStatusRequest(
  fuelTypes: (json['fuelTypes'] as List<dynamic>)
      .map((e) => FuelType2.fromJson(e as String))
      .toList(),
  available: json['available'] as bool,
  comment: json['comment'] as String?,
);

Map<String, dynamic> _$ConfirmFuelStatusRequestToJson(
  _ConfirmFuelStatusRequest instance,
) => <String, dynamic>{
  'fuelTypes': instance.fuelTypes.map((e) => _$FuelType2EnumMap[e]!).toList(),
  'available': instance.available,
  'comment': instance.comment,
};

const _$FuelType2EnumMap = {
  FuelType2.pb95: 'pb95',
  FuelType2.pb98: 'pb98',
  FuelType2.diesel: 'diesel',
  FuelType2.lpg: 'lpg',
  FuelType2.$unknown: r'$unknown',
};
