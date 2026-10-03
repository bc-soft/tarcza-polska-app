import "package:get_it/get_it.dart";
import "package:shared_preferences/shared_preferences.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/core/location/background_location_service.dart";
import "package:tarcza_polska/core/location/h3_service.dart";
import "package:tarcza_polska/core/location/location_service.dart";
import "package:tarcza_polska/core/push/local_notifications.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/mock/demo_scenario.dart";
import "package:tarcza_polska/data/mock/mock_backend.dart";
import "package:tarcza_polska/data/mock/mock_repositories.dart";
import "package:tarcza_polska/data/remote/api/export.dart";
import "package:tarcza_polska/data/remote/citizen_api.dart";
import "package:tarcza_polska/data/remote/device_registrar.dart";
import "package:tarcza_polska/data/remote/dio_factory.dart";
import "package:tarcza_polska/data/remote/interceptors/auth_interceptor.dart";
import "package:tarcza_polska/data/remote/remote_repositories.dart";
import "package:tarcza_polska/data/repositories/location_repository.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

final GetIt getIt = GetIt.instance;

/// Jedno miejsce wyboru implementacji: `Mock*` albo `Remote*` (flaga `USE_MOCKS`).
Future<void> configureDependencies({bool useMocks = AppConfig.useMocks}) async {
  final prefs = await SharedPreferences.getInstance();

  getIt
    ..registerSingleton<AppPreferences>(AppPreferences(prefs))
    ..registerSingleton<TokenStorage>(TokenStorage())
    ..registerLazySingleton<H3Service>(H3Service.new)
    ..registerLazySingleton<LocationService>(LocationService.new)
    ..registerLazySingleton<LocalNotifications>(LocalNotifications.new)
    ..registerLazySingleton<BackgroundLocationService>(
      () => createBackgroundLocationService(getIt()),
    );

  if (useMocks) {
    _registerMocks();
  } else {
    _registerRemote();
  }

  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepository(getIt(), getIt(), getIt()),
  );
}

void _registerMocks() {
  final push = MockPushService(getIt());
  final backend = MockBackend();
  getIt
    ..registerSingleton<MockPushService>(push)
    ..registerSingleton<PushService>(push)
    ..registerSingleton<MockBackend>(backend)
    ..registerSingleton<DemoScenario>(DemoScenario(backend, push))
    ..registerLazySingleton<DeviceRepository>(
      () => MockDeviceRepository(backend, getIt(), getIt()),
    )
    ..registerLazySingleton<MapRepository>(() => MockMapRepository(backend))
    ..registerLazySingleton<IncidentRepository>(() => MockIncidentRepository(backend))
    ..registerLazySingleton<ReportRepository>(() => MockReportRepository(backend, getIt()))
    ..registerLazySingleton<VerificationRepository>(() => MockVerificationRepository(backend))
    ..registerLazySingleton<ShelterRepository>(() => MockShelterRepository(backend))
    ..registerLazySingleton<AlertRepository>(() => MockAlertRepository(backend));
}

void _registerRemote() {
  final push = AppConfig.enablePush ? FirebasePushService(getIt()) : NoopPushService(getIt());
  getIt.registerSingleton<PushService>(push);

  // Osobny `Dio` (bez autoryzacji) do rejestracji urządzenia i ponowień po 401.
  final bareDio = createDio(AppConfig.apiBaseUrl);
  final registrar = DeviceRegistrar(
    client: TarczaApi(bareDio).devices,
    tokenStorage: getIt(),
    pushTokenProvider: push.getToken,
  );
  final dio = createDio(AppConfig.apiBaseUrl)
    ..interceptors.insert(
      0,
      AuthInterceptor(tokenStorage: getIt(), registrar: registrar, retryDio: bareDio),
    );
  final api = CitizenApi(dio);

  getIt
    ..registerSingleton<DeviceRegistrar>(registrar)
    ..registerSingleton<CitizenApi>(api)
    ..registerLazySingleton<DeviceRepository>(
      () => RemoteDeviceRepository(api, registrar, getIt()),
    )
    ..registerLazySingleton<MapRepository>(() => RemoteMapRepository(api))
    ..registerLazySingleton<IncidentRepository>(() => RemoteIncidentRepository(api))
    ..registerLazySingleton<ReportRepository>(() => RemoteReportRepository(api))
    ..registerLazySingleton<VerificationRepository>(() => RemoteVerificationRepository(api))
    ..registerLazySingleton<ShelterRepository>(() => RemoteShelterRepository(api))
    ..registerLazySingleton<AlertRepository>(() => RemoteAlertRepository(api));
}
