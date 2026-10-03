import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Domyślny środek mapy, gdy nie znamy pozycji (Poznań).
const LatLng defaultMapCenter = LatLng(52.4064, 16.9252);

/// Kafelki OpenStreetMap (bez klucza API). `userAgentPackageName` wymagany przez politykę OSM.
TileLayer osmTileLayer() => TileLayer(
  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
  userAgentPackageName: "pl.tarcza.citizen",
  maxZoom: 19,
);

/// Atrybucja wymagana przez licencję OSM.
class OsmAttribution extends StatelessWidget {
  const OsmAttribution({super.key});

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      color: Colors.white.withValues(alpha: 0.8),
      child: const Text("© OpenStreetMap", style: TextStyle(fontSize: 10)),
    ),
  );
}

/// Pinezka (adres domowy / miejsce zgłoszenia).
class PinMarker extends StatelessWidget {
  const PinMarker({super.key, this.color = TarczaPalette.accentRed, this.icon = Icons.place});

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Icon(
    icon,
    color: color,
    size: 44,
    shadows: const [Shadow(blurRadius: 6, color: Colors.black26)],
  );
}

/// Kółko z ikoną — znacznik domu, użytkownika, schronu.
class IconCircleMarker extends StatelessWidget {
  const IconCircleMarker({
    super.key,
    required this.icon,
    required this.color,
    this.size = 34,
    this.border = Colors.white,
  });

  final IconData icon;
  final Color color;
  final double size;
  final Color border;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: border, width: 2.5),
      boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black26, offset: Offset(0, 2))],
    ),
    child: Icon(icon, size: size * 0.55, color: Colors.white),
  );
}

/// Znacznik domu — granatowa pinezka (inna niż okrągłe schrony / incydenty i czerwona
/// pinezka miejsca zgłoszenia).
class HomeMarker extends StatelessWidget {
  const HomeMarker({super.key, this.size = 46});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Icon(
          Icons.location_on,
          size: size,
          color: TarczaPalette.primaryDark,
          shadows: const [Shadow(blurRadius: 6, color: Colors.black38, offset: Offset(0, 2))],
        ),
        Positioned(
          top: size * 0.14,
          child: Container(
            width: size * 0.44,
            height: size * 0.44,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Icon(Icons.home_rounded, size: size * 0.32, color: TarczaPalette.primaryDark),
          ),
        ),
      ],
    ),
  );
}

/// Marker domu zakotwiczony czubkiem pinezki w punkcie.
Marker homeMarker(LatLng position, {double size = 46}) => Marker(
  point: position,
  width: size,
  height: size,
  alignment: Alignment.topCenter,
  child: HomeMarker(size: size),
);

/// Kolor grupy schronów: najlepszy status w grupie (otwarty > pełny > brak danych > zamknięty).
Color shelterGroupColor(BuildContext context, List<Shelter> group) {
  const order = [
    ShelterStatus.open,
    ShelterStatus.full,
    ShelterStatus.unknown,
    ShelterStatus.closed,
  ];
  final best = order.firstWhere(
    (s) => group.any((g) => g.status == s),
    orElse: () => ShelterStatus.unknown,
  );
  return context.statusColors.forShelter(best);
}

/// Grupa markerów w jednym miejscu: zwykła ikona obiektu z odznaką „+N” (N = pozostałe
/// obiekty w grupie) w prawym górnym rogu.
class ClusterMarker extends StatelessWidget {
  const ClusterMarker({
    super.key,
    required this.count,
    required this.color,
    required this.icon,
    this.size = 32,
  });

