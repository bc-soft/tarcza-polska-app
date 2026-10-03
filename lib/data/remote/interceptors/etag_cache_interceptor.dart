import "package:dio/dio.dart";

/// `ETag` / `If-None-Match` dla endpointów odpytywanych co 30 s (`openapi.json` 1.1.0):
/// `GET /map`, `GET /verifications/pending`, `GET /alerts`, `GET /incidents/{id}/timeline`.
/// Przy `304 Not Modified`
/// zwracamy ostatnią treść z pamięci — repozytoria i BLoC-i nie widzą różnicy.
///
/// Cache tylko w pamięci (bez danych na dysku, `docs/08`).
class EtagCacheInterceptor extends Interceptor {
  EtagCacheInterceptor({this.maxEntries = 32});

  final int maxEntries;
  final _cache = <String, ({String etag, Object? data})>{};

  static const _paths = ["/api/v1/map", "/api/v1/verifications/pending", "/api/v1/alerts"];

  static bool _cacheable(RequestOptions o) =>
      o.method == "GET" &&
      (_paths.any((p) => o.path == p || o.path.endsWith(p)) || o.path.endsWith("/timeline"));

  static String _key(RequestOptions o) => o.uri.toString();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_cacheable(options)) {
      final cached = _cache[_key(options)];
      if (cached != null) options.headers["If-None-Match"] = cached.etag;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final options = response.requestOptions;
    final etag = response.headers.value("etag");
    if (_cacheable(options) && etag != null && response.statusCode == 200) {
      if (_cache.length >= maxEntries) _cache.remove(_cache.keys.first);
      _cache[_key(options)] = (etag: etag, data: response.data);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final cached = _cache[_key(options)];
    if (err.response?.statusCode == 304 && cached != null) {
      handler.resolve(
        Response<dynamic>(
          requestOptions: options,
          data: cached.data,
          statusCode: 200,
          headers: err.response!.headers,
        ),
      );
      return;
    }
    handler.next(err);
  }

  /// Po ponownej rejestracji urządzenia (inne dane dla nowego tokena).
  void clear() => _cache.clear();
}
