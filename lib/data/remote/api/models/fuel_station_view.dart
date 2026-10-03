// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_station_fuel.dart';
import 'fuel_type.dart';
import 'geo_json_geometry.dart';

part 'fuel_station_view.freezed.dart';
part 'fuel_station_view.g.dart';

@Freezed()
abstract class FuelStationView with _$FuelStationView {
  const factory FuelStationView({
    required String id,
    required String name,

    /// Fuel types sold (or ever reported) at this station with current availability
    required List<FuelStationFuel> fuels,

    /// At least one fuel type currently reported missing
    required bool shortage,
    required List<FuelType> missingFuelTypes,
    required int confirmationCount,
    required GeoJsonGeometry location,
    String? brand,
    String? address,
    DateTime? lastConfirmedAt,

    /// Only in GET /fuel-stations?lat&lng and the offline bundle
    int? distanceMeters,
  }) = _FuelStationView;
  
  factory FuelStationView.fromJson(Map<String, Object?> json) => _$FuelStationViewFromJson(json);
}
