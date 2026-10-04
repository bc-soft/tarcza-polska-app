// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_availability.dart';
import 'fuel_type.dart';

part 'fuel_station_fuel.freezed.dart';
part 'fuel_station_fuel.g.dart';

@Freezed()
abstract class FuelStationFuel with _$FuelStationFuel {
  const factory FuelStationFuel({
    required FuelType type,
    required String label,
    required FuelAvailability status,
    required String statusLabel,
    DateTime? confirmedAt,
  }) = _FuelStationFuel;
  
  factory FuelStationFuel.fromJson(Map<String, Object?> json) => _$FuelStationFuelFromJson(json);
}
