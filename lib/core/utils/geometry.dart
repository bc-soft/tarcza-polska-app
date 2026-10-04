import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/geo.dart";

/// Scalanie sąsiadujących poligonów w jeden obszar.
///
/// Backend zwraca zasięg incydentu jako `MultiPolygon` — jedna komórka H3 = jeden poligon.
/// Narysowane wprost dają siatkę plastrów miodu z widocznymi granicami wewnętrznymi; na mapie
/// ma to być **jeden** obszar problemu. Granica wspólna dwóch sąsiadów występuje w danych
/// dokładnie dwa razy, więc wystarczy odrzucić krawędzie powtórzone i połączyć resztę
/// w pierścienie (klasyczne „dissolve” po krawędziach — bez pełnej algebry poligonów).
///
/// Gdy wierzchołki sąsiadów nie trafiają w siebie (inna precyzja z backendu), nic się nie
/// skraca i funkcja zwraca wejście bez zmian — rysujemy wtedy jak dotąd, osobne komórki.
List<GeoPolygon> dissolvePolygons(List<GeoPolygon> polygons) {
  if (polygons.length < 2) return polygons;
  return _cache[polygons] ??= _dissolve(polygons);
}

/// Wynik zależy tylko od danych wejściowych, a te są niezmienne (freezed) i trzymane przez
/// stan BLoC-a — liczymy raz na listę, nie przy każdym odrysowaniu mapy.
final _cache = Expando<List<GeoPolygon>>("dissolvePolygons");

List<GeoPolygon> _dissolve(List<GeoPolygon> polygons) {
  final rings = [
    for (final polygon in polygons) ...[polygon.outer, ...polygon.holes],
  ];

  // Krawędzie nieparzyste = brzeg obszaru. Klucz nieskierowany, żeby złapać sąsiadów
  // obrysowanych w przeciwnych kierunkach.
  final count = <String, int>{};
  final edges = <String, (_Vertex, _Vertex)>{};
  for (final ring in rings) {
    final points = _open(ring);
    if (points.length < 3) continue;
    for (var i = 0; i < points.length; i++) {
      final a = _Vertex(points[i]);
      final b = _Vertex(points[(i + 1) % points.length]);
      if (a.key == b.key) continue;
      final key = a.key.compareTo(b.key) <= 0 ? "${a.key}|${b.key}" : "${b.key}|${a.key}";
      count[key] = (count[key] ?? 0) + 1;
      edges[key] = (a, b);
    }
  }

  final boundary = [
    for (final entry in count.entries)
      if (entry.value == 1) edges[entry.key]!,
  ];
  if (boundary.isEmpty) return polygons;

  final merged = _chain(boundary);
  // Nic się nie skleiło — zwracamy wejście, żeby nie gubić dziur z oryginału.
  if (merged.length >= rings.length) return polygons;
  return _nest(merged);
}

/// Łączy krawędzie brzegowe w zamknięte pierścienie. Idziemy po sąsiadach, nigdy nie
/// zawracając do wierzchołka, z którego przyszliśmy.
List<List<LatLng>> _chain(List<(_Vertex, _Vertex)> boundary) {
  final neighbours = <String, List<_Vertex>>{};
  for (final (a, b) in boundary) {
    neighbours.putIfAbsent(a.key, () => []).add(b);
    neighbours.putIfAbsent(b.key, () => []).add(a);
  }

  final used = <String>{};
  String edgeKey(String a, String b) => a.compareTo(b) <= 0 ? "$a|$b" : "$b|$a";

  final rings = <List<LatLng>>[];
  for (final (start, _) in boundary) {
    if (neighbours[start.key] == null) continue;
    var current = start;
    String? previous;
    final ring = <LatLng>[];
    while (true) {
      final next = neighbours[current.key]?.where((v) {
        return v.key != previous && !used.contains(edgeKey(current.key, v.key));
      }).firstOrNull;
      if (next == null) break;
      used.add(edgeKey(current.key, next.key));
      ring.add(current.point);
      previous = current.key;
      current = next;
      if (current.key == start.key) break;
    }
    if (ring.length >= 3) rings.add(ring);
  }
  return rings;
}

/// Rozdziela pierścienie na obrysy i dziury: pierścień zamknięty w nieparzystej liczbie
/// innych jest dziurą i trafia do najmniejszego pierścienia, który go obejmuje.
List<GeoPolygon> _nest(List<List<LatLng>> rings) {
  final areas = [for (final ring in rings) _area(ring)];
  final holes = <int, List<List<LatLng>>>{};
  final outers = <int>[];

  for (var i = 0; i < rings.length; i++) {
    var container = -1;
    var depth = 0;
    for (var j = 0; j < rings.length; j++) {
      if (i == j || !_contains(rings[j], rings[i].first)) continue;
      depth++;
      if (container < 0 || areas[j] < areas[container]) container = j;
    }
    if (depth.isOdd && container >= 0) {
      holes.putIfAbsent(container, () => []).add(rings[i]);
    } else {
      outers.add(i);
    }
  }

  return [
    for (final i in outers) GeoPolygon(outer: rings[i], holes: holes[i] ?? const []),
  ];
}

/// Pierścień bez powtórzonego punktu domykającego (GeoJSON zamyka obrys).
List<LatLng> _open(List<LatLng> ring) {
  if (ring.length > 1 && _Vertex(ring.first).key == _Vertex(ring.last).key) {
    return ring.sublist(0, ring.length - 1);
  }
  return ring;
}

double _area(List<LatLng> ring) {
  var sum = 0.0;
  for (var i = 0; i < ring.length; i++) {
    final a = ring[i];
    final b = ring[(i + 1) % ring.length];
    sum += a.longitude * b.latitude - b.longitude * a.latitude;
  }
  return sum.abs() / 2;
}

bool _contains(List<LatLng> ring, LatLng point) {
  var inside = false;
  for (var i = 0, j = ring.length - 1; i < ring.length; j = i++) {
    final a = ring[i];
    final b = ring[j];
    if ((a.latitude > point.latitude) != (b.latitude > point.latitude) &&
        point.longitude <
            (b.longitude - a.longitude) *
                    (point.latitude - a.latitude) /
                    (b.latitude - a.latitude) +
                a.longitude) {
      inside = !inside;
    }
  }
  return inside;
}

/// Wierzchołek z kluczem przyciętym do ~10 cm — tyle wystarczy, żeby wspólne wierzchołki
/// sąsiednich komórek H3 trafiły w siebie mimo różnic na ostatnich bitach.
class _Vertex {
  _Vertex(this.point)
    : key = "${point.latitude.toStringAsFixed(6)},${point.longitude.toStringAsFixed(6)}";

  final LatLng point;
  final String key;
}
