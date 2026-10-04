// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_preferences.freezed.dart';
part 'device_preferences.g.dart';

@Freezed()
abstract class DevicePreferences with _$DevicePreferences {
  const factory DevicePreferences({
    /// Receive the location_refresh reminder push (default true)
    required bool locationRefresh,
  }) = _DevicePreferences;
  
  factory DevicePreferences.fromJson(Map<String, Object?> json) => _$DevicePreferencesFromJson(json);
}
