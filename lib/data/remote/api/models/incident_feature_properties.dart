// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'community.dart';
import 'confidence_level.dart';
import 'fuel_type.dart';
import 'incident_feature_properties_kind.dart';
import 'incident_status.dart';
import 'poi_ref.dart';
import 'report_scope.dart';
import 'report_type.dart';

part 'incident_feature_properties.freezed.dart';
part 'incident_feature_properties.g.dart';

@Freezed()
abstract class IncidentFeatureProperties with _$IncidentFeatureProperties {
  const factory IncidentFeatureProperties({
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
  }) = _IncidentFeatureProperties;
  
  factory IncidentFeatureProperties.fromJson(Map<String, Object?> json) => _$IncidentFeaturePropertiesFromJson(json);
}
