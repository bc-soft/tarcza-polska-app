// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_location_request.freezed.dart';
part 'update_location_request.g.dart';

@Freezed()
abstract class UpdateLocationRequest with _$UpdateLocationRequest {
  const factory UpdateLocationRequest({
    required double lat,
    required double lng,
    required double? accuracyMeters,
  }) = _UpdateLocationRequest;
  
  factory UpdateLocationRequest.fromJson(Map<String, Object?> json) => _$UpdateLocationRequestFromJson(json);
}
