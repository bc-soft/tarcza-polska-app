import "dart:math" as math;

import "package:latlong2/latlong.dart";

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

  static double distanceMeters(LatLng a, LatLng b) => const Distance().as(LengthUnit.Meter, a, b);
}
