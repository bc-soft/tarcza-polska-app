// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_json_geometry.dart';
import 'map_feature_properties_union.dart';
import 'map_feature_type.dart';

part 'map_feature.freezed.dart';
part 'map_feature.g.dart';

@Freezed()
abstract class MapFeature with _$MapFeature {
  const factory MapFeature({
    required MapFeatureType type,

    /// Same value as properties.id
    required String id,

    /// incident (scope=area): polygon, centroid Point while the area is empty; incident (scope=point): Point at the object; shelter / fuel_station: Point; alert: polygon
    required GeoJsonGeometry geometry,
    required MapFeaturePropertiesUnion properties,
  }) = _MapFeature;
  
  factory MapFeature.fromJson(Map<String, Object?> json) => _$MapFeatureFromJson(json);
}
