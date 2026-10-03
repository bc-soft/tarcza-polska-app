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

/// FCM (Android) / APNs przez FCM (iOS). Konfiguracja: `ios/Runner/GoogleService-Info.plist`,
/// `android/app/google-services.json`. Gdy Firebase nie wstanie (brak pliku), działa jak
/// [NoopPushService] — aplikacja zostaje na pollingu.
class FirebasePushService implements PushService {
  FirebasePushService(this._local);

  final LocalNotifications _local;
  final _events = StreamController<PushEvent>.broadcast();
  final _subscriptions = <StreamSubscription<Object?>>[];
  bool _available = false;

  FirebaseMessaging get _fcm => FirebaseMessaging.instance;

  @override
  Future<void> init() async {
    await _local.init();
    _subscriptions.add(_local.taps.listen(_events.add));
    try {
      await Firebase.initializeApp();
    } on Object catch (e) {
      debugPrint("Firebase niedostępny — zostaje polling: $e");
      return;
    }
    _available = true;
    FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
    // Na pierwszym planie system też pokazuje baner; aplikacja dodatkowo od razu otwiera ekran.
    await _fcm.setForegroundNotificationPresentationOptions(alert: true, sound: true);
    _subscriptions
      ..add(FirebaseMessaging.onMessage.listen(_handle))
      ..add(FirebaseMessaging.onMessageOpenedApp.listen((m) => _handle(m, opened: true)));
  }

  void _handle(RemoteMessage message, {bool opened = false}) {
    final event = PushEvent.fromData(message.data, opened: opened);
    if (event != null) _events.add(event);
  }

  @override
  Future<bool> requestPermission() async {
    if (!_available) return await _local.requestPermission();
    final settings = await _fcm.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  @override
  Future<String?> getToken() async {
    if (!_available) return null;
    try {
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        // Token APNs przychodzi asynchronicznie po `registerForRemoteNotifications` —
        // bez niego FCM nie wyda tokena. Czekamy chwilę zamiast od razu zwracać `null`.
        for (var i = 0; i < 20 && await _fcm.getAPNSToken() == null; i++) {
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }
        if (await _fcm.getAPNSToken() == null) {
          // Najczęściej: brak zespołu Apple Developer w podpisie (DEVELOPMENT_TEAM) albo
          // brak capability Push Notifications — wtedy zostaje polling.
          debugPrint("Brak tokena APNs — push niedostępny, działa polling.");
          return null;
        }
      }
      return await _fcm.getToken();
    } on Object catch (e) {
      debugPrint("Brak tokena FCM: $e");
      return null;
    }
  }

  @override
  Stream<String> get onTokenRefresh => _available ? _fcm.onTokenRefresh : const Stream.empty();

  @override
  Stream<PushEvent> get events => _events.stream;

  @override
  Future<PushEvent?> initialEvent() async {
    if (_available) {
      final message = await _fcm.getInitialMessage();
      final event = message == null ? null : PushEvent.fromData(message.data, opened: true);
      if (event != null) return event;
    }
    return await _local.launchEvent();
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
