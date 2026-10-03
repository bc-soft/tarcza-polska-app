// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_types.dart';
import 'poi_kind.dart';
import 'report_scope.dart';
import 'report_type.dart';

part 'report_type_option.freezed.dart';
part 'report_type_option.g.dart';

@Freezed()
abstract class ReportTypeOption with _$ReportTypeOption {
  const factory ReportTypeOption({
    required ReportType value,
    required String label,
    required ReportScope scope,

    /// For point types: which object picker to show
    required PoiKind? poiKind,

    /// Non-empty only for fuel_shortage: the fuel-type choices to show
    required List<FuelTypes> fuelTypes,
  }) = _ReportTypeOption;
  
  factory ReportTypeOption.fromJson(Map<String, Object?> json) => _$ReportTypeOptionFromJson(json);
}
