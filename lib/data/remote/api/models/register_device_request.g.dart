// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
  Map<String, dynamic> json,
) => _RegisterDeviceRequest(
  platform: json['platform'] == null
      ? null
      : RegisterDeviceRequestPlatform.fromJson(json['platform'] as String),
  appVersion: json['appVersion'] as String?,
  pushToken: json['pushToken'] as String?,
);

Map<String, dynamic> _$RegisterDeviceRequestToJson(
  _RegisterDeviceRequest instance,
) => <String, dynamic>{
  'platform': _$RegisterDeviceRequestPlatformEnumMap[instance.platform],
  'appVersion': instance.appVersion,
  'pushToken': instance.pushToken,
};

const _$RegisterDeviceRequestPlatformEnumMap = {
  RegisterDeviceRequestPlatform.ios: 'ios',
  RegisterDeviceRequestPlatform.android: 'android',
  RegisterDeviceRequestPlatform.web: 'web',
  RegisterDeviceRequestPlatform.simulator: 'simulator',
  RegisterDeviceRequestPlatform.$unknown: r'$unknown',
};
