// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_json_geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoJsonGeometry _$GeoJsonGeometryFromJson(Map<String, dynamic> json) =>
    _GeoJsonGeometry(
      type: GeoJsonGeometryType.fromJson(json['type'] as String),
      coordinates: json['coordinates'] as List<dynamic>,
    );

Map<String, dynamic> _$GeoJsonGeometryToJson(_GeoJsonGeometry instance) =>
    <String, dynamic>{
      'type': _$GeoJsonGeometryTypeEnumMap[instance.type]!,
      'coordinates': instance.coordinates,
    };

const _$GeoJsonGeometryTypeEnumMap = {
  GeoJsonGeometryType.point: 'Point',
  GeoJsonGeometryType.polygon: 'Polygon',
  GeoJsonGeometryType.multiPolygon: 'MultiPolygon',
  GeoJsonGeometryType.$unknown: r'$unknown',
};
