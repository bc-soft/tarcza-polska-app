// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_preferences_request.freezed.dart';
part 'update_preferences_request.g.dart';

@Freezed()
abstract class UpdatePreferencesRequest with _$UpdatePreferencesRequest {
  const factory UpdatePreferencesRequest({
    required bool locationRefresh,
  }) = _UpdatePreferencesRequest;
  
  factory UpdatePreferencesRequest.fromJson(Map<String, Object?> json) => _$UpdatePreferencesRequestFromJson(json);
}
