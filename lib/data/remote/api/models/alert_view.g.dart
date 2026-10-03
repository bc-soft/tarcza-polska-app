// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertView _$AlertViewFromJson(Map<String, dynamic> json) => _AlertView(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  severity: AlertSeverity.fromJson(json['severity'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  active: json['active'] as bool,
  area: GeoJsonGeometry.fromJson(json['area'] as Map<String, dynamic>),
  incidentId: json['incidentId'] as String?,
);

Map<String, dynamic> _$AlertViewToJson(_AlertView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'severity': _$AlertSeverityEnumMap[instance.severity]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'active': instance.active,
      'area': instance.area,
      'incidentId': instance.incidentId,
    };

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.danger: 'danger',
  AlertSeverity.$unknown: r'$unknown',
};
