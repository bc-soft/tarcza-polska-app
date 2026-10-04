// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerificationQuestion _$VerificationQuestionFromJson(
  Map<String, dynamic> json,
) => _VerificationQuestion(
  verificationId: json['verificationId'] as String,
  incidentId: json['incidentId'] as String,
  type: ReportType.fromJson(json['type'] as String),
  typeLabel: json['typeLabel'] as String,
  question: json['question'] as String,
  context: json['context'] as String,
  poi: json['poi'] == null
      ? null
      : Poi.fromJson(json['poi'] as Map<String, dynamic>),
  options: (json['options'] as List<dynamic>)
      .map((e) => VerificationAnswer.fromJson(e as String))
      .toList(),
  sentAt: DateTime.parse(json['sentAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  answered: json['answered'] as bool,
);

Map<String, dynamic> _$VerificationQuestionToJson(
  _VerificationQuestion instance,
) => <String, dynamic>{
  'verificationId': instance.verificationId,
  'incidentId': instance.incidentId,
  'type': _$ReportTypeEnumMap[instance.type]!,
  'typeLabel': instance.typeLabel,
  'question': instance.question,
  'context': instance.context,
  'poi': instance.poi,
  'options': instance.options
      .map((e) => _$VerificationAnswerEnumMap[e]!)
      .toList(),
  'sentAt': instance.sentAt.toIso8601String(),
  'expiresAt': instance.expiresAt.toIso8601String(),
  'answered': instance.answered,
};

const _$ReportTypeEnumMap = {
  ReportType.powerOutage: 'power_outage',
  ReportType.waterOutage: 'water_outage',
  ReportType.fuelShortage: 'fuel_shortage',
  ReportType.roadBlocked: 'road_blocked',
  ReportType.shelterIssue: 'shelter_issue',
  ReportType.otherThreat: 'other_threat',
  ReportType.$unknown: r'$unknown',
};

const _$VerificationAnswerEnumMap = {
  VerificationAnswer.yes: 'yes',
  VerificationAnswer.no: 'no',
  VerificationAnswer.unknown: 'unknown',
  VerificationAnswer.$unknown: r'$unknown',
};
