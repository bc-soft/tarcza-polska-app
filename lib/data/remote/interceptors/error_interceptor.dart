import "package:dio/dio.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/remote/dto/dtos.dart";

/// Mapuje odpowiedzi błędów backendu na [TarczaFailure] i umieszcza je w
/// `DioException.error`. Repozytoria wyciągają je przez [guardApi].
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err.copyWith(error: mapDioException(err)));
  }
}

TarczaFailure mapDioException(DioException e) {
  if (e.error is TarczaFailure) return e.error! as TarczaFailure;

  final response = e.response;
  if (response == null) return NetworkFailure(e.message);

  final body = _parseError(response.data);
  final message = body?.message;
  return switch (response.statusCode) {
    401 => UnauthorizedFailure(message),
    404 => NotFoundFailure(message),
    409 => AlreadyAnsweredFailure(message),
    410 => QuestionExpiredFailure(message),
    422 => ValidationFailure(
      message: message,
      violations: {for (final v in body?.violations ?? <ViolationDto>[]) v.field: v.message},
    ),
    429 => RateLimitedFailure(message),
    final code => ServerFailure(statusCode: code, message: message),
  };
}

ErrorBodyDto? _parseError(Object? data) {
  try {
    if (data is Map<String, dynamic>) return ErrorResponseDto.fromJson(data).error;
  } on Object {
    // Nieoczekiwany kształt błędu — zwracamy sam kod HTTP.
  }
  return null;
}

/// Wywołuje [call] i zamienia błędy transportu na [TarczaFailure].
Future<T> guardApi<T>(Future<T> Function() call) async {
  try {
    return await call();
  } on DioException catch (e) {
    throw mapDioException(e);
  } on TarczaFailure {
    rethrow;
  } on Object catch (e) {
    throw ServerFailure(message: e.toString());
  }
}
