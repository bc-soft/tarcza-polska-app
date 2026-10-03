import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/location/h3_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

/// Wynik próby wysłania pozycji.
class LocationSendResult {
  const LocationSendResult({required this.sent, this.cell, this.sentAt});

  /// `false`, gdy pominięto wysyłkę (ta sama komórka H3, throttling).
  final bool sent;
  final String? cell;
  final DateTime? sentAt;
}

/// Wysyłka pozycji urządzenia do backendu z throttlingiem po komórce H3
/// i adres domowy. Mock/remote przełączany przez [DeviceRepository].
class LocationRepository {
  LocationRepository(this._device, this._prefs, this._h3, {DateTime Function()? clock})
    : _clock = clock ?? DateTime.now;

  final DeviceRepository _device;
  final AppPreferences _prefs;
  final H3Service _h3;
  final DateTime Function() _clock;

  /// Backend przyjmuje 30 aktualizacji / min — trzymamy duży zapas.
  static const minInterval = Duration(seconds: 15);

  /// Nawet w tej samej komórce odświeżamy `locationUpdatedAt` co jakiś czas,
  /// żeby backend nie uznał pozycji za przestarzałą (`location_refresh`).
  static const refreshInterval = Duration(hours: 6);

  HomeAddress? get homeAddress => _prefs.homeAddress;

  String? get lastSentCell => _prefs.lastSentCell;

  DateTime? get lastSentAt => _prefs.lastSentAt;

  LocationSource? get lastSource => _prefs.lastSource;

  Future<void> saveHomeAddress(HomeAddress address) => _prefs.setHomeAddress(address);

  /// Wysyła [position], jeśli zmieniła się komórka H3 (lub [force]).
  Future<LocationSendResult> send(
    LatLng position, {
    required LocationSource source,
    double? accuracyMeters,
    bool force = false,
  }) async {
    final now = _clock();
    final cell = _h3.cellFor(position);
    final lastAt = _prefs.lastSentAt;
    final sinceLast = lastAt == null ? null : now.difference(lastAt);

    if (!force && sinceLast != null) {
      final sameCell = cell == _prefs.lastSentCell && _prefs.lastSource == source;
      if (sinceLast < minInterval || (sameCell && sinceLast < refreshInterval)) {
        return LocationSendResult(sent: false, cell: _prefs.lastSentCell, sentAt: lastAt);
      }
    }

    final backendCell = await _device.updateLocation(position, accuracyMeters: accuracyMeters);
    await _prefs.saveLastSent(cell: cell, at: now, source: source);
    return LocationSendResult(sent: true, cell: backendCell ?? cell, sentAt: now);
  }

  /// Heksagon „Twojej okolicy” do prezentacji w ustawieniach.
  List<LatLng> neighbourhoodBoundary(LatLng position) => _h3.boundary(_h3.cellFor(position));
}
