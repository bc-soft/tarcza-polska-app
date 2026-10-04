// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_json_geometry_type.dart';

part 'geo_json_geometry.freezed.dart';
part 'geo_json_geometry.g.dart';

/// GeoJSON geometry in WGS84, coordinates ordered [lng, lat].
@Freezed()
abstract class GeoJsonGeometry with _$GeoJsonGeometry {
  const factory GeoJsonGeometry({
    required GeoJsonGeometryType type,

    /// Point: [lng, lat]; Polygon: [[[lng, lat], ...]]; MultiPolygon: [[[[lng, lat], ...]]]
    required List<dynamic> coordinates,
  }) = _GeoJsonGeometry;
  
  factory GeoJsonGeometry.fromJson(Map<String, Object?> json) => _$GeoJsonGeometryFromJson(json);
}
