import "dart:async";
import "dart:io";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:geolocator/geolocator.dart";
import "package:latlong2/latlong.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/core/location/h3_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/models/enums.dart";
import "package:tarcza_polska/data/remote/interceptors/static_headers_interceptor.dart";
import "package:workmanager/workmanager.dart";

/// Aktualizacja pozycji z trybu czuwania, gdy aplikacja żyje (do UI i wysyłki w trybie mock).
class BackgroundLocationUpdate {
  const BackgroundLocationUpdate({required this.position, required this.sentNatively});

  final LatLng position;

  /// `true`, gdy pozycję wysłała już ścieżka natywna (iOS, tryb remote).
  final bool sentNatively;
}

/// Tryb czuwania (opt-in, zgoda „zawsze”): niska dokładność, wysyłka tylko po
/// zmianie komórki H3, bez historii (`docs/08`).
abstract interface class BackgroundLocationService {
  /// Drugi krok zgody — lokalizacja „zawsze”. Zwraca, czy została udzielona.
  Future<bool> requestAlwaysPermission();

  /// Uruchamia śledzenie. Zakłada, że zgoda „zawsze” jest już udzielona.
  Future<bool> start();

  Future<void> stop();

  Stream<BackgroundLocationUpdate> get updates;
}

BackgroundLocationService createBackgroundLocationService(TokenStorage tokens) {
  if (Platform.isIOS) return IosSignificantChangeService(tokens);
  if (Platform.isAndroid) return AndroidForegroundService();
  return const UnsupportedBackgroundLocationService();
}

class UnsupportedBackgroundLocationService implements BackgroundLocationService {
  const UnsupportedBackgroundLocationService();

  @override
  Future<bool> requestAlwaysPermission() async => false;

  @override
  Future<bool> start() async => false;

  @override
  Future<void> stop() async {}

  @override
  Stream<BackgroundLocationUpdate> get updates => const Stream.empty();
}

/// iOS — `CLLocationManager.startMonitoringSignificantLocationChanges` w Swift
/// (`ios/Runner/BackgroundLocationManager.swift`). Działa także po zamknięciu
/// aplikacji: system ją wybudza, a wysyłka idzie natywnie przez `URLSession`.
class IosSignificantChangeService implements BackgroundLocationService {
  IosSignificantChangeService(this._tokens) {
    _channel.setMethodCallHandler(_onNativeCall);
  }

  static const _channel = MethodChannel("pl.tarcza.citizen/background_location");

  final TokenStorage _tokens;
  final _updates = StreamController<BackgroundLocationUpdate>.broadcast();

  @override
  Stream<BackgroundLocationUpdate> get updates => _updates.stream;

  @override
  Future<bool> requestAlwaysPermission() async {
    try {
      return await _channel.invokeMethod<bool>("requestAlways") ?? false;
    } on PlatformException catch (e) {
      debugPrint("Zgoda „zawsze” (iOS): $e");
      return false;
    }
  }

  @override
  Future<bool> start() async {
    try {
      // W trybie mock nie ma serwera — natywnie tylko monitorujemy, wysyła Dart.
      final token = AppConfig.useMocks ? null : await _tokens.readToken();
      return await _channel.invokeMethod<bool>("start", {
            "baseUrl": AppConfig.useMocks ? null : AppConfig.apiBaseUrl,
            "token": token,
            "headers": StaticHeadersInterceptor.defaultHeaders,
          }) ??
          false;
    } on PlatformException catch (e) {
      debugPrint("Tryb czuwania (iOS): $e");
      return false;
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _channel.invokeMethod<void>("stop");
    } on PlatformException catch (e) {
      debugPrint("Tryb czuwania (iOS) stop: $e");
    }
  }

  Future<void> _onNativeCall(MethodCall call) async {
    if (call.method != "onLocation") return;
    final args = Map<String, Object?>.from(call.arguments as Map);
    _updates.add(
      BackgroundLocationUpdate(
        position: LatLng((args["lat"]! as num).toDouble(), (args["lng"]! as num).toDouble()),
        sentNatively: args["sent"] == true,
      ),
    );
  }
}

