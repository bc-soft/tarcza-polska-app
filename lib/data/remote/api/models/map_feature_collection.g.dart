// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_feature_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MapFeatureCollection _$MapFeatureCollectionFromJson(
  Map<String, dynamic> json,
) => _MapFeatureCollection(
  type: MapFeatureCollectionType.fromJson(json['type'] as String),
  features: (json['features'] as List<dynamic>)
      .map((e) => MapFeature.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MapFeatureCollectionToJson(
  _MapFeatureCollection instance,
) => <String, dynamic>{
  'type': _$MapFeatureCollectionTypeEnumMap[instance.type]!,
  'features': instance.features,
};

const _$MapFeatureCollectionTypeEnumMap = {
  MapFeatureCollectionType.featureCollection: 'FeatureCollection',
  MapFeatureCollectionType.$unknown: r'$unknown',
};
