// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'report_incident_ref.dart';
import 'report_type.dart';

part 'report_status_view.freezed.dart';
part 'report_status_view.g.dart';

@Freezed()
abstract class ReportStatusView with _$ReportStatusView {
  const factory ReportStatusView({
    required String reportId,
    required ReportType type,
    required String typeLabel,
    required DateTime createdAt,

    /// null until clustering (asynchronous, usually within seconds) attached the report to an incident
    required ReportIncidentRef? incident,
  }) = _ReportStatusView;
  
  factory ReportStatusView.fromJson(Map<String, Object?> json) => _$ReportStatusViewFromJson(json);
}
