import "package:flutter/material.dart";
import "package:flutter_map/flutter_map.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";

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
