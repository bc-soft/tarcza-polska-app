// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_feature_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertFeatureProperties _$AlertFeaturePropertiesFromJson(
  Map<String, dynamic> json,
) => _AlertFeatureProperties(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  severity: AlertSeverity.fromJson(json['severity'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  active: json['active'] as bool,
  kind: AlertFeaturePropertiesKind.fromJson(json['kind'] as String),
  incidentId: json['incidentId'] as String?,
);

Map<String, dynamic> _$AlertFeaturePropertiesToJson(
  _AlertFeatureProperties instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'severity': _$AlertSeverityEnumMap[instance.severity]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
  'active': instance.active,
  'kind': _$AlertFeaturePropertiesKindEnumMap[instance.kind]!,
  'incidentId': instance.incidentId,
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.info: 'info',
  AlertSeverity.warning: 'warning',
  AlertSeverity.danger: 'danger',
  AlertSeverity.$unknown: r'$unknown',
};

const _$AlertFeaturePropertiesKindEnumMap = {
  AlertFeaturePropertiesKind.alert: 'alert',
  AlertFeaturePropertiesKind.$unknown: r'$unknown',
};
