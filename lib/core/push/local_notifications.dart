import "dart:async";
import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/push/push_event.dart";

/// Cienka warstwa nad `flutter_local_notifications`: zgoda na powiadomienia
/// i wyświetlanie notyfikacji (np. symulowanych pushy w trybie mock).
class LocalNotifications {
  LocalNotifications([FlutterLocalNotificationsPlugin? plugin])
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  final _taps = StreamController<PushEvent>.broadcast();
  bool _initialized = false;

  static const _channel = AndroidNotificationDetails(
    "tarcza_alerts",
    "Alerty i pytania",
    channelDescription: "Pytania weryfikacyjne i alerty dla Twojej okolicy",
    importance: Importance.high,
    priority: Priority.high,
    // Sylwetka logo — Android wygasza kolorowe ikony do białej plamy.
    icon: "ic_notification",
    color: TarczaPalette.primary,
  );

  /// Tapnięcia w notyfikację (payload = `data` pusha).
  Stream<PushEvent> get taps => _taps.stream;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    try {
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings("ic_notification"),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
        onDidReceiveNotificationResponse: (response) {
          final event = _decode(response.payload, opened: true);
          if (event != null) _taps.add(event);
        },
      );
    } on Object catch (e) {
      debugPrint("Lokalne powiadomienia niedostępne: $e");
    }
  }

  /// Zdarzenie, którym uruchomiono aplikację (tap w notyfikację przy zamkniętej aplikacji).
  Future<PushEvent?> launchEvent() async {
    try {
      final details = await _plugin.getNotificationAppLaunchDetails();
      if (details?.didNotificationLaunchApp ?? false) {
        return _decode(details?.notificationResponse?.payload, opened: true);
      }
    } on Object {
      // Brak wsparcia platformy.
    }
    return null;
  }

  Future<bool> requestPermission() async {
    await init();
    try {
      final ios = _plugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>();
      if (ios != null) {
        return await ios.requestPermissions(alert: true, badge: true, sound: true) ?? false;
      }
      final android = _plugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
      if (android != null) return await android.requestNotificationsPermission() ?? false;
    } on Object catch (e) {
      debugPrint("Zgoda na powiadomienia: $e");
    }
    return false;
  }

  Future<void> show({required String title, required String body, PushEvent? event}) async {
    await init();
    try {
      await _plugin.show(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000 % 100000,
        title: title,
        body: body,
        notificationDetails: const NotificationDetails(
          android: _channel,
          iOS: DarwinNotificationDetails(presentBanner: true, presentSound: true),
        ),
        payload: event == null ? null : jsonEncode(event.toData()),
      );
    } on Object catch (e) {
      debugPrint("Nie udało się pokazać notyfikacji: $e");
    }
  }

  static PushEvent? _decode(String? payload, {bool opened = false}) {
    if (payload == null) return null;
    try {
      final data = jsonDecode(payload);
      return data is Map<String, dynamic> ? PushEvent.fromData(data, opened: opened) : null;
    } on FormatException {
      return null;
    }
  }

  Future<void> dispose() => _taps.close();
}
