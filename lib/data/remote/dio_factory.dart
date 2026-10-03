import "package:dio/dio.dart";

import "package:tarcza_polska/data/remote/interceptors/error_interceptor.dart";
import "package:tarcza_polska/data/remote/interceptors/static_headers_interceptor.dart";

/// Tworzy `Dio` ze wspólnymi ustawieniami. Interceptor autoryzacji dodaje DI,
/// bo potrzebuje osobnej instancji do rejestracji i ponowień.
Dio createDio(String baseUrl) => Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 15),
    contentType: Headers.jsonContentType,
  ),
)..interceptors.addAll([StaticHeadersInterceptor(), ErrorInterceptor()]);
