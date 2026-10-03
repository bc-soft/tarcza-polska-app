// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_type.dart';
import 'poi_ref.dart';
import 'report_scope.dart';

part 'report_accepted.freezed.dart';
part 'report_accepted.g.dart';

@Freezed()
abstract class ReportAccepted with _$ReportAccepted {
  const factory ReportAccepted({
    required String reportId,
    required String h3Cell,
    required DateTime createdAt,
    required ReportScope scope,

    /// The station / shelter the report was bound to (point types)
    required PoiRef? poi,
    required List<FuelType> fuelTypes,
  }) = _ReportAccepted;
  
  factory ReportAccepted.fromJson(Map<String, Object?> json) => _$ReportAcceptedFromJson(json);
}
