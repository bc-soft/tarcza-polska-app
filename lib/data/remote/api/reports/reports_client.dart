// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/create_report_request.dart';
import '../models/photo_accepted.dart';
import '../models/report_accepted.dart';
import '../models/report_status_view.dart';
import '../models/report_type_option.dart';

part 'reports_client.g.dart';

@RestApi()
abstract class ReportsClient {
  factory ReportsClient(Dio dio, {String? baseUrl}) = _ReportsClient;

  /// Submit a report (type -> location -> optional description)
  @POST('/api/v1/reports')
  Future<ReportAccepted> postApiReportCreate({
    @Body() required CreateReportRequest body,
  });

  /// Report categories with labels (for the report screen)
  @GET('/api/v1/reports/types')
  Future<List<ReportTypeOption>> getApiReportTypes();

  /// Status of one of my reports (which incident it joined)
  @GET('/api/v1/reports/{id}')
  Future<ReportStatusView> getApiReportShow({
    @Path('id') required String id,
  });

  /// Attach a photo to my report (multipart/form-data, field "photo"; JPEG/PNG/WebP up to 10 MB). EXIF and GPS are stripped server-side; the photo is analysed asynchronously and visible only to operators.
  @MultiPart()
  @POST('/api/v1/reports/{id}/photo')
  Future<PhotoAccepted> postApiReportPhoto({
    @Path('id') required String id,
    @Part(name: 'photo') required File photo,
  });
}
