// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'poi.dart';
import 'report_type.dart';
import 'verification_answer.dart';

part 'verification_question.freezed.dart';
part 'verification_question.g.dart';

@Freezed()
abstract class VerificationQuestion with _$VerificationQuestion {
  const factory VerificationQuestion({
    required String verificationId,
    required String incidentId,
    required ReportType type,
    required String typeLabel,
    required String question,
    required String context,

    /// Point verification: the station / shelter the question is about (show its name; it may be a neighbour of the reported one)
    required Poi? poi,
    required List<VerificationAnswer> options,
    required DateTime sentAt,
    required DateTime expiresAt,
    required bool answered,
  }) = _VerificationQuestion;
  
  factory VerificationQuestion.fromJson(Map<String, Object?> json) => _$VerificationQuestionFromJson(json);
}
