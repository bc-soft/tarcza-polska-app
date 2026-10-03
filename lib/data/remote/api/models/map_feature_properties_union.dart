// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert_feature_properties.dart';
import 'alert_feature_properties_kind.dart';
import 'alert_severity.dart';
import 'community.dart';
import 'confidence_level.dart';
import 'fuel_station_feature_properties.dart';
import 'fuel_station_feature_properties_kind.dart';
import 'fuel_station_fuel.dart';
import 'fuel_type.dart';
import 'incident_feature_properties.dart';
import 'incident_feature_properties_kind.dart';
import 'incident_status.dart';
import 'poi_ref.dart';
import 'report_scope.dart';
import 'report_type.dart';
import 'shelter_availability.dart';
import 'shelter_feature_properties.dart';
import 'shelter_feature_properties_kind.dart';
import 'shelter_occupancy.dart';
import 'shelter_status.dart';

part 'map_feature_properties_union.freezed.dart';
part 'map_feature_properties_union.g.dart';

@Freezed(unionKey: 'kind', fallbackUnion: 'unknown')
sealed class MapFeaturePropertiesUnion with _$MapFeaturePropertiesUnion {
  @FreezedUnionValue('incident')
  const factory MapFeaturePropertiesUnion.incident({
    required String id,
    required ReportType type,
    required String typeLabel,
    required IncidentStatus status,
    required String statusLabel,
    required ConfidenceLevel confidenceLevel,
    required String confidenceLabel,
    required double confidenceScore,
    required DateTime startedAt,
    required DateTime lastActivityAt,
    required Community community,
    required ReportScope scope,

    /// scope=point: the station / shelter this incident is about
    required PoiRef? poi,

    /// Fuel types reported missing (fuel_shortage)
    required List<FuelType> fuelTypes,
    required IncidentFeaturePropertiesKind kind,
    DateTime? lastConfirmedAt,

    /// AI research summary, when available
    String? summary,
  }) = MapFeaturePropertiesUnionIncident;

  @FreezedUnionValue('shelter')
  const factory MapFeaturePropertiesUnion.shelter({
    required String id,
    required String name,
    required ShelterStatus status,
    required String statusLabel,
    required ShelterOccupancy occupancy,
    required String occupancyLabel,
    required int confirmationCount,
    required ShelterFeaturePropertiesKind kind,
    String? address,
    int? capacity,
    ShelterAvailability? availability,
    String? availabilityLabel,
    DateTime? lastConfirmedAt,

    /// Only in GET /shelters?lat&lng
    int? distanceMeters,
  }) = MapFeaturePropertiesUnionShelter;

  @FreezedUnionValue('fuel_station')
  const factory MapFeaturePropertiesUnion.fuelStation({
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
  }) = MapFeaturePropertiesUnionFuelStation;

  @FreezedUnionValue('alert')
  const factory MapFeaturePropertiesUnion.alert({
    required String id,
    required String title,
    required String body,
    required AlertSeverity severity,
    required DateTime createdAt,
    required DateTime expiresAt,
    required bool active,
    required AlertFeaturePropertiesKind kind,
    String? incidentId,
  }) = MapFeaturePropertiesUnionAlert;

  const factory MapFeaturePropertiesUnion.unknown() = MapFeaturePropertiesUnionUnknown;

  
  factory MapFeaturePropertiesUnion.fromJson(Map<String, Object?> json) => _$MapFeaturePropertiesUnionFromJson(json);
}
