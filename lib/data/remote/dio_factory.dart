import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

import "package:tarcza_polska/data/remote/interceptors/error_interceptor.dart";
import "package:tarcza_polska/data/remote/interceptors/static_headers_interceptor.dart";

/// Tworzy `Dio` ze wspólnymi ustawieniami. Interceptor autoryzacji dodaje DI,
/// bo potrzebuje osobnej instancji do rejestracji i ponowień.
Dio createDio(String baseUrl) =>
    Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 15),
          contentType: Headers.jsonContentType,
        ),
      )
      ..interceptors.addAll([
        StaticHeadersInterceptor(),
        if (kDebugMode) _DebugLogInterceptor(),
        ErrorInterceptor(),
      ]);

/// Tylko debug: metoda, ścieżka, status. Bez treści — nie logujemy lokalizacji ani zgłoszeń (`docs/08`).
class _DebugLogInterceptor extends Interceptor {
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final o = response.requestOptions;
    debugPrint("API ${o.method} ${o.uri.path} → ${response.statusCode}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final o = err.requestOptions;
    debugPrint("API ${o.method} ${o.uri.path} → ${err.response?.statusCode ?? err.type.name}");
    handler.next(err);
  }
}
