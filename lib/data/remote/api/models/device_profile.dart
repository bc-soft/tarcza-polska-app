// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'device_preferences.dart';
import 'geo_json_geometry.dart';
import 'location_source.dart';

part 'device_profile.freezed.dart';
part 'device_profile.g.dart';

@Freezed()
abstract class DeviceProfile with _$DeviceProfile {
  const factory DeviceProfile({
    required String deviceId,
    required bool hasPushToken,
    required DevicePreferences preferences,

    /// ios | android | web | simulator
    String? platform,

    /// Point or null until the first location update
    GeoJsonGeometry? lastLocation,
    String? h3Cell,
    DateTime? locationUpdatedAt,
    LocationSource? locationSource,
  }) = _DeviceProfile;
  
  factory DeviceProfile.fromJson(Map<String, Object?> json) => _$DeviceProfileFromJson(json);
}
