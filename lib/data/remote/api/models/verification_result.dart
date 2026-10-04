// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_result.freezed.dart';
part 'verification_result.g.dart';

@Freezed()
abstract class VerificationResult with _$VerificationResult {
  const factory VerificationResult({
    required String verificationId,
    required String incidentId,

    /// Polish thank-you line to show the user
    required String thanks,
  }) = _VerificationResult;
  
  factory VerificationResult.fromJson(Map<String, Object?> json) => _$VerificationResultFromJson(json);
}
