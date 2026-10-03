// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/respond_request.dart';

part 'verification_client.g.dart';

@RestApi()
abstract class VerificationClient {
  factory VerificationClient(Dio dio, {String? baseUrl}) = _VerificationClient;

  /// Questions waiting for this device (poll on app foreground; pushes carry the same ids)
  @GET('/api/v1/verifications/pending')
  Future<void> getApiVerificationPending();

  /// One question (e.g. opened from a push)
  @GET('/api/v1/verifications/{id}')
  Future<void> getApiVerificationShow({
    @Path('id') required String id,
  });

  /// Answer YES / NO / UNKNOWN
  @POST('/api/v1/verifications/{id}/response')
  Future<void> postApiVerificationRespond({
    @Path('id') required String id,
    @Body() required RespondRequest body,
  });
}
