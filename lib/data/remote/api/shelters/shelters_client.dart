// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/confirm_shelter_status_request.dart';

part 'shelters_client.g.dart';

@RestApi()
abstract class SheltersClient {
  factory SheltersClient(Dio dio, {String? baseUrl}) = _SheltersClient;

  /// Shelters in a bbox, or the nearest ones to lat/lng
  @GET('/api/v1/shelters')
  Future<void> getApiShelterList({
    @Query('bbox') String? bbox,
    @Query('lat') num? lat,
    @Query('lng') num? lng,
  });

  /// Shelter details
  @GET('/api/v1/shelters/{id}')
  Future<void> getApiShelterShow({
    @Path('id') required String id,
  });

  /// Confirm the current status of a shelter (open / closed / full)
  @POST('/api/v1/shelters/{id}/status')
  Future<void> postApiShelterConfirm({
    @Path('id') required String id,
    @Body() required ConfirmShelterStatusRequest body,
  });
}
