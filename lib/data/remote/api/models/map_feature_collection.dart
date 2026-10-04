// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'map_feature.dart';
import 'map_feature_collection_type.dart';

part 'map_feature_collection.freezed.dart';
part 'map_feature_collection.g.dart';

@Freezed()
abstract class MapFeatureCollection with _$MapFeatureCollection {
  const factory MapFeatureCollection({
    required MapFeatureCollectionType type,
    required List<MapFeature> features,
  }) = _MapFeatureCollection;
  
  factory MapFeatureCollection.fromJson(Map<String, Object?> json) => _$MapFeatureCollectionFromJson(json);
}
