// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'verification_answer.dart';

part 'respond_request.freezed.dart';
part 'respond_request.g.dart';

@Freezed()
abstract class RespondRequest with _$RespondRequest {
  const factory RespondRequest({
    required VerificationAnswer answer,
  }) = _RespondRequest;
  
  factory RespondRequest.fromJson(Map<String, Object?> json) => _$RespondRequestFromJson(json);
}
