import "package:flutter/foundation.dart";
import "package:h3_flutter/h3_flutter.dart" as h3;
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/config/app_config.dart";

/// Komórki H3 (res 9, ~175 m) — wyłącznie do throttlingu wysyłki lokalizacji
/// i prezentacji „Twojej okolicy”. Żadnej logiki biznesowej (zasięg, confidence).
class H3Service {
  H3Service();

  h3.H3? _h3;
  bool _loadFailed = false;

  h3.H3? get _lib {
    if (_h3 != null || _loadFailed) return _h3;
    try {
      _h3 = const h3.H3Factory().load();
    } on Object catch (e) {
      // Np. testy na hoście bez biblioteki natywnej — przechodzimy na siatkę zapasową.
      debugPrint("H3 niedostępne: $e");
      _loadFailed = true;
    }
    return _h3;
  }

  /// Indeks komórki jako hex (np. `891e24aa5c7ffff`).
  String cellFor(LatLng position, {int resolution = AppConfig.h3Resolution}) {
    final lib = _lib;
    if (lib == null) return _fallbackCell(position);
    final cell = lib.geoToCell(
      h3.GeoCoord(lat: position.latitude, lon: position.longitude),
      resolution,
    );
    return cell.toRadixString(16);
  }

  /// Wierzchołki heksagonu komórki (puste, gdy H3 niedostępne).
  List<LatLng> boundary(String cellHex) {
    final lib = _lib;
    final index = BigInt.tryParse(cellHex, radix: 16);
    if (lib == null || index == null) return const [];
    return lib.cellToBoundary(index).map((c) => LatLng(c.lat, c.lon)).toList();
  }

  /// Siatka ~150 m jako zapas, gdy biblioteka natywna nie jest dostępna.
  static String _fallbackCell(LatLng p) =>
      "grid:${(p.latitude / 0.00135).floor()}:${(p.longitude / 0.0022).floor()}";
}
