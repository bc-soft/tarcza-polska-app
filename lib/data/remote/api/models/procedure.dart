// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'report_type.dart';

part 'procedure.freezed.dart';
part 'procedure.g.dart';

/// Offline-safe safety checklist (Polish).
@Freezed()
abstract class Procedure with _$Procedure {
  const factory Procedure({
    required String id,
    required String title,
    required String summary,
    required List<String> steps,

    /// Empty = general procedure
    required List<ReportType> appliesTo,

    /// Higher first
    required int priority,
  }) = _Procedure;
  
  factory Procedure.fromJson(Map<String, Object?> json) => _$ProcedureFromJson(json);
}
