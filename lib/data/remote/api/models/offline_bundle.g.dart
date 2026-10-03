// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_bundle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfflineBundle _$OfflineBundleFromJson(Map<String, dynamic> json) =>
    _OfflineBundle(
      generatedAt: DateTime.parse(json['generatedAt'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      center: GeoJsonGeometry.fromJson(json['center'] as Map<String, dynamic>),
      radiusMeters: (json['radiusMeters'] as num).toInt(),
      shelters: (json['shelters'] as List<dynamic>)
          .map((e) => ShelterView.fromJson(e as Map<String, dynamic>))
          .toList(),
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => AlertView.fromJson(e as Map<String, dynamic>))
          .toList(),
      incidents: (json['incidents'] as List<dynamic>)
          .map((e) => IncidentView.fromJson(e as Map<String, dynamic>))
          .toList(),
      procedures: (json['procedures'] as List<dynamic>)
          .map((e) => Procedure.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OfflineBundleToJson(_OfflineBundle instance) =>
    <String, dynamic>{
      'generatedAt': instance.generatedAt.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'center': instance.center,
      'radiusMeters': instance.radiusMeters,
      'shelters': instance.shelters,
      'alerts': instance.alerts,
      'incidents': instance.incidents,
      'procedures': instance.procedures,
    };
