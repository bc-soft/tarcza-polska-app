// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';

import 'alerts/alerts_client.dart';
import 'devices/devices_client.dart';
import 'incidents/incidents_client.dart';
import 'reports/reports_client.dart';
import 'fallback/fallback_client.dart';
import 'shelters/shelters_client.dart';
import 'verification/verification_client.dart';

/// Tarcza Polska API `v1.0.0`.
///
/// Backend for the Tarcza Polska civil resilience platform.
///
/// * `/api/v1/*` - Citizen mobile app (Flutter). Authenticate with the JWT returned by `POST /api/v1/devices`.
/// * `/api/command/*` - Command Center. Authenticate with the JWT returned by `POST /api/command/login`.
///
/// All spatial payloads are GeoJSON (WGS84, `[lng, lat]` order).
///
class TarczaApi {
  TarczaApi(
    Dio dio, {
    String? baseUrl,
  })  : _dio = dio,
        _baseUrl = baseUrl;

  final Dio _dio;
  final String? _baseUrl;

  static String get version => '1.0.0';

  AlertsClient? _alerts;
  DevicesClient? _devices;
  IncidentsClient? _incidents;
  ReportsClient? _reports;
  FallbackClient? _fallback;
  SheltersClient? _shelters;
  VerificationClient? _verification;

  AlertsClient get alerts => _alerts ??= AlertsClient(_dio, baseUrl: _baseUrl);

  DevicesClient get devices => _devices ??= DevicesClient(_dio, baseUrl: _baseUrl);

  IncidentsClient get incidents => _incidents ??= IncidentsClient(_dio, baseUrl: _baseUrl);

  ReportsClient get reports => _reports ??= ReportsClient(_dio, baseUrl: _baseUrl);

  FallbackClient get fallback => _fallback ??= FallbackClient(_dio, baseUrl: _baseUrl);

  SheltersClient get shelters => _shelters ??= SheltersClient(_dio, baseUrl: _baseUrl);

  VerificationClient get verification => _verification ??= VerificationClient(_dio, baseUrl: _baseUrl);
}
