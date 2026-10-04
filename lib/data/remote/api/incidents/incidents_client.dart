// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/incident_timeline_entry.dart';
import '../models/incident_view.dart';
import '../models/map_feature_collection.dart';

part 'incidents_client.g.dart';

@RestApi()
abstract class IncidentsClient {
  factory IncidentsClient(Dio dio, {String? baseUrl}) = _IncidentsClient;

  /// Open incidents (optionally only those containing my position)
  @GET('/api/v1/incidents')
  Future<List<IncidentView>> getApiIncidentList({
    @Query('lat') num? lat,
    @Query('lng') num? lng,
  });

  /// Public view of an incident (aggregated, no raw report positions)
  @GET('/api/v1/incidents/{id}')
  Future<IncidentView> getApiIncidentShow({
    @Path('id') required String id,
  });

  /// History of an incident: detection, verification waves, area changes, confidence changes, confirmations, alerts
  @GET('/api/v1/incidents/{id}/timeline')
  Future<List<IncidentTimelineEntry>> getApiIncidentTimeline({
    @Path('id') required String id,
  });

  /// Everything visible on the citizen map inside a bbox, as GeoJSON.
  ///
  /// [bbox] - minLng,minLat,maxLng,maxLat (defaults to the configured region: Poznań).
  @GET('/api/v1/map')
  Future<MapFeatureCollection> getApiMap({
    @Query('bbox') String? bbox,
  });
}