  final int count;
  final Color color;
  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    final more = count - 1;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        IconCircleMarker(icon: icon, color: color, size: size),
        Positioned(
          top: -2,
          right: -2,
          child: Container(
            constraints: const BoxConstraints(minWidth: 22),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: TarczaPalette.primaryDark,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: Text(
              more > 999 ? "+999" : "+$more",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 11,
                height: 1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Warstwa markerów z grupowaniem: punkty bliżej niż [radius] px (na całkowitym poziomie
/// zoomu) łączą się w jeden [ClusterMarker]. Mniej widgetów = płynniejsza mapa; tapnięcie
/// grupy przybliża do jej punktów.
class ClusteredMarkerLayer<T> extends StatelessWidget {
  const ClusteredMarkerLayer({
    super.key,
    required this.items,
    required this.pointOf,
    required this.markerBuilder,
    required this.clusterColor,
    required this.clusterIcon,
    this.markerSize = 30,
    this.radius = 80,
    this.disableAtZoom = 17,
  });

  final List<T> items;
  final LatLng Function(T item) pointOf;
  final Widget Function(BuildContext context, T item) markerBuilder;
  final Color Function(List<T> group) clusterColor;
  final IconData clusterIcon;
  final double markerSize;
  final double radius;
  final double disableAtZoom;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);
    final zoom = camera.zoom.floorToDouble();
    final groups = <(int, int), List<T>>{};
    if (zoom >= disableAtZoom) {
      for (final (i, item) in items.indexed) {
        groups[(i, -1)] = [item];
      }
    } else {
      for (final item in items) {
        final p = camera.projectAtZoom(pointOf(item), zoom);
        groups.putIfAbsent((p.dx ~/ radius, p.dy ~/ radius), () => []).add(item);
      }
    }
    return MarkerLayer(
      markers: [
        for (final group in groups.values)
          if (group.length == 1)
            Marker(
              point: pointOf(group.first),
              width: markerSize,
              height: markerSize,
              child: markerBuilder(context, group.first),
            )
          else
            Marker(
              point: _center(group.map(pointOf).toList()),
              // Zapas na odznakę „+N” wystającą poza ikonę.
              width: markerSize + 30,
              height: markerSize + 30,
              child: GestureDetector(
                onTap: () => MapController.of(context).fitCamera(
                  CameraFit.coordinates(
                    coordinates: group.map(pointOf).toList(),
                    padding: const EdgeInsets.all(80),
                    maxZoom: disableAtZoom,
                  ),
                ),
                child: ClusterMarker(
                  count: group.length,
                  color: clusterColor(group),
                  icon: clusterIcon,
                  size: markerSize + 2,
                ),
              ),
            ),
      ],
    );
  }

  static LatLng _center(List<LatLng> points) => LatLng(
    points.map((p) => p.latitude).reduce((a, b) => a + b) / points.length,
    points.map((p) => p.longitude).reduce((a, b) => a + b) / points.length,
  );
}

/// Znacznik „jesteś tutaj”: niebieska kropka z obwódką i poświatą.
class UserLocationDot extends StatelessWidget {
  const UserLocationDot({super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: TarczaPalette.info.withValues(alpha: 0.18),
    ),
    alignment: Alignment.center,
    child: Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: TarczaPalette.info,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
      ),
    ),
  );
}

Marker userLocationMarker(LatLng position) =>
    Marker(point: position, width: 44, height: 44, child: const UserLocationDot());

/// Mapa do wskazania punktu — dotknięcie przenosi pinezkę.
class LocationPickerMap extends StatefulWidget {
  const LocationPickerMap({
    super.key,
    required this.position,
    required this.onChanged,
    this.fallbackCenter = defaultMapCenter,
    this.zoom = 16,
    this.extraMarkers = const [],
  });

  final LatLng? position;
  final ValueChanged<LatLng> onChanged;
  final LatLng fallbackCenter;
  final double zoom;
  final List<Marker> extraMarkers;

  @override
  State<LocationPickerMap> createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  final _controller = MapController();
  bool _ready = false;

  @override
  void didUpdateWidget(LocationPickerMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    final p = widget.position;
    // Pozycja zmieniona z zewnątrz (geokodowanie, „moja pozycja”) — centrujemy mapę.
    if (_ready && p != null && p != oldWidget.position) {
      final center = _controller.camera.center;
      if (const Distance().as(LengthUnit.Meter, center, p) > 30) {
        // Pierwsze ustalenie punktu (np. po geokodowaniu) — przybliżamy na ulicę.
        final zoom = oldWidget.position == null ? 16.0 : _controller.camera.zoom;
        _controller.move(p, zoom);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.position;
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: FlutterMap(
        mapController: _controller,
        options: MapOptions(
          initialCenter: p ?? widget.fallbackCenter,
          initialZoom: widget.zoom,
          onMapReady: () => _ready = true,
          onTap: (_, latLng) => widget.onChanged(latLng),
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          osmTileLayer(),
          MarkerLayer(
            markers: [
              ...widget.extraMarkers,
              if (p != null)
                Marker(
                  point: p,
                  width: 44,
                  height: 44,
                  alignment: Alignment.topCenter,
                  child: const PinMarker(),
                ),
            ],
          ),
          const OsmAttribution(),
        ],
      ),
    );
  }
}
