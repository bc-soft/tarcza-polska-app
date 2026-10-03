// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_api_v1_devices_response.freezed.dart';
part 'post_api_v1_devices_response.g.dart';

@Freezed()
abstract class PostApiV1DevicesResponse with _$PostApiV1DevicesResponse {
  const factory PostApiV1DevicesResponse({
    String? deviceId,

    /// Bearer token for /api/v1/*
    String? token,
  }) = _PostApiV1DevicesResponse;
  
  factory PostApiV1DevicesResponse.fromJson(Map<String, Object?> json) => _$PostApiV1DevicesResponseFromJson(json);
}