/// Android — foreground service `geolocator` (stała notyfikacja) + `workmanager`
/// co 15 min jako zapas po ubiciu procesu.
class AndroidForegroundService implements BackgroundLocationService {
  static const taskName = "pl.tarcza.citizen.location";

  final _updates = StreamController<BackgroundLocationUpdate>.broadcast();
  StreamSubscription<Position>? _subscription;

  @override
  Stream<BackgroundLocationUpdate> get updates => _updates.stream;

  /// Android 11+: `ACCESS_BACKGROUND_LOCATION` to osobne zapytanie po zgodzie „podczas używania”.
  @override
  Future<bool> requestAlwaysPermission() async {
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.whileInUse) {
        permission = await Geolocator.requestPermission();
      }
      return permission == LocationPermission.always;
    } on Object catch (e) {
      debugPrint("Zgoda „zawsze” (Android): $e");
      return false;
    }
  }

  @override
  Future<bool> start() async {
    await _subscription?.cancel();
    _subscription =
        Geolocator.getPositionStream(
          locationSettings: AndroidSettings(
            accuracy: LocationAccuracy.low,
            distanceFilter: 150,
            intervalDuration: const Duration(minutes: 2),
            foregroundNotificationConfig: const ForegroundNotificationConfig(
              notificationTitle: "Tarcza czuwa w Twojej okolicy",
              notificationText:
                  "Pytania i alerty trafią tam, gdzie jesteś. Bez historii lokalizacji.",
              notificationChannelName: "Tryb czuwania",
              setOngoing: true,
            ),
          ),
        ).listen(
          (p) => _updates.add(
            BackgroundLocationUpdate(
              position: LatLng(p.latitude, p.longitude),
              sentNatively: false,
            ),
          ),
          onError: (Object e) => debugPrint("Tryb czuwania (Android): $e"),
        );

    try {
      await Workmanager().initialize(backgroundLocationDispatcher);
      await Workmanager().registerPeriodicTask(
        taskName,
        taskName,
        frequency: const Duration(minutes: 15),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
        constraints: Constraints(networkType: NetworkType.connected),
        inputData: {"baseUrl": AppConfig.apiBaseUrl, "useMocks": AppConfig.useMocks},
      );
    } on Object catch (e) {
      debugPrint("workmanager: $e");
    }
    return true;
  }

  @override
  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
    try {
      await Workmanager().cancelByUniqueName(taskName);
    } on Object catch (e) {
      debugPrint("workmanager stop: $e");
    }
  }
}

/// Punkt wejścia `workmanager` (osobny izolat, bez UI i bez `get_it`):
/// token → pozycja → komórka H3 → `PUT /devices/me/location`, jeśli komórka się zmieniła.
@pragma("vm:entry-point")
void backgroundLocationDispatcher() {
  Workmanager().executeTask((task, input) async {
    if (input?["useMocks"] == true) return true;
    try {
      final token = await TokenStorage().readToken();
      if (token == null) return true;
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 20),
        ),
      );
      final cell = H3Service().cellFor(LatLng(position.latitude, position.longitude));
      final prefs = AppPreferences(await SharedPreferences.getInstance());
      if (prefs.lastSentCell == cell) return true;

      final dio = Dio(BaseOptions(baseUrl: input?["baseUrl"] as String? ?? AppConfig.apiBaseUrl))
        ..interceptors.add(StaticHeadersInterceptor());
      await dio.put<void>(
        "/api/v1/devices/me/location",
        data: {"lat": position.latitude, "lng": position.longitude},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      await prefs.saveLastSent(cell: cell, at: DateTime.now(), source: LocationSource.background);
      return true;
    } on Object catch (e) {
      debugPrint("Tło: nie wysłano pozycji: $e");
      return false;
    }
  });
}
