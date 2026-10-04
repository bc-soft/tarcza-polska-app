// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_type2.dart';

part 'confirm_fuel_status_request.freezed.dart';
part 'confirm_fuel_status_request.g.dart';

@Freezed()
abstract class ConfirmFuelStatusRequest with _$ConfirmFuelStatusRequest {
  const factory ConfirmFuelStatusRequest({
    required List<FuelType2> fuelTypes,
    required bool available,
    required String? comment,
  }) = _ConfirmFuelStatusRequest;
  
  factory ConfirmFuelStatusRequest.fromJson(Map<String, Object?> json) => _$ConfirmFuelStatusRequestFromJson(json);
}
