// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/device_profile.dart';
import '../models/device_registered.dart';
import '../models/location_updated.dart';
import '../models/register_device_request.dart';
import '../models/update_location_request.dart';
import '../models/update_preferences_request.dart';
import '../models/update_push_token_request.dart';

part 'devices_client.g.dart';

@RestApi()
abstract class DevicesClient {
  factory DevicesClient(Dio dio, {String? baseUrl}) = _DevicesClient;

  /// Register an anonymous device and obtain a JWT
  @POST('/api/v1/devices')
  Future<DeviceRegistered> postApiDeviceRegister({
    @Body() required RegisterDeviceRequest body,
  });

  /// Current device profile
  @GET('/api/v1/devices/me')
  Future<DeviceProfile> getApiDeviceMe();

  /// Update the last known location of the device (no history is kept)
  @PUT('/api/v1/devices/me/location')
  Future<LocationUpdated> putApiDeviceLocation({
    @Body() required UpdateLocationRequest body,
  });

  /// Notification preferences (location_refresh reminders on / off)
  @PUT('/api/v1/devices/me/preferences')
  Future<void> putApiDevicePreferences({
    @Body() required UpdatePreferencesRequest body,
  });

  /// Register / rotate the FCM push token
  @PUT('/api/v1/devices/me/push-token')
  Future<void> putApiDevicePushToken({
    @Body() required UpdatePushTokenRequest body,
  });
}
