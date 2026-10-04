import "dart:math" as math;

import "package:freezed_annotation/freezed_annotation.dart";
import "package:latlong2/latlong.dart";

part "geo.freezed.dart";

/// Zasięg incydentu / alertu: GeoJSON `Point` (zasięg niewyznaczony)
/// albo `Polygon` / `MultiPolygon`.
@freezed
sealed class GeoArea with _$GeoArea {
  const GeoArea._();

  const factory GeoArea.point(LatLng point) = GeoPointArea;

  const factory GeoArea.polygons(List<GeoPolygon> polygons) = GeoPolygonArea;

  /// Środek obszaru (średnia wierzchołków zewnętrznych) — do centrowania mapy.
  LatLng get center => switch (this) {
    GeoPointArea(:final point) => point,
    GeoPolygonArea(:final polygons) => _centroid(polygons.expand((p) => p.outer).toList()),
  };

  /// Wszystkie punkty obrysu — do dopasowania kamery.
  List<LatLng> get outlinePoints => switch (this) {
    GeoPointArea(:final point) => [point],
    GeoPolygonArea(:final polygons) => polygons.expand((p) => p.outer).toList(),
  };

  static LatLng _centroid(List<LatLng> points) {
    if (points.isEmpty) return const LatLng(0, 0);
    final lat = points.map((p) => p.latitude).reduce((a, b) => a + b) / points.length;
    final lng = points.map((p) => p.longitude).reduce((a, b) => a + b) / points.length;
    return LatLng(lat, lng);
  }
}

/// Pojedynczy poligon: obrys zewnętrzny + opcjonalne dziury.
@freezed
abstract class GeoPolygon with _$GeoPolygon {
  const factory GeoPolygon({
    required List<LatLng> outer,
    @Default(<List<LatLng>>[]) List<List<LatLng>> holes,
  }) = _GeoPolygon;
}

/// Okno mapy w formacie `minLng,minLat,maxLng,maxLat` (query `bbox`).
@freezed
abstract class BBox with _$BBox {
  const factory BBox({
    required double minLng,
    required double minLat,
    required double maxLng,
    required double maxLat,
  }) = _BBox;

  const BBox._();

  factory BBox.around(LatLng center, {double radiusKm = 5}) {
    final dLat = radiusKm / 111.32;
    final dLng = radiusKm / (111.32 * math.cos(center.latitudeInRad)).abs().clamp(0.01, 111.32);
    return BBox(
      minLng: center.longitude - dLng,
      minLat: center.latitude - dLat,
      maxLng: center.longitude + dLng,
      maxLat: center.latitude + dLat,
    );
  }

  String toQuery() => [minLng, minLat, maxLng, maxLat].map((v) => v.toStringAsFixed(5)).join(",");

  bool contains(LatLng p) =>
      p.latitude >= minLat &&
      p.latitude <= maxLat &&
      p.longitude >= minLng &&
      p.longitude <= maxLng;

  bool intersects(List<LatLng> points) {
    if (points.isEmpty) return false;
    final lats = points.map((p) => p.latitude);
    final lngs = points.map((p) => p.longitude);
    return lats.reduce(math.min) <= maxLat &&
        lats.reduce(math.max) >= minLat &&
        lngs.reduce(math.min) <= maxLng &&
        lngs.reduce(math.max) >= minLng;
  }
}
