import "package:dio/dio.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/remote/dto/error_response_dto.dart";

/// Mapuje kopertę `ErrorResponse` (`{"error": {"code", "message", "retryAfter", "violations"}}`)
/// na [TarczaFailure] i umieszcza je w `DioException.error`. Repozytoria wyciągają je przez [guardApi].
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
  final code = body?.code;
  final message = body?.message;

  // Najpierw kody domenowe (`openapi.json` 1.1.0), potem status HTTP jako zapas.
  switch (code) {
    case "verification_already_answered":
      return AlreadyAnsweredFailure(message);
    case "verification_expired":
      return QuestionExpiredFailure(message);
    case "token_expired":
      return UnauthorizedFailure(expired: true, message: message);
  }
  return switch (response.statusCode) {
    401 => UnauthorizedFailure(message: message),
    404 => NotFoundFailure(message),
    409 => AlreadyAnsweredFailure(message),
    410 => QuestionExpiredFailure(message),
    422 => ValidationFailure(
      message: message,
      violations: {for (final v in body?.violations ?? <ErrorViolationDto>[]) v.field: v.message},
    ),
    429 => RateLimitedFailure(retryAfter: _retryAfter(response, body), message: message),
    final status => ServerFailure(statusCode: status, message: message),
  };
}

Duration? _retryAfter(Response<dynamic> response, ErrorDetailDto? body) {
  final seconds = body?.retryAfter ?? int.tryParse(response.headers.value("retry-after") ?? "");
  return seconds == null ? null : Duration(seconds: seconds);
}

ErrorDetailDto? _parseError(Object? data) {
  try {
    if (data is Map<String, dynamic>) return ErrorResponseDto.fromJson(data).error;
  } on Object {
    // Nieoczekiwany kształt błędu — zostaje sam kod HTTP.
  }
  return null;
}

/// Wywołuje [call] i zamienia błędy transportu oraz parsowania na [TarczaFailure].
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
