// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_updated.freezed.dart';
part 'location_updated.g.dart';

@Freezed()
abstract class LocationUpdated with _$LocationUpdated {
  const factory LocationUpdated({
    /// H3 cell (resolution 9) of the stored position
    required String h3Cell,
  }) = _LocationUpdated;
  
  factory LocationUpdated.fromJson(Map<String, Object?> json) => _$LocationUpdatedFromJson(json);
}
