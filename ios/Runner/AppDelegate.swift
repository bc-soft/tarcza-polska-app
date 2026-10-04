import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Wybudzenie przez Significant Location Change (także po zamknięciu aplikacji)
    // wymaga ponownego uruchomienia monitorowania już przy starcie.
    BackgroundLocationManager.shared.resumeIfEnabled()
    // Powiadomienia na pierwszym planie (flutter_local_notifications / FCM).
    UNUserNotificationCenter.current().delegate = self
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "TarczaBackgroundLocation") {
      BackgroundLocationManager.shared.register(with: registrar.messenger())
    }
  }
}
