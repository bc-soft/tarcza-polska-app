// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceProfile _$DeviceProfileFromJson(Map<String, dynamic> json) =>
    _DeviceProfile(
      deviceId: json['deviceId'] as String,
      hasPushToken: json['hasPushToken'] as bool,
      preferences: DevicePreferences.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
      platform: json['platform'] as String?,
      lastLocation: json['lastLocation'] == null
          ? null
          : GeoJsonGeometry.fromJson(
              json['lastLocation'] as Map<String, dynamic>,
            ),
      h3Cell: json['h3Cell'] as String?,
      locationUpdatedAt: json['locationUpdatedAt'] == null
          ? null
          : DateTime.parse(json['locationUpdatedAt'] as String),
      locationSource: json['locationSource'] == null
          ? null
          : LocationSource.fromJson(json['locationSource'] as String),
    );

Map<String, dynamic> _$DeviceProfileToJson(_DeviceProfile instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'hasPushToken': instance.hasPushToken,
      'preferences': instance.preferences,
      'platform': instance.platform,
      'lastLocation': instance.lastLocation,
      'h3Cell': instance.h3Cell,
      'locationUpdatedAt': instance.locationUpdatedAt?.toIso8601String(),
      'locationSource': _$LocationSourceEnumMap[instance.locationSource],
    };

const _$LocationSourceEnumMap = {
  LocationSource.home: 'home',
  LocationSource.gps: 'gps',
  LocationSource.background: 'background',
  LocationSource.$unknown: r'$unknown',
};
