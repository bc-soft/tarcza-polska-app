// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/confirm_shelter_status_request.dart';
import '../models/shelter_view.dart';

part 'shelters_client.g.dart';

@RestApi()
abstract class SheltersClient {
  factory SheltersClient(Dio dio, {String? baseUrl}) = _SheltersClient;

  /// Shelters in a bbox, or the nearest ones to lat/lng
  @GET('/api/v1/shelters')
  Future<List<ShelterView>> getApiShelterList({
    @Query('bbox') String? bbox,
    @Query('lat') num? lat,
    @Query('lng') num? lng,
  });

  /// Shelter details
  @GET('/api/v1/shelters/{id}')
  Future<ShelterView> getApiShelterShow({
    @Path('id') required String id,
  });

  /// Confirm the current status of a shelter (open / closed) and, when open, how much room is left (plenty / limited / full)
  @POST('/api/v1/shelters/{id}/status')
  Future<ShelterView> postApiShelterConfirm({
    @Path('id') required String id,
    @Body() required ConfirmShelterStatusRequest body,
  });
}
