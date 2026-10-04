// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_timeline_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncidentTimelineEntry _$IncidentTimelineEntryFromJson(
  Map<String, dynamic> json,
) => _IncidentTimelineEntry(
  type: IncidentTimelineEntryType.fromJson(json['type'] as String),
  label: json['label'] as String,
  at: DateTime.parse(json['at'] as String),
  details: json['details'] as Map<String, dynamic>,
);

Map<String, dynamic> _$IncidentTimelineEntryToJson(
  _IncidentTimelineEntry instance,
) => <String, dynamic>{
  'type': _$IncidentTimelineEntryTypeEnumMap[instance.type]!,
  'label': instance.label,
  'at': instance.at.toIso8601String(),
  'details': instance.details,
};

const _$IncidentTimelineEntryTypeEnumMap = {
  IncidentTimelineEntryType.created: 'created',
  IncidentTimelineEntryType.waveStarted: 'wave_started',
  IncidentTimelineEntryType.waveClosed: 'wave_closed',
  IncidentTimelineEntryType.areaChanged: 'area_changed',
  IncidentTimelineEntryType.confidenceChanged: 'confidence_changed',
  IncidentTimelineEntryType.researchCompleted: 'research_completed',
  IncidentTimelineEntryType.sourceAdded: 'source_added',
  IncidentTimelineEntryType.alertPublished: 'alert_published',
  IncidentTimelineEntryType.photoAttached: 'photo_attached',
  IncidentTimelineEntryType.resolved: 'resolved',
  IncidentTimelineEntryType.$unknown: r'$unknown',
};
