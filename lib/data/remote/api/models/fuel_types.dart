// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_type.dart';

part 'fuel_types.freezed.dart';
part 'fuel_types.g.dart';

@Freezed()
abstract class FuelTypes with _$FuelTypes {
  const factory FuelTypes({
    required FuelType value,
    required String label,
  }) = _FuelTypes;
  
  factory FuelTypes.fromJson(Map<String, Object?> json) => _$FuelTypesFromJson(json);
}
