// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter_feature_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShelterFeatureProperties _$ShelterFeaturePropertiesFromJson(
  Map<String, dynamic> json,
) => _ShelterFeatureProperties(
  id: json['id'] as String,
  name: json['name'] as String,
  status: ShelterStatus.fromJson(json['status'] as String),
  statusLabel: json['statusLabel'] as String,
  occupancy: ShelterOccupancy.fromJson(json['occupancy'] as String),
  occupancyLabel: json['occupancyLabel'] as String,
  confirmationCount: (json['confirmationCount'] as num).toInt(),
  kind: ShelterFeaturePropertiesKind.fromJson(json['kind'] as String),
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

Map<String, dynamic> _$ShelterFeaturePropertiesToJson(
  _ShelterFeatureProperties instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': _$ShelterStatusEnumMap[instance.status]!,
  'statusLabel': instance.statusLabel,
  'occupancy': _$ShelterOccupancyEnumMap[instance.occupancy]!,
  'occupancyLabel': instance.occupancyLabel,
  'confirmationCount': instance.confirmationCount,
  'kind': _$ShelterFeaturePropertiesKindEnumMap[instance.kind]!,
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

const _$ShelterFeaturePropertiesKindEnumMap = {
  ShelterFeaturePropertiesKind.shelter: 'shelter',
  ShelterFeaturePropertiesKind.$unknown: r'$unknown',
};

const _$ShelterAvailabilityEnumMap = {
  ShelterAvailability.unknown: 'unknown',
  ShelterAvailability.always: 'always',
  ShelterAvailability.onDemand: 'on_demand',
  ShelterAvailability.scheduled: 'scheduled',
  ShelterAvailability.$unknown: r'$unknown',
};
