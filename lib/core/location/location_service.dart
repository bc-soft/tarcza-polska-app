import "package:flutter/foundation.dart";
import "package:geocoding/geocoding.dart";
import "package:geolocator/geolocator.dart";
import "package:latlong2/latlong.dart";

/// Stan zgody na lokalizację z perspektywy aplikacji.
enum LocationAccess { denied, whileInUse, always }

/// Wynik geokodowania adresu domowego.
class GeocodedAddress {
  const GeocodedAddress({required this.label, required this.location});

  final String label;
  final LatLng location;
}

/// Opakowanie `geolocator` + `geocoding` — tylko jednorazowe odczyty.
/// Śledzenie w tle jest w `BackgroundLocationService`.
class LocationService {
  LocationService([Geocoding? geocoding]) : _geocoding = geocoding;

  Geocoding? _geocoding;

  Geocoding get _geocoder => _geocoding ??= Geocoding();

  Future<LocationAccess> access() async {
    try {
      return _map(await Geolocator.checkPermission());
    } on Object {
      return LocationAccess.denied;
    }
  }

  /// Systemowe zapytanie o zgodę „podczas używania”.
  Future<LocationAccess> requestWhileInUse() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      return _map(permission);
    } on Object catch (e) {
      debugPrint("Zgoda na lokalizację: $e");
      return LocationAccess.denied;
    }
  }

  /// Jednorazowa pozycja o niskiej dokładności (wystarcza dla H3 res 9).
  /// `null`, gdy brak zgody, wyłączone usługi lokalizacji albo timeout.
  Future<Position?> currentPosition() async {
    try {
      if (await access() == LocationAccess.denied) return null;
      if (!await Geolocator.isLocationServiceEnabled()) return null;
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } on Object catch (e) {
      debugPrint("Brak pozycji GPS: $e");
      return null;
    }
  }

  /// Pozycja na żywo do znacznika „jesteś tutaj” — tylko gdy aplikacja jest na pierwszym
  /// planie (bez aktualizacji w tle). Nie trafia do backendu; wysyłka idzie przez
  /// `LocationRepository` z throttlingiem H3.
  Stream<LatLng> watchPosition() {
    final LocationSettings settings = switch (defaultTargetPlatform) {
      TargetPlatform.iOS => AppleSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 15,
        allowBackgroundLocationUpdates: false,
        pauseLocationUpdatesAutomatically: true,
      ),
      TargetPlatform.android => AndroidSettings(
        accuracy: LocationAccuracy.medium,
        distanceFilter: 15,
      ),
      _ => const LocationSettings(accuracy: LocationAccuracy.medium, distanceFilter: 15),
    };
    return Geolocator.getPositionStream(
      locationSettings: settings,
    ).map((p) => LatLng(p.latitude, p.longitude));
  }

  /// Adres → współrzędne (geokodowanie systemowe).
  /// **[DO UZGODNIENIA]**: czy backend udostępni własny endpoint geokodowania.
  Future<List<GeocodedAddress>> geocode(String query) async {
    final locations = await _geocoder.locationFromAddress(query);
    return locations
        .map(
          (l) => GeocodedAddress(label: query.trim(), location: LatLng(l.latitude, l.longitude)),
        )
        .toList();
  }

  /// Współrzędne → czytelny adres (po przesunięciu pinezki).
  Future<String?> reverseGeocode(LatLng position) async {
    try {
      final placemarks = await _geocoder.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final p = placemarks.firstOrNull;
      if (p == null) return null;
      final parts = [p.street, p.locality].whereType<String>().where((s) => s.isNotEmpty);
      return parts.isEmpty ? null : parts.join(", ");
    } on Object {
      return null;
    }
  }

  Future<bool> openSettings() => Geolocator.openAppSettings();

  static LocationAccess _map(LocationPermission p) => switch (p) {
    LocationPermission.always => LocationAccess.always,
    LocationPermission.whileInUse => LocationAccess.whileInUse,
    _ => LocationAccess.denied,
  };
}
