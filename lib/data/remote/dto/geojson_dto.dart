import "package:json_annotation/json_annotation.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/geo.dart";

part "geojson_dto.g.dart";

/// GeoJSON `geometry`. Współrzędne w kolejności `[lng, lat]`.
@JsonSerializable(createToJson: false)
class GeometryDto {
  const GeometryDto({required this.type, this.coordinates});

  factory GeometryDto.fromJson(Map<String, dynamic> json) => _$GeometryDtoFromJson(json);

  final String type;
  final Object? coordinates;

  /// `null` dla nieobsługiwanych typów geometrii.
  GeoArea? toDomain() {
    final c = coordinates;
    if (c is! List) return null;
    return switch (type) {
      "Point" => GeoArea.point(_latLng(c)),
      "Polygon" => GeoArea.polygons([_polygon(c)]),
      "MultiPolygon" => GeoArea.polygons(c.whereType<List<dynamic>>().map(_polygon).toList()),
      _ => null,
    };
  }

  LatLng? toPoint() => switch (toDomain()) {
    GeoPointArea(:final point) => point,
    _ => null,
  };

  static LatLng _latLng(List<dynamic> c) =>
      LatLng((c[1] as num).toDouble(), (c[0] as num).toDouble());

  static List<LatLng> _ring(List<dynamic> ring) =>
      ring.whereType<List<dynamic>>().map(_latLng).toList();

  static GeoPolygon _polygon(List<dynamic> rings) {
    final parsed = rings.whereType<List<dynamic>>().map(_ring).toList();
    return GeoPolygon(
      outer: parsed.isEmpty ? const [] : parsed.first,
      holes: parsed.length > 1 ? parsed.sublist(1) : const [],
    );
  }
}

@JsonSerializable(createToJson: false)
class FeatureDto {
  const FeatureDto({this.id, this.geometry, this.properties = const {}});

  factory FeatureDto.fromJson(Map<String, dynamic> json) => _$FeatureDtoFromJson(json);

  final String? id;
  final GeometryDto? geometry;
  final Map<String, dynamic> properties;
}

@JsonSerializable(createToJson: false)
class FeatureCollectionDto {
  const FeatureCollectionDto({this.features = const []});

  factory FeatureCollectionDto.fromJson(Map<String, dynamic> json) =>
      _$FeatureCollectionDtoFromJson(json);

  final List<FeatureDto> features;
}
