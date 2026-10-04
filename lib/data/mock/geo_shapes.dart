import "dart:math" as math;

import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/location/h3_service.dart";
import "package:tarcza_polska/data/models/geo.dart";

/// Generatory kształtów dla danych mockowych (nie są używane przez widok remote).
abstract final class GeoShapes {
  static const _metersPerDegLat = 111320.0;

  static LatLng offset(LatLng origin, {double northMeters = 0, double eastMeters = 0}) {
    final dLat = northMeters / _metersPerDegLat;
    final dLng = eastMeters / (_metersPerDegLat * math.cos(origin.latitudeInRad));
    return LatLng(origin.latitude + dLat, origin.longitude + dLng);
  }

  /// Nieregularny poligon wokół [center]. [radial] skaluje promień dla kolejnych
  /// kierunków (0° = wschód, przeciwnie do ruchu wskazówek), interpolowany liniowo.
  static GeoArea blob(
    LatLng center, {
    required double radiusMeters,
    List<double> radial = const [1],
    int vertices = 28,
  }) {
    final points = <LatLng>[];
    for (var i = 0; i < vertices; i++) {
      final t = i / vertices;
      final angle = t * 2 * math.pi;
      final pos = t * radial.length;
      final a = radial[pos.floor() % radial.length];
      final b = radial[(pos.floor() + 1) % radial.length];
      final factor = a + (b - a) * (pos - pos.floor());
      final r = radiusMeters * factor;
      points.add(
        offset(center, northMeters: r * math.sin(angle), eastMeters: r * math.cos(angle)),
      );
    }
    points.add(points.first);
    return GeoArea.polygons([GeoPolygon(outer: points)]);
  }

  static final _h3 = H3Service();

  /// Zasięg jak z backendu: komórki H3 res 9 (heksagony ~175 m) w promieniu
  /// [radiusMeters] skalowanym przez [radial] (jak w [blob]). Każda komórka jest osobnym
  /// poligonem `MultiPolygon`. Bez biblioteki H3 (np. testy na hoście) — [blob].
  static GeoArea hexArea(
    LatLng center, {
    required double radiusMeters,
    List<double> radial = const [1],
  }) {
    final origin = _h3.cellFor(center);
    // Odległość między środkami sąsiednich komórek res 9 to ~300 m.
    final k = (radiusMeters * radial.reduce(math.max) / 300).ceil() + 1;
    final polygons = <GeoPolygon>[];
    for (final cell in _h3.disk(origin, k)) {
      final c = _h3.cellCenter(cell);
      if (c == null) continue;
      final north = (c.latitude - center.latitude) * _metersPerDegLat;
      final east =
          (c.longitude - center.longitude) * _metersPerDegLat * math.cos(center.latitudeInRad);
      final angle = math.atan2(north, east);
      final limit =
          radiusMeters *
          _radialFactor(radial, (angle < 0 ? angle + 2 * math.pi : angle) / (2 * math.pi));
      if (math.sqrt(north * north + east * east) > limit) continue;
      final ring = _h3.boundary(cell);
      if (ring.length < 3) continue;
      polygons.add(GeoPolygon(outer: [...ring, ring.first]));
    }
    if (polygons.isEmpty) return blob(center, radiusMeters: radiusMeters, radial: radial);
    return GeoArea.polygons(polygons);
  }

  static double _radialFactor(List<double> radial, double t) {
    final pos = t * radial.length;
    final a = radial[pos.floor() % radial.length];
    final b = radial[(pos.floor() + 1) % radial.length];
    return a + (b - a) * (pos - pos.floor());
  }

  static double distanceMeters(LatLng a, LatLng b) => const Distance().as(LengthUnit.Meter, a, b);
}
