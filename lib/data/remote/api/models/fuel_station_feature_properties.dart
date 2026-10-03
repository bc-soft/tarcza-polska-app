// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_station_feature_properties_kind.dart';
import 'fuel_station_fuel.dart';
import 'fuel_type.dart';

part 'fuel_station_feature_properties.freezed.dart';
part 'fuel_station_feature_properties.g.dart';

@Freezed()
abstract class FuelStationFeatureProperties with _$FuelStationFeatureProperties {
  const factory FuelStationFeatureProperties({
    required String id,
    required String name,

    /// Fuel types sold (or ever reported) at this station with current availability
    required List<FuelStationFuel> fuels,

    /// At least one fuel type currently reported missing
    required bool shortage,
    required List<FuelType> missingFuelTypes,
    required int confirmationCount,
    required FuelStationFeaturePropertiesKind kind,
    String? brand,
    String? address,
    DateTime? lastConfirmedAt,

    /// Only in GET /fuel-stations?lat&lng and the offline bundle
    int? distanceMeters,
  }) = _FuelStationFeatureProperties;
  
  factory FuelStationFeatureProperties.fromJson(Map<String, Object?> json) => _$FuelStationFeaturePropertiesFromJson(json);
}
