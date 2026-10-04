// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'geo_json_geometry.dart';
import 'poi_kind.dart';

part 'poi_ref.freezed.dart';
part 'poi_ref.g.dart';

/// The object a point-scoped report / incident / question is about.
@Freezed()
abstract class PoiRef with _$PoiRef {
  const factory PoiRef({
    required PoiKind kind,
    required String id,
    required String name,
    GeoJsonGeometry? location,
  }) = _PoiRef;
  
  factory PoiRef.fromJson(Map<String, Object?> json) => _$PoiRefFromJson(json);
}
