// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/offline_bundle.dart';
import '../models/procedure.dart';
import '../models/report_type.dart';

part 'guidance_client.g.dart';

@RestApi()
abstract class GuidanceClient {
  factory GuidanceClient(Dio dio, {String? baseUrl}) = _GuidanceClient;

  /// Everything to cache for offline mode around a position: shelters, active alerts, open incidents, procedures.
  ///
  /// [radiusMeters] - Default 15000, max 50000.
  @GET('/api/v1/offline-bundle')
  Future<OfflineBundle> getApiOfflineBundle({
    @Query('lat') required num lat,
    @Query('lng') required num lng,
    @Query('radiusMeters') int? radiusMeters,
  });

  /// Safety procedures (Polish checklists) for offline use; optionally filtered by incident type.
  ///
  /// [type] - Report type; returns procedures for that type plus the general ones.
  @GET('/api/v1/procedures')
  Future<List<Procedure>> getApiProcedures({
    @Query('type') ReportType? type,
  });
}
