// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'incident_timeline_entry_type.dart';

part 'incident_timeline_entry.freezed.dart';
part 'incident_timeline_entry.g.dart';

/// One entry of the public incident history. `details` holds small, type-specific facts (counts, levels), never positions.
@Freezed()
abstract class IncidentTimelineEntry with _$IncidentTimelineEntry {
  const factory IncidentTimelineEntry({
    required IncidentTimelineEntryType type,

    /// Polish, ready to display
    required String label,
    required DateTime at,

    /// e.g. {reports} for created, {ring, cells, devices} for wave_started, {positiveCells, negativeCells, unknownCells, yes, no} for area_changed, {from, to, score} for confidence_changed
    required Map<String, dynamic> details,
  }) = _IncidentTimelineEntry;
  
  factory IncidentTimelineEntry.fromJson(Map<String, Object?> json) => _$IncidentTimelineEntryFromJson(json);
}
