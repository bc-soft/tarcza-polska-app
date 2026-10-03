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
);

Map<String, dynamic> _$ConfirmShelterStatusRequestToJson(
  _ConfirmShelterStatusRequest instance,
) => <String, dynamic>{
  'status': _$ShelterStatusEnumMap[instance.status]!,
  'comment': instance.comment,
};

const _$ShelterStatusEnumMap = {
  ShelterStatus.unknown: 'unknown',
  ShelterStatus.open: 'open',
  ShelterStatus.closed: 'closed',
  ShelterStatus.full: 'full',
  ShelterStatus.$unknown: r'$unknown',
};
