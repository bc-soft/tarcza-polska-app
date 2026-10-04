// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Community _$CommunityFromJson(Map<String, dynamic> json) => _Community(
  reports: (json['reports'] as num).toInt(),
  answers: (json['answers'] as num).toInt(),
  agreementPct: (json['agreementPct'] as num?)?.toInt(),
);

Map<String, dynamic> _$CommunityToJson(_Community instance) =>
    <String, dynamic>{
      'reports': instance.reports,
      'answers': instance.answers,
      'agreementPct': instance.agreementPct,
    };
