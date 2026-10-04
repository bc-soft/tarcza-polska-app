// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'fuel_type2.dart';
import 'report_type.dart';

part 'create_report_request.freezed.dart';
part 'create_report_request.g.dart';

@Freezed()
abstract class CreateReportRequest with _$CreateReportRequest {
  const factory CreateReportRequest({
    required ReportType type,
    required double lat,
    required double lng,
    required String? description,
    required String? poiId,
    required List<FuelType2>? fuelTypes,
  }) = _CreateReportRequest;
  
  factory CreateReportRequest.fromJson(Map<String, Object?> json) => _$CreateReportRequestFromJson(json);
}
