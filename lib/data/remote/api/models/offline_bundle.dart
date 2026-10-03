// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert_view.dart';
import 'geo_json_geometry.dart';
import 'incident_view.dart';
import 'procedure.dart';
import 'shelter_view.dart';

part 'offline_bundle.freezed.dart';
part 'offline_bundle.g.dart';

/// Snapshot to cache for degraded / offline mode around one position.
@Freezed()
abstract class OfflineBundle with _$OfflineBundle {
  const factory OfflineBundle({
    required DateTime generatedAt,

    /// Refresh after this time (24 h) or on foreground
    required DateTime validUntil,
    required GeoJsonGeometry center,
    required int radiusMeters,

    /// Nearest first, with distanceMeters
    required List<ShelterView> shelters,
    required List<AlertView> alerts,
    required List<IncidentView> incidents,
    required List<Procedure> procedures,
  }) = _OfflineBundle;
  
  factory OfflineBundle.fromJson(Map<String, Object?> json) => _$OfflineBundleFromJson(json);
}
