// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/create_report_request.dart';

part 'reports_client.g.dart';

@RestApi()
abstract class ReportsClient {
  factory ReportsClient(Dio dio, {String? baseUrl}) = _ReportsClient;

  /// Submit a report (type -> location -> optional description)
  @POST('/api/v1/reports')
  Future<void> postApiReportCreate({
    @Body() required CreateReportRequest body,
  });

  /// Report categories with labels (for the report screen)
  @GET('/api/v1/reports/types')
  Future<void> getApiReportTypes();

  /// Status of one of my reports (which incident it joined)
  @GET('/api/v1/reports/{id}')
  Future<void> getApiReportShow({
    @Path('id') required String id,
  });
}
