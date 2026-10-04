// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'shelter_availability.dart';
import 'shelter_occupancy.dart';
import 'shelter_status.dart';

part 'shelter_summary.freezed.dart';
part 'shelter_summary.g.dart';

@Freezed()
abstract class ShelterSummary with _$ShelterSummary {
  const factory ShelterSummary({
    required String id,
    required String name,
    required ShelterStatus status,
    required String statusLabel,
    required ShelterOccupancy occupancy,
    required String occupancyLabel,
    required int confirmationCount,
    String? address,
    int? capacity,
    ShelterAvailability? availability,
    String? availabilityLabel,
    DateTime? lastConfirmedAt,

    /// Only in GET /shelters?lat&lng
    int? distanceMeters,
  }) = _ShelterSummary;
  
  factory ShelterSummary.fromJson(Map<String, Object?> json) => _$ShelterSummaryFromJson(json);
}
