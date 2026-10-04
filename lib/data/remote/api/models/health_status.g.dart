// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HealthStatus _$HealthStatusFromJson(Map<String, dynamic> json) =>
    _HealthStatus(
      status: HealthStatusStatus.fromJson(json['status'] as String),
      time: DateTime.parse(json['time'] as String),
      postgis: json['postgis'] as String?,
      h3: json['h3'] as String?,
      h3Postgis: json['h3Postgis'] as String?,
    );

Map<String, dynamic> _$HealthStatusToJson(_HealthStatus instance) =>
    <String, dynamic>{
      'status': _$HealthStatusStatusEnumMap[instance.status]!,
      'time': instance.time.toIso8601String(),
      'postgis': instance.postgis,
      'h3': instance.h3,
      'h3Postgis': instance.h3Postgis,
    };

const _$HealthStatusStatusEnumMap = {
  HealthStatusStatus.ok: 'ok',
  HealthStatusStatus.degraded: 'degraded',
  HealthStatusStatus.$unknown: r'$unknown',
};
