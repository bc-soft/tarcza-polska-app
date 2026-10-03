// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum IncidentTimelineEntryType {
  @JsonValue('created')
  created('created'),
  @JsonValue('wave_started')
  waveStarted('wave_started'),
  @JsonValue('wave_closed')
  waveClosed('wave_closed'),
  @JsonValue('area_changed')
  areaChanged('area_changed'),
  @JsonValue('confidence_changed')
  confidenceChanged('confidence_changed'),
  @JsonValue('research_completed')
  researchCompleted('research_completed'),
  @JsonValue('source_added')
  sourceAdded('source_added'),
  @JsonValue('alert_published')
  alertPublished('alert_published'),
  @JsonValue('photo_attached')
  photoAttached('photo_attached'),
  @JsonValue('resolved')
  resolved('resolved'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const IncidentTimelineEntryType(this.json);

  factory IncidentTimelineEntryType.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<IncidentTimelineEntryType> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
