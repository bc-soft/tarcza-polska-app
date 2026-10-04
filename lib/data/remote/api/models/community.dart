// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

part 'community.freezed.dart';
part 'community.g.dart';

@Freezed()
abstract class Community with _$Community {
  const factory Community({
    required int reports,
    required int answers,

    /// Share of answers confirming the problem; null until somebody answered
    int? agreementPct,
  }) = _Community;
  
  factory Community.fromJson(Map<String, Object?> json) => _$CommunityFromJson(json);
}
