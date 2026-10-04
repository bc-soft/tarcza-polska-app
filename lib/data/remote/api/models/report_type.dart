// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum ReportType {
  @JsonValue('power_outage')
  powerOutage('power_outage'),
  @JsonValue('water_outage')
  waterOutage('water_outage'),
  @JsonValue('fuel_shortage')
  fuelShortage('fuel_shortage'),
  @JsonValue('road_blocked')
  roadBlocked('road_blocked'),
  @JsonValue('shelter_issue')
  shelterIssue('shelter_issue'),
  @JsonValue('other_threat')
  otherThreat('other_threat'),
  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const ReportType(this.json);

  factory ReportType.fromJson(String json) => values.firstWhere(
        (e) => e.json == json,
        orElse: () => $unknown,
      );

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();
  /// Returns all defined enum values excluding the $unknown value.
  static List<ReportType> get $valuesDefined => values.where((value) => value != $unknown).toList();
}
