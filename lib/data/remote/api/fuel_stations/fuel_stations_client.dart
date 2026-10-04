// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/confirm_fuel_status_request.dart';
import '../models/fuel_station_view.dart';

part 'fuel_stations_client.g.dart';

@RestApi()
abstract class FuelStationsClient {
  factory FuelStationsClient(Dio dio, {String? baseUrl}) = _FuelStationsClient;

  /// Fuel stations in a bbox, or the nearest ones to lat/lng, with per-fuel availability
  @GET('/api/v1/fuel-stations')
  Future<List<FuelStationView>> getApiFuelStationList({
    @Query('bbox') String? bbox,
    @Query('lat') num? lat,
    @Query('lng') num? lng,
  });

  /// Fuel station details
  @GET('/api/v1/fuel-stations/{id}')
  Future<FuelStationView> getApiFuelStationShow({
    @Path('id') required String id,
  });

  /// Confirm fuel availability at a station I am standing at ("there is / there is no pb95 and diesel")
  @POST('/api/v1/fuel-stations/{id}/status')
  Future<FuelStationView> postApiFuelStationConfirm({
    @Path('id') required String id,
    @Body() required ConfirmFuelStatusRequest body,
  });
}
