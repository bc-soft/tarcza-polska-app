// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

/// Room left in an open shelter
@JsonEnum()
enum ShelterOccupancy {
  @JsonValue('unknown')
  unknown('unknown'),
  @JsonValue('plenty')
  plenty('plenty'),
  @JsonValue('limited')
  limited('limited'),
  @JsonValue('full')
  full('full'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const ShelterOccupancy(this.json);

  factory ShelterOccupancy.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<ShelterOccupancy> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
