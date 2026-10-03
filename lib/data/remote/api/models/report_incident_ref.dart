// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'confidence_level.dart';
import 'incident_status.dart';
import 'report_type.dart';

part 'report_incident_ref.freezed.dart';
part 'report_incident_ref.g.dart';

@Freezed()
abstract class ReportIncidentRef with _$ReportIncidentRef {
  const factory ReportIncidentRef({
    required String id,
    required ReportType type,
    required String typeLabel,
    required IncidentStatus status,
    required String statusLabel,
    required ConfidenceLevel confidenceLevel,
    required String confidenceLabel,
    required double confidenceScore,
  }) = _ReportIncidentRef;
  
  factory ReportIncidentRef.fromJson(Map<String, Object?> json) => _$ReportIncidentRefFromJson(json);
}
