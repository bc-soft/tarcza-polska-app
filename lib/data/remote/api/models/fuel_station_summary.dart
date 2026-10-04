// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_station_fuel.dart';
import 'fuel_type.dart';

part 'fuel_station_summary.freezed.dart';
part 'fuel_station_summary.g.dart';

@Freezed()
abstract class FuelStationSummary with _$FuelStationSummary {
  const factory FuelStationSummary({
    required String id,
    required String name,

    /// Fuel types sold (or ever reported) at this station with current availability
    required List<FuelStationFuel> fuels,

    /// At least one fuel type currently reported missing
    required bool shortage,
    required List<FuelType> missingFuelTypes,
    required int confirmationCount,
    String? brand,
    String? address,
    DateTime? lastConfirmedAt,

    /// Only in GET /fuel-stations?lat&lng and the offline bundle
    int? distanceMeters,
  }) = _FuelStationSummary;
  
  factory FuelStationSummary.fromJson(Map<String, Object?> json) => _$FuelStationSummaryFromJson(json);
}
