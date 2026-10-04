import "package:flutter_secure_storage/flutter_secure_storage.dart";

/// Token JWT urządzenia — wyłącznie w `flutter_secure_storage` (Keychain / Keystore).
///
/// `first_unlock`, bo token czyta też ścieżka w tle (Android: izolat `workmanager`).
class TokenStorage {
  TokenStorage([FlutterSecureStorage? storage])
    : _storage =
          storage ??
          const FlutterSecureStorage(
            iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
          );

  static const String tokenKey = "device_token";
  static const String deviceIdKey = "device_id";

  final FlutterSecureStorage _storage;
  String? _cachedToken;

  Future<String?> readToken() async => _cachedToken ??= await _storage.read(key: tokenKey);

  Future<String?> readDeviceId() => _storage.read(key: deviceIdKey);

  Future<void> save({required String token, required String deviceId}) async {
    _cachedToken = token;
    await _storage.write(key: tokenKey, value: token);
    await _storage.write(key: deviceIdKey, value: deviceId);
  }

  Future<void> clear() async {
    _cachedToken = null;
    await _storage.delete(key: tokenKey);
    await _storage.delete(key: deviceIdKey);
  }
}
