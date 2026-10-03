// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeometryDto _$GeometryDtoFromJson(Map<String, dynamic> json) =>
    GeometryDto(type: json['type'] as String, coordinates: json['coordinates']);

FeatureDto _$FeatureDtoFromJson(Map<String, dynamic> json) => FeatureDto(
  id: json['id'] as String?,
  geometry: json['geometry'] == null
      ? null
      : GeometryDto.fromJson(json['geometry'] as Map<String, dynamic>),
  properties: json['properties'] as Map<String, dynamic>? ?? const {},
);

FeatureCollectionDto _$FeatureCollectionDtoFromJson(
  Map<String, dynamic> json,
) => FeatureCollectionDto(
  features:
      (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);
