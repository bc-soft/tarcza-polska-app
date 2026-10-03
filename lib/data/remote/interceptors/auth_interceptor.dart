import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/data/remote/device_registrar.dart";

/// Dokleja `Authorization: Bearer <token>`; przy 401 usuwa token, rejestruje
/// urządzenie ponownie i ponawia żądanie jeden raz.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({
    required this._tokenStorage,
    required this._registrar,
    required this._retryDio,
  });

  final TokenStorage _tokenStorage;
  final DeviceRegistrar _registrar;

  /// `Dio` bez tego interceptora — do ponowienia żądania.
  final Dio _retryDio;

  static const _retriedKey = "auth_retried";

  static bool _isPublic(RequestOptions o) =>
      (o.method == "POST" && o.path.endsWith("/api/v1/devices")) ||
      o.path.endsWith("/api/v1/health");

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!_isPublic(options)) {
      final token = await _tokenStorage.readToken();
      if (token != null) options.headers["Authorization"] = "Bearer $token";
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final unauthorized = err.response?.statusCode == 401;
    if (!unauthorized || _isPublic(options) || options.extra[_retriedKey] == true) {
      return handler.next(err);
    }
    final data = err.response?.data;
    final error = data is Map ? data["error"] : null;
    debugPrint("API 401 ${options.method} ${options.path} (${error is Map ? error["code"] : ""})");
    try {
      // Równoległe żądania wysłane ze starym tokenem dostają 401 jednocześnie. Jeśli inne
      // już zarejestrowało urządzenie (token się zmienił), tylko ponawiamy — bez kolejnego
      // `POST /devices` (inaczej każde żądanie tworzyłoby nowe urządzenie).
      final sentWith = options.headers["Authorization"];
      final current = await _tokenStorage.readToken();
      if (current == null || sentWith == "Bearer $current") {
        await _tokenStorage.clear();
        await _registrar.register();
      }
      final token = await _tokenStorage.readToken();
      options
        ..extra[_retriedKey] = true
        ..headers["Authorization"] = "Bearer $token";
      handler.resolve(await _retryDio.fetch<dynamic>(options));
    } on DioException catch (e) {
      handler.next(e);
    }
  }
}
