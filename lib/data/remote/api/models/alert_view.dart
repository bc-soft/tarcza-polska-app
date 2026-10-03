// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert_severity.dart';
import 'geo_json_geometry.dart';

part 'alert_view.freezed.dart';
part 'alert_view.g.dart';

@Freezed()
abstract class AlertView with _$AlertView {
  const factory AlertView({
    required String id,
    required String title,
    required String body,
    required AlertSeverity severity,
    required DateTime createdAt,
    required DateTime expiresAt,
    required bool active,

    /// Only in GET /alerts/{id}
    required GeoJsonGeometry area,
    String? incidentId,
  }) = _AlertView;
  
  factory AlertView.fromJson(Map<String, Object?> json) => _$AlertViewFromJson(json);
}
