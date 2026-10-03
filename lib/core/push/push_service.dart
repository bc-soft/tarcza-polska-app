import "dart:async";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";

import "package:tarcza_polska/core/push/local_notifications.dart";
import "package:tarcza_polska/core/push/push_event.dart";

/// Źródło pushy dla BLoC-ów. Implementacje: [FirebasePushService] (FCM / APNs),
/// [MockPushService] (scenariusz demo), [NoopPushService] (sam polling).
abstract interface class PushService {
  Future<void> init();

  /// Prosi o zgodę na powiadomienia. Zwraca, czy zgoda jest udzielona.
  Future<bool> requestPermission();

  /// Token FCM (`null` bez Firebase).
  Future<String?> getToken();

  Stream<String> get onTokenRefresh;

  /// Pushe na pierwszym planie i tapnięcia w notyfikację.
  Stream<PushEvent> get events;

  /// Push, którym uruchomiono aplikację (`getInitialMessage`).
  Future<PushEvent?> initialEvent();
}

/// Lekki handler w tle — bez UI i bez grafu zależności (docs/05).
@pragma("vm:entry-point")
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  // Celowo pusto: pytanie/alert i tak pobieramy przez polling po otwarciu.
}

class FirebasePushService implements PushService {
  FirebasePushService(this._local);

  final LocalNotifications _local;
  final _events = StreamController<PushEvent>.broadcast();
  final _subscriptions = <StreamSubscription<Object?>>[];

  FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  @override
  Future<void> init() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
    await _fcm.setForegroundNotificationPresentationOptions(alert: true, sound: true);
    _subscriptions
      ..add(FirebaseMessaging.onMessage.listen(_handle))
      ..add(FirebaseMessaging.onMessageOpenedApp.listen(_handle))
      ..add(_local.taps.listen(_events.add));
  }

  void _handle(RemoteMessage message) {
    final event = PushEvent.fromData(message.data);
    if (event != null) _events.add(event);
  }

  @override
  Future<bool> requestPermission() async {
    final settings = await _fcm.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  @override
  Future<String?> getToken() async {
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS && await _fcm.getAPNSToken() == null) {
        return null; // Symulator / brak APNs — token FCM nie powstanie.
      }
      return await _fcm.getToken();
    } on Object catch (e) {
      debugPrint("Brak tokena FCM: $e");
      return null;
    }
  }

  @override
  Stream<String> get onTokenRefresh => _fcm.onTokenRefresh;

  @override
  Stream<PushEvent> get events => _events.stream;

  @override
  Future<PushEvent?> initialEvent() async {
    final message = await _fcm.getInitialMessage();
    return message == null ? null : PushEvent.fromData(message.data);
  }
}

/// Bez Firebase: tylko zgoda na powiadomienia systemowe; dane z pollingu.
class NoopPushService implements PushService {
  NoopPushService(this._local);

  final LocalNotifications _local;

  @override
  Future<void> init() => _local.init();

  @override
  Future<bool> requestPermission() => _local.requestPermission();

  @override
  Future<String?> getToken() async => null;

  @override
  Stream<String> get onTokenRefresh => const Stream.empty();

  @override
  Stream<PushEvent> get events => _local.taps;

  @override
  Future<PushEvent?> initialEvent() => _local.launchEvent();
}

/// Tryb mock: scenariusz demo „wysyła” pushe przez [simulate] — pokazujemy
/// lokalną notyfikację i od razu emitujemy zdarzenie (jak `onMessage`).
class MockPushService implements PushService {
  MockPushService(this._local);

  final LocalNotifications _local;
  final _events = StreamController<PushEvent>.broadcast();
  StreamSubscription<PushEvent>? _tapSubscription;

  @override
  Future<void> init() async {
    await _local.init();
    _tapSubscription ??= _local.taps.listen(_events.add);
  }

  @override
  Future<bool> requestPermission() => _local.requestPermission();

  @override
  Future<String?> getToken() async => "mock-push-token";

  @override
  Stream<String> get onTokenRefresh => const Stream.empty();

  @override
  Stream<PushEvent> get events => _events.stream;

  @override
  Future<PushEvent?> initialEvent() => _local.launchEvent();

  Future<void> simulate(PushEvent event, {required String title, required String body}) async {
    await _local.show(title: title, body: body, event: event);
    _events.add(event);
  }

  Future<void> dispose() async {
    await _tapSubscription?.cancel();
    await _events.close();
  }
}
