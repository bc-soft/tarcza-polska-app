// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum FuelAvailability {
  @JsonValue('unknown')
  unknown('unknown'),
  @JsonValue('available')
  available('available'),
  @JsonValue('unavailable')
  unavailable('unavailable'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const FuelAvailability(this.json);

  factory FuelAvailability.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<FuelAvailability> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
