import "package:latlong2/latlong.dart";
import "package:shared_preferences/shared_preferences.dart";

import "package:tarcza_polska/data/models/models.dart";

/// Ustawienia lokalne (`shared_preferences`): flagi onboardingu, adres domowy,
/// ostatnio wysłana komórka H3. Nie trzymamy tu historii lokalizacji.
class AppPreferences {
  AppPreferences(this._prefs);

  final SharedPreferences _prefs;

  static const _onboardingDone = "onboarding_done";
  static const _homeLabel = "home_label";
  static const _homeLat = "home_lat";
  static const _homeLng = "home_lng";
  static const _lastSentCell = "last_sent_cell";
  static const _lastSentAt = "last_sent_at";
  static const _lastSource = "last_source";
  static const _backgroundEnabled = "background_enabled";
  static const _notificationsAsked = "notifications_asked";
  static const _locationRefreshEnabled = "location_refresh_enabled";

  bool get onboardingDone => _prefs.getBool(_onboardingDone) ?? false;

  Future<void> setOnboardingDone({required bool value}) => _prefs.setBool(_onboardingDone, value);

  HomeAddress? get homeAddress {
    final label = _prefs.getString(_homeLabel);
    final lat = _prefs.getDouble(_homeLat);
    final lng = _prefs.getDouble(_homeLng);
    if (label == null || lat == null || lng == null) return null;
    return HomeAddress(label: label, location: LatLng(lat, lng));
  }

  Future<void> setHomeAddress(HomeAddress address) async {
    await _prefs.setString(_homeLabel, address.label);
    await _prefs.setDouble(_homeLat, address.location.latitude);
    await _prefs.setDouble(_homeLng, address.location.longitude);
  }

  String? get lastSentCell => _prefs.getString(_lastSentCell);

  DateTime? get lastSentAt {
    final raw = _prefs.getString(_lastSentAt);
    return raw == null ? null : DateTime.tryParse(raw);
  }

  LocationSource? get lastSource {
    final raw = _prefs.getString(_lastSource);
    return LocationSource.values.where((s) => s.name == raw).firstOrNull;
  }

  Future<void> saveLastSent({
    required String? cell,
    required DateTime at,
    required LocationSource source,
  }) async {
    if (cell != null) await _prefs.setString(_lastSentCell, cell);
    await _prefs.setString(_lastSentAt, at.toIso8601String());
    await _prefs.setString(_lastSource, source.name);
  }

  bool get backgroundEnabled => _prefs.getBool(_backgroundEnabled) ?? false;

  Future<void> setBackgroundEnabled({required bool value}) =>
      _prefs.setBool(_backgroundEnabled, value);

  bool get notificationsAsked => _prefs.getBool(_notificationsAsked) ?? false;

  Future<void> setNotificationsAsked() => _prefs.setBool(_notificationsAsked, true);

  /// Czy użytkownik chce przypomnień `location_refresh` (ustawienia).
  bool get locationRefreshEnabled => _prefs.getBool(_locationRefreshEnabled) ?? true;

  Future<void> setLocationRefreshEnabled({required bool value}) =>
      _prefs.setBool(_locationRefreshEnabled, value);

  /// Reset aplikacji (ustawienia dev) — wraca do onboardingu.
  Future<void> clear() => _prefs.clear();
}
