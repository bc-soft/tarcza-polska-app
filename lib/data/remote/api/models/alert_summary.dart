// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'alert_severity.dart';

part 'alert_summary.freezed.dart';
part 'alert_summary.g.dart';

@Freezed()
abstract class AlertSummary with _$AlertSummary {
  const factory AlertSummary({
    required String id,
    required String title,
    required String body,
    required AlertSeverity severity,
    required DateTime createdAt,
    required DateTime expiresAt,
    required bool active,
    String? incidentId,
  }) = _AlertSummary;
  
  factory AlertSummary.fromJson(Map<String, Object?> json) => _$AlertSummaryFromJson(json);
}
