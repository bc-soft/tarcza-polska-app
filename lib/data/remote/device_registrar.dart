import "dart:io";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/remote/api/export.dart";

/// Rejestruje anonimowe urządzenie (`POST /devices`) i zapisuje JWT.
///
/// Używany przez `RemoteDeviceRepository` i `AuthInterceptor` (ponowna
/// rejestracja po 401). Działa na osobnym `Dio` bez interceptora autoryzacji.
/// Token FCM podajemy od razu — backend odpina go wtedy od poprzedniego urządzenia,
/// więc telefon nie dostaje podwójnych pytań.
class DeviceRegistrar {
  DeviceRegistrar({
    required this._client,
    required this._tokenStorage,
    required this._pushTokenProvider,
  });

  final DevicesClient _client;
  final TokenStorage _tokenStorage;
  final Future<String?> Function() _pushTokenProvider;

  Future<String> register({String? pushToken}) async {
    final response = await _client.postApiDeviceRegister(
      body: RegisterDeviceRequest(
        platform: currentPlatform,
        appVersion: AppConfig.appVersion,
        pushToken: pushToken ?? await _pushTokenProvider(),
      ),
    );
    await _tokenStorage.save(token: response.token, deviceId: response.deviceId);
    return response.deviceId;
  }

  static RegisterDeviceRequestPlatform get currentPlatform {
    if (Platform.isIOS) {
      return Platform.environment.containsKey("SIMULATOR_DEVICE_NAME")
          ? RegisterDeviceRequestPlatform.simulator
          : RegisterDeviceRequestPlatform.ios;
    }
    if (Platform.isAndroid) return RegisterDeviceRequestPlatform.android;
    return RegisterDeviceRequestPlatform.simulator;
  }
}
