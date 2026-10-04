// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/alert_view.dart';

part 'alerts_client.g.dart';

@RestApi()
abstract class AlertsClient {
  factory AlertsClient(Dio dio, {String? baseUrl}) = _AlertsClient;

  /// Active alerts covering my position
  @GET('/api/v1/alerts')
  Future<List<AlertView>> getApiAlertList({
    @Query('lat') required num lat,
    @Query('lng') required num lng,
  });

  /// Alert details (opened from a push)
  @GET('/api/v1/alerts/{id}')
  Future<AlertView> getApiAlertShow({
    @Path('id') required String id,
  });
}
