// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapFeature _$MapFeatureFromJson(Map<String, dynamic> json) => _MapFeature(
  type: MapFeatureType.fromJson(json['type'] as String),
  id: json['id'] as String,
  geometry: GeoJsonGeometry.fromJson(json['geometry'] as Map<String, dynamic>),
  properties: MapFeaturePropertiesUnion.fromJson(
    json['properties'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$MapFeatureToJson(_MapFeature instance) =>
    <String, dynamic>{
      'type': _$MapFeatureTypeEnumMap[instance.type]!,
      'id': instance.id,
      'geometry': instance.geometry,
      'properties': instance.properties,
    };

const _$MapFeatureTypeEnumMap = {
  MapFeatureType.feature: 'Feature',
  MapFeatureType.$unknown: r'$unknown',
};
