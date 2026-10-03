// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'incidents_client.g.dart';

@RestApi()
abstract class IncidentsClient {
  factory IncidentsClient(Dio dio, {String? baseUrl}) = _IncidentsClient;

  /// Open incidents (optionally only those containing my position)
  @GET('/api/v1/incidents')
  Future<void> getApiIncidentList({
    @Query('lat') num? lat,
    @Query('lng') num? lng,
  });

  /// Public view of an incident (aggregated, no raw report positions)
  @GET('/api/v1/incidents/{id}')
  Future<void> getApiIncidentShow({
    @Path('id') required String id,
  });

  /// Everything visible on the citizen map inside a bbox, as GeoJSON.
  ///
  /// [bbox] - minLng,minLat,maxLng,maxLat (defaults to Poland).
  @GET('/api/v1/map')
  Future<void> getApiMap({
    @Query('bbox') String? bbox,
  });
}
