// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'shelter_status.dart';

part 'confirm_shelter_status_request.freezed.dart';
part 'confirm_shelter_status_request.g.dart';

@Freezed()
abstract class ConfirmShelterStatusRequest with _$ConfirmShelterStatusRequest {
  const factory ConfirmShelterStatusRequest({
    required ShelterStatus status,
    required String? comment,
  }) = _ConfirmShelterStatusRequest;
  
  factory ConfirmShelterStatusRequest.fromJson(Map<String, Object?> json) => _$ConfirmShelterStatusRequestFromJson(json);
}
