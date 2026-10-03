// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateLocationRequest _$UpdateLocationRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateLocationRequest(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  accuracyMeters: (json['accuracyMeters'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UpdateLocationRequestToJson(
  _UpdateLocationRequest instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'accuracyMeters': instance.accuracyMeters,
};
