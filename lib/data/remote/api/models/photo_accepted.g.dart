// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_accepted.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoAccepted _$PhotoAcceptedFromJson(Map<String, dynamic> json) =>
    _PhotoAccepted(
      photoId: json['photoId'] as String,
      reportId: json['reportId'] as String,
      status: PhotoAcceptedStatus.fromJson(json['status'] as String),
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      bytes: (json['bytes'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$PhotoAcceptedToJson(_PhotoAccepted instance) =>
    <String, dynamic>{
      'photoId': instance.photoId,
      'reportId': instance.reportId,
      'status': _$PhotoAcceptedStatusEnumMap[instance.status]!,
      'width': instance.width,
      'height': instance.height,
      'bytes': instance.bytes,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$PhotoAcceptedStatusEnumMap = {
  PhotoAcceptedStatus.processing: 'processing',
  PhotoAcceptedStatus.$unknown: r'$unknown',
};
