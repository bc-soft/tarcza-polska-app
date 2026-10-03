// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerificationResult _$VerificationResultFromJson(Map<String, dynamic> json) =>
    _VerificationResult(
      verificationId: json['verificationId'] as String,
      incidentId: json['incidentId'] as String,
      thanks: json['thanks'] as String,
    );

Map<String, dynamic> _$VerificationResultToJson(_VerificationResult instance) =>
    <String, dynamic>{
      'verificationId': instance.verificationId,
      'incidentId': instance.incidentId,
      'thanks': instance.thanks,
    };
