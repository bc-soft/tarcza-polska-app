import CoreLocation
import Flutter
import Security
import UIKit

/// Tryb czuwania na iOS: Significant Location Change (~500 m, minimalne zużycie baterii).
/// Działa także po zamknięciu aplikacji — system wybudza ją na ~10 s, więc wysyłka
/// pozycji idzie natywnie (`URLSession`), bez silnika Fluttera i bez historii lokalizacji.
final class BackgroundLocationManager: NSObject, CLLocationManagerDelegate {
  static let shared = BackgroundLocationManager()

  private static let channelName = "pl.tarcza.citizen/background_location"
  private static let enabledKey = "tarcza.background.enabled"
  private static let baseUrlKey = "tarcza.background.baseUrl"
  private static let headersKey = "tarcza.background.headers"
  private static let lastLatKey = "tarcza.background.lastLat"
  private static let lastLngKey = "tarcza.background.lastLng"
  private static let keychainService = "pl.tarcza.citizen.background"
  private static let keychainAccount = "device_token"

  /// Wysyłamy tylko po przesunięciu o rozmiar komórki H3 res 9 (~175 m).
  private static let minDistanceMeters: CLLocationDistance = 150

  private let manager = CLLocationManager()
  private var channel: FlutterMethodChannel?
  private var pendingPermission: FlutterResult?
  private var activeObserver: NSObjectProtocol?
  private let defaults = UserDefaults.standard

  private override init() {
    super.init()
    manager.delegate = self
    manager.desiredAccuracy = kCLLocationAccuracyKilometer
    manager.pausesLocationUpdatesAutomatically = true
  }

  /// Wywoływane przy starcie aplikacji (także wybudzeniu w tle przez system).
  func resumeIfEnabled() {
    guard defaults.bool(forKey: Self.enabledKey) else { return }
    manager.startMonitoringSignificantLocationChanges()
  }

  func register(with messenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(name: Self.channelName, binaryMessenger: messenger)
    channel.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result: result)
    }
    self.channel = channel
  }

  private func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "start":
      let args = call.arguments as? [String: Any] ?? [:]
      start(
        baseUrl: args["baseUrl"] as? String,
        token: args["token"] as? String,
        headers: args["headers"] as? [String: String] ?? [:]
      )
      result(CLLocationManager.significantLocationChangeMonitoringAvailable())
    case "stop":
      stop()
      result(nil)
    case "requestAlways":
      requestAlways(result: result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func start(baseUrl: String?, token: String?, headers: [String: String]) {
    defaults.set(true, forKey: Self.enabledKey)
    defaults.set(baseUrl, forKey: Self.baseUrlKey)
    defaults.set(headers, forKey: Self.headersKey)
    if let token { Self.saveToken(token) } else { Self.deleteToken() }
    manager.startMonitoringSignificantLocationChanges()
  }

  private func stop() {
    manager.stopMonitoringSignificantLocationChanges()
    defaults.set(false, forKey: Self.enabledKey)
    defaults.removeObject(forKey: Self.lastLatKey)
    defaults.removeObject(forKey: Self.lastLngKey)
    Self.deleteToken()
  }

  // MARK: - Zgoda „zawsze” (geolocator na iOS prosi tylko o „podczas używania”)

  private func requestAlways(result: @escaping FlutterResult) {
    switch manager.authorizationStatus {
    case .authorizedAlways:
      result(true)
    case .denied, .restricted:
      result(false)
    default:
      pendingPermission?(false)
      pendingPermission = result
      // Gdy system nie pokaże okna (już raz pytał) albo użytkownik wybierze „Zostaw
      // podczas używania”, zmiana statusu nie przyjdzie — rozstrzygamy po powrocie aplikacji.
      activeObserver = NotificationCenter.default.addObserver(
        forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main
      ) { [weak self] _ in self?.resolvePermission() }
      manager.requestAlwaysAuthorization()
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
        // Brak okna systemowego — aplikacja nie przechodzi w stan nieaktywny.
        if UIApplication.shared.applicationState == .active { self?.resolvePermission() }
      }
    }
  }

  private func resolvePermission() {
    guard let result = pendingPermission else { return }
    pendingPermission = nil
    if let observer = activeObserver { NotificationCenter.default.removeObserver(observer) }
    activeObserver = nil
    result(manager.authorizationStatus == .authorizedAlways)
  }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if manager.authorizationStatus != .notDetermined { resolvePermission() }
  }

  // MARK: - CLLocationManagerDelegate

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    let moved = hasMovedEnough(to: location)
    var sent = false
    if moved, let request = makeRequest(for: location) {
      sent = true
      remember(location)
      let task = UIApplication.shared.beginBackgroundTask(withName: "tarcza.location")
      URLSession.shared.dataTask(with: request) { _, _, _ in
        UIApplication.shared.endBackgroundTask(task)
      }.resume()
    }
    // Gdy aplikacja żyje — informujemy Darta (UI; w trybie mock to Dart wysyła pozycję).
    if moved || sent {
      channel?.invokeMethod(
        "onLocation",
        arguments: [
          "lat": location.coordinate.latitude,
          "lng": location.coordinate.longitude,
          "sent": sent,
        ]
      )
    }
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    NSLog("Tarcza: tryb czuwania — błąd lokalizacji: \(error.localizedDescription)")
  }

  // MARK: - Wysyłka

  private func hasMovedEnough(to location: CLLocation) -> Bool {
    guard defaults.object(forKey: Self.lastLatKey) != nil else { return true }
    let last = CLLocation(
      latitude: defaults.double(forKey: Self.lastLatKey),
      longitude: defaults.double(forKey: Self.lastLngKey)
    )
    return location.distance(from: last) >= Self.minDistanceMeters
  }

  private func remember(_ location: CLLocation) {
    defaults.set(location.coordinate.latitude, forKey: Self.lastLatKey)
    defaults.set(location.coordinate.longitude, forKey: Self.lastLngKey)
  }

  private func makeRequest(for location: CLLocation) -> URLRequest? {
    guard
      let base = defaults.string(forKey: Self.baseUrlKey),
      let url = URL(string: base + "/api/v1/devices/me/location"),
      let token = Self.readToken()
    else { return nil }
    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.timeoutInterval = 8
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
    for (key, value) in defaults.dictionary(forKey: Self.headersKey) as? [String: String] ?? [:] {
      request.setValue(value, forHTTPHeaderField: key)
    }
    let body: [String: Any] = [
      "lat": location.coordinate.latitude,
      "lng": location.coordinate.longitude,
      "accuracyMeters": max(location.horizontalAccuracy, 0),
    ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: body)
    return request
  }

  // MARK: - Keychain (własny wpis — niezależny od formatu flutter_secure_storage)

  private static func baseQuery() -> [CFString: Any] {
    [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: keychainService,
      kSecAttrAccount: keychainAccount,
    ]
  }

  private static func saveToken(_ token: String) {
    deleteToken()
    var query = baseQuery()
    query[kSecValueData] = Data(token.utf8)
    query[kSecAttrAccessible] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
    SecItemAdd(query as CFDictionary, nil)
  }

  private static func deleteToken() {
    SecItemDelete(baseQuery() as CFDictionary)
  }

  private static func readToken() -> String? {
    var query = baseQuery()
    query[kSecReturnData] = true
    query[kSecMatchLimit] = kSecMatchLimitOne
    var item: CFTypeRef?
    guard SecItemCopyMatching(query as CFDictionary, &item) == errSecSuccess,
      let data = item as? Data
    else { return nil }
    return String(data: data, encoding: .utf8)
  }
}
