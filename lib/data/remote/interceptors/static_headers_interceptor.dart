import "package:dio/dio.dart";

/// Stałe nagłówki doklejane do każdego żądania.
///
/// `ngrok-skip-browser-warning` — bez niego ngrok zamiast odpowiedzi API
/// zwraca stronę ostrzeżenia (HTML), gdy backend jest wystawiony przez tunel.
class StaticHeadersInterceptor extends Interceptor {
  StaticHeadersInterceptor([this.headers = defaultHeaders]);

  static const Map<String, String> defaultHeaders = {"ngrok-skip-browser-warning": "1"};

  final Map<String, String> headers;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(headers);
    handler.next(options);
  }
}
