// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

/// Opening regime from the national register
@JsonEnum()
enum ShelterAvailability {
  @JsonValue('unknown')
  unknown('unknown'),
  @JsonValue('always')
  always('always'),
  @JsonValue('on_demand')
  onDemand('on_demand'),
  @JsonValue('scheduled')
  scheduled('scheduled'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const ShelterAvailability(this.json);

  factory ShelterAvailability.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<ShelterAvailability> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
