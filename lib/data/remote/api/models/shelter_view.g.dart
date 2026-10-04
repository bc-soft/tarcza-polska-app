// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShelterView _$ShelterViewFromJson(Map<String, dynamic> json) => _ShelterView(
  id: json['id'] as String,
  name: json['name'] as String,
  status: ShelterStatus.fromJson(json['status'] as String),
  statusLabel: json['statusLabel'] as String,
  occupancy: ShelterOccupancy.fromJson(json['occupancy'] as String),
  occupancyLabel: json['occupancyLabel'] as String,
  confirmationCount: (json['confirmationCount'] as num).toInt(),
  location: GeoJsonGeometry.fromJson(json['location'] as Map<String, dynamic>),
  address: json['address'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  availability: json['availability'] == null
      ? null
      : ShelterAvailability.fromJson(json['availability'] as String),
  availabilityLabel: json['availabilityLabel'] as String?,
  lastConfirmedAt: json['lastConfirmedAt'] == null
      ? null
      : DateTime.parse(json['lastConfirmedAt'] as String),
  distanceMeters: (json['distanceMeters'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShelterViewToJson(_ShelterView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': _$ShelterStatusEnumMap[instance.status]!,
      'statusLabel': instance.statusLabel,
      'occupancy': _$ShelterOccupancyEnumMap[instance.occupancy]!,
      'occupancyLabel': instance.occupancyLabel,
      'confirmationCount': instance.confirmationCount,
      'location': instance.location,
      'address': instance.address,
      'capacity': instance.capacity,
      'availability': _$ShelterAvailabilityEnumMap[instance.availability],
      'availabilityLabel': instance.availabilityLabel,
      'lastConfirmedAt': instance.lastConfirmedAt?.toIso8601String(),
      'distanceMeters': instance.distanceMeters,
    };

const _$ShelterStatusEnumMap = {
  ShelterStatus.unknown: 'unknown',
  ShelterStatus.open: 'open',
  ShelterStatus.closed: 'closed',
  ShelterStatus.full: 'full',
  ShelterStatus.$unknown: r'$unknown',
};

const _$ShelterOccupancyEnumMap = {
  ShelterOccupancy.unknown: 'unknown',
  ShelterOccupancy.plenty: 'plenty',
  ShelterOccupancy.limited: 'limited',
  ShelterOccupancy.full: 'full',
  ShelterOccupancy.$unknown: r'$unknown',
};

const _$ShelterAvailabilityEnumMap = {
  ShelterAvailability.unknown: 'unknown',
  ShelterAvailability.always: 'always',
  ShelterAvailability.onDemand: 'on_demand',
  ShelterAvailability.scheduled: 'scheduled',
  ShelterAvailability.$unknown: r'$unknown',
};
