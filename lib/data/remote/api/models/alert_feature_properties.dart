// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert_feature_properties_kind.dart';
import 'alert_severity.dart';

part 'alert_feature_properties.freezed.dart';
part 'alert_feature_properties.g.dart';

@Freezed()
abstract class AlertFeatureProperties with _$AlertFeatureProperties {
  const factory AlertFeatureProperties({
    required String id,
    required String title,
    required String body,
    required AlertSeverity severity,
    required DateTime createdAt,
    required DateTime expiresAt,
    required bool active,
    required AlertFeaturePropertiesKind kind,
    String? incidentId,
  }) = _AlertFeatureProperties;
  
  factory AlertFeatureProperties.fromJson(Map<String, Object?> json) => _$AlertFeaturePropertiesFromJson(json);
}
