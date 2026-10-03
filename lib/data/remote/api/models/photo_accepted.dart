// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'photo_accepted_status.dart';

part 'photo_accepted.freezed.dart';
part 'photo_accepted.g.dart';

/// Returned right after a photo upload; analysis runs in the background and is visible to operators only.
@Freezed()
abstract class PhotoAccepted with _$PhotoAccepted {
  const factory PhotoAccepted({
    required String photoId,
    required String reportId,
    required PhotoAcceptedStatus status,

    /// After server-side resize (longest edge <= 1600 px)
    required int width,
    required int height,

    /// Size of the stored JPEG
    required int bytes,
    required DateTime createdAt,
  }) = _PhotoAccepted;
  
  factory PhotoAccepted.fromJson(Map<String, Object?> json) => _$PhotoAcceptedFromJson(json);
}
