/// Wyjątki domenowe. BLoC-i łapią wyłącznie te typy — nigdy `DioException`.
///
/// Mapowanie z `{"error": {"code", "message", "violations"}}` robi
/// `ErrorInterceptor` (patrz `backend-specs.md` §2).
sealed class TarczaFailure implements Exception {
  const TarczaFailure([this.message]);

  /// Komunikat z backendu (po angielsku, do logów) — UI pokazuje własne teksty.
  final String? message;

  @override
  String toString() => "TarczaFailure(${message ?? ""})";
}

/// Brak połączenia, timeout, błąd DNS.
final class NetworkFailure extends TarczaFailure {
  const NetworkFailure([super.message]);
}

/// 401 — token wygasł lub urządzenie usunięte.
final class UnauthorizedFailure extends TarczaFailure {
  const UnauthorizedFailure([super.message]);
}

/// 404 — zły identyfikator albo cudzy zasób.
final class NotFoundFailure extends TarczaFailure {
  const NotFoundFailure([super.message]);
}

/// 422 — błędne body; [violations] mapuje nazwę pola na komunikat.
final class ValidationFailure extends TarczaFailure {
  const ValidationFailure({this.violations = const {}, String? message}) : super(message);

  final Map<String, String> violations;
}

/// 429 — limit zgłoszeń (10 / 10 min) lub lokalizacji (30 / min). Nie ponawiamy automatycznie.
final class RateLimitedFailure extends TarczaFailure {
  const RateLimitedFailure([super.message]);
}

/// 409 przy odpowiedzi na pytanie — traktujemy jak sukces.
final class AlreadyAnsweredFailure extends TarczaFailure {
  const AlreadyAnsweredFailure([super.message]);
}

/// 410 — pytanie weryfikacyjne wygasło.
final class QuestionExpiredFailure extends TarczaFailure {
  const QuestionExpiredFailure([super.message]);
}

/// 400 / 403 / 5xx i wszystko, czego nie rozpoznaliśmy.
final class ServerFailure extends TarczaFailure {
  const ServerFailure({this.statusCode, String? message}) : super(message);

  final int? statusCode;
}
