// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respond_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RespondRequest _$RespondRequestFromJson(Map<String, dynamic> json) =>
    _RespondRequest(
      answer: VerificationAnswer.fromJson(json['answer'] as String),
    );

Map<String, dynamic> _$RespondRequestToJson(_RespondRequest instance) =>
    <String, dynamic>{'answer': _$VerificationAnswerEnumMap[instance.answer]!};

const _$VerificationAnswerEnumMap = {
  VerificationAnswer.yes: 'yes',
  VerificationAnswer.no: 'no',
  VerificationAnswer.unknown: 'unknown',
  VerificationAnswer.$unknown: r'$unknown',
};
