// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_shelter_status_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConfirmShelterStatusRequest _$ConfirmShelterStatusRequestFromJson(
  Map<String, dynamic> json,
) => _ConfirmShelterStatusRequest(
  status: ShelterStatus.fromJson(json['status'] as String),
  comment: json['comment'] as String?,
  occupancy: json['occupancy'] == null
      ? null
      : ShelterOccupancy2.fromJson(json['occupancy'] as String),
);

Map<String, dynamic> _$ConfirmShelterStatusRequestToJson(
  _ConfirmShelterStatusRequest instance,
) => <String, dynamic>{
  'status': _$ShelterStatusEnumMap[instance.status]!,
  'comment': instance.comment,
  'occupancy': _$ShelterOccupancy2EnumMap[instance.occupancy],
};

const _$ShelterStatusEnumMap = {
  ShelterStatus.unknown: 'unknown',
  ShelterStatus.open: 'open',
  ShelterStatus.closed: 'closed',
  ShelterStatus.full: 'full',
  ShelterStatus.$unknown: r'$unknown',
};

const _$ShelterOccupancy2EnumMap = {
  ShelterOccupancy2.unknown: 'unknown',
  ShelterOccupancy2.plenty: 'plenty',
  ShelterOccupancy2.limited: 'limited',
  ShelterOccupancy2.full: 'full',
  ShelterOccupancy2.$unknown: r'$unknown',
};
