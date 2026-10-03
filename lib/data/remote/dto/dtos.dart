/// Ręczne DTO odpowiedzi — `openapi.json` nie opisuje jeszcze schematów odpowiedzi
/// (poza `POST /devices`). Kształty wg `backend-specs.md` §3–9.
/// Po uzupełnieniu spec przez backend: regenerować klienta i usunąć ten plik.
library;

import "package:flutter/foundation.dart";
import "package:json_annotation/json_annotation.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/remote/dto/geojson_dto.dart";

export "geojson_dto.dart";

part "dtos.g.dart";

const _dto = JsonSerializable(createToJson: false);

@_dto
class CommunityDto {
  const CommunityDto({this.reports = 0, this.answers = 0, this.agreementPct});

  factory CommunityDto.fromJson(Map<String, dynamic> json) => _$CommunityDtoFromJson(json);

  final int reports;
  final int answers;
  final num? agreementPct;

  Community toDomain() =>
      Community(reports: reports, answers: answers, agreementPct: agreementPct?.round());
}

@_dto
class IncidentDto {
  const IncidentDto({
    required this.id,
    required this.type,
    this.typeLabel,
    required this.status,
    required this.confidenceLevel,
    this.confidenceLabel,
    this.confidenceScore = 0,
    required this.startedAt,
    this.lastActivityAt,
    this.lastConfirmedAt,
    this.community,
    this.summary,
    this.area,
  });

  factory IncidentDto.fromJson(Map<String, dynamic> json) => _$IncidentDtoFromJson(json);

  final String id;
  final String type;
  final String? typeLabel;
  final String status;
  final String confidenceLevel;
  final String? confidenceLabel;
  final num confidenceScore;
  final DateTime startedAt;
  final DateTime? lastActivityAt;
  final DateTime? lastConfirmedAt;
  final CommunityDto? community;
  final String? summary;
  final GeometryDto? area;

  /// [geometry] — geometria Feature z `GET /map` (tam `area` jest w `geometry`).
  Incident toDomain({GeometryDto? geometry}) => Incident(
    id: id,
    type: IncidentType.fromApi(type),
    typeLabel: typeLabel ?? type,
    status: IncidentStatus.fromApi(status),
    confidenceLevel: ConfidenceLevel.fromApi(confidenceLevel),
    confidenceLabel: confidenceLabel ?? confidenceLevel,
    confidenceScore: confidenceScore.toDouble().clamp(0, 1),
    startedAt: startedAt,
    lastActivityAt: lastActivityAt ?? startedAt,
    lastConfirmedAt: lastConfirmedAt,
    community: community?.toDomain() ?? const Community(),
    summary: summary,
    area: (geometry ?? area)?.toDomain() ?? const GeoArea.polygons([]),
  );
}

@_dto
class ShelterDto {
  const ShelterDto({
    required this.id,
    required this.name,
    this.address,
    this.location,
    required this.status,
    this.statusLabel,
    this.capacity,
    this.lastConfirmedAt,
    this.confirmationCount = 0,
    this.distanceMeters,
  });

  factory ShelterDto.fromJson(Map<String, dynamic> json) => _$ShelterDtoFromJson(json);

  final String id;
  final String name;
  final String? address;
  final GeometryDto? location;
  final String status;
  final String? statusLabel;
  final int? capacity;
  final DateTime? lastConfirmedAt;
  final int confirmationCount;
  final num? distanceMeters;

  Shelter toDomain({GeometryDto? geometry}) => Shelter(
    id: id,
    name: name,
    address: address ?? "",
    location: (geometry ?? location)?.toPoint() ?? const LatLng(0, 0),
    status: ShelterStatus.fromApi(status),
    statusLabel: statusLabel ?? status,
    capacity: capacity,
    lastConfirmedAt: lastConfirmedAt,
    confirmationCount: confirmationCount,
    distanceMeters: distanceMeters?.toDouble(),
  );
}

@_dto
class AlertDto {
  const AlertDto({
    required this.id,
    required this.title,
    required this.body,
    required this.severity,
    this.incidentId,
    this.createdAt,
    required this.expiresAt,
    this.active = true,
    this.area,
  });

  factory AlertDto.fromJson(Map<String, dynamic> json) => _$AlertDtoFromJson(json);

  final String id;
  final String title;
  final String body;
  final String severity;
  final String? incidentId;
  final DateTime? createdAt;
  final DateTime expiresAt;
  final bool active;
  final GeometryDto? area;

  Alert toDomain({GeometryDto? geometry}) => Alert(
    id: id,
    title: title,
    body: body,
    severity: AlertSeverity.fromApi(severity),
    incidentId: incidentId,
    createdAt: createdAt,
    expiresAt: expiresAt,
    active: active,
    area: (geometry ?? area)?.toDomain(),
  );
}

@_dto
class VerificationQuestionDto {
  const VerificationQuestionDto({
    required this.verificationId,
    required this.incidentId,
    required this.type,
    this.typeLabel,
    required this.question,
    required this.context,
    this.options = const ["yes", "no", "unknown"],
    required this.sentAt,
    required this.expiresAt,
    this.answered = false,
  });

  factory VerificationQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$VerificationQuestionDtoFromJson(json);

  final String verificationId;
  final String incidentId;
  final String type;
  final String? typeLabel;
  final String question;
  final String context;
  final List<String> options;
  final DateTime sentAt;
  final DateTime expiresAt;
  final bool answered;

  VerificationQuestion toDomain() => VerificationQuestion(
    verificationId: verificationId,
    incidentId: incidentId,
    type: IncidentType.fromApi(type),
    typeLabel: typeLabel ?? type,
    question: question,
    context: context,
    options: options.map(VerificationAnswer.fromApi).toSet().toList(),
    sentAt: sentAt,
    expiresAt: expiresAt,
    answered: answered,
  );
}

@_dto
class VerificationResultDto {
  const VerificationResultDto({
    required this.verificationId,
    required this.incidentId,
    required this.thanks,
  });

  factory VerificationResultDto.fromJson(Map<String, dynamic> json) =>
      _$VerificationResultDtoFromJson(json);

  final String verificationId;
  final String incidentId;
  final String thanks;

  VerificationResult toDomain() =>
      VerificationResult(verificationId: verificationId, incidentId: incidentId, thanks: thanks);
}

@_dto
class ReportTypeDto {
  const ReportTypeDto({required this.value, required this.label});

  factory ReportTypeDto.fromJson(Map<String, dynamic> json) => _$ReportTypeDtoFromJson(json);

  final String value;
  final String label;

  ReportTypeOption toDomain() => ReportTypeOption(type: IncidentType.fromApi(value), label: label);
}

@_dto
class ReportReceiptDto {
  const ReportReceiptDto({required this.reportId, this.h3Cell, required this.createdAt});

  factory ReportReceiptDto.fromJson(Map<String, dynamic> json) => _$ReportReceiptDtoFromJson(json);

  final String reportId;
  final String? h3Cell;
  final DateTime createdAt;

  ReportReceipt toDomain() =>
      ReportReceipt(reportId: reportId, h3Cell: h3Cell, createdAt: createdAt);
}

@_dto
class ReportIncidentRefDto {
  const ReportIncidentRefDto({
    required this.id,
    required this.status,
    required this.confidenceLevel,
    this.confidenceScore = 0,
  });

  factory ReportIncidentRefDto.fromJson(Map<String, dynamic> json) =>
      _$ReportIncidentRefDtoFromJson(json);

  final String id;
  final String status;
  final String confidenceLevel;
  final num confidenceScore;

  ReportIncidentRef toDomain() => ReportIncidentRef(
    id: id,
    status: IncidentStatus.fromApi(status),
    confidenceLevel: ConfidenceLevel.fromApi(confidenceLevel),
    confidenceScore: confidenceScore.toDouble(),
  );
}

@_dto
class ReportStatusDto {
  const ReportStatusDto({
    required this.reportId,
    required this.type,
    required this.createdAt,
    this.incident,
  });

  factory ReportStatusDto.fromJson(Map<String, dynamic> json) => _$ReportStatusDtoFromJson(json);

  final String reportId;
  final String type;
  final DateTime createdAt;
  final ReportIncidentRefDto? incident;

  ReportStatus toDomain() => ReportStatus(
    reportId: reportId,
    type: IncidentType.fromApi(type),
    createdAt: createdAt,
    incident: incident?.toDomain(),
  );
}

@_dto
class DeviceProfileDto {
  const DeviceProfileDto({
    required this.deviceId,
    this.platform,
    this.hasPushToken = false,
    this.lastLocation,
    this.h3Cell,
    this.locationUpdatedAt,
  });

  factory DeviceProfileDto.fromJson(Map<String, dynamic> json) => _$DeviceProfileDtoFromJson(json);

  final String deviceId;
  final String? platform;
  final bool hasPushToken;
  final GeometryDto? lastLocation;
  final String? h3Cell;
  final DateTime? locationUpdatedAt;

  DeviceProfile toDomain() => DeviceProfile(
    deviceId: deviceId,
    platform: platform,
    hasPushToken: hasPushToken,
    lastLocation: lastLocation?.toPoint(),
    h3Cell: h3Cell,
    locationUpdatedAt: locationUpdatedAt,
  );
}

@_dto
class LocationUpdateDto {
  const LocationUpdateDto({this.h3Cell});

  factory LocationUpdateDto.fromJson(Map<String, dynamic> json) =>
      _$LocationUpdateDtoFromJson(json);

  final String? h3Cell;
}

/// `{"error": {"code", "message", "violations"}}`
@_dto
class ErrorResponseDto {
  const ErrorResponseDto({required this.error});

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) => _$ErrorResponseDtoFromJson(json);

  final ErrorBodyDto error;
}

@_dto
class ErrorBodyDto {
  const ErrorBodyDto({required this.code, this.message, this.violations = const []});

  factory ErrorBodyDto.fromJson(Map<String, dynamic> json) => _$ErrorBodyDtoFromJson(json);

  final String code;
  final String? message;
  final List<ViolationDto> violations;
}

@_dto
class ViolationDto {
  const ViolationDto({required this.field, required this.message});

  factory ViolationDto.fromJson(Map<String, dynamic> json) => _$ViolationDtoFromJson(json);

  final String field;
  final String message;
}

/// Mapuje Feature z `GET /map` na element domenowy; `null` dla nieznanego `kind`.
MapFeature? mapFeatureFromDto(FeatureDto feature) {
  // `properties.id` nie jest gwarantowane dla każdego `kind` — zapasowo `Feature.id`.
  final props = {"id": feature.id, ...feature.properties};
  final geometry = feature.geometry;
  try {
    return switch (props["kind"]) {
      "incident" => MapFeature.incident(IncidentDto.fromJson(props).toDomain(geometry: geometry)),
      "shelter" => MapFeature.shelter(ShelterDto.fromJson(props).toDomain(geometry: geometry)),
      "alert" => MapFeature.alert(AlertDto.fromJson(props).toDomain(geometry: geometry)),
      _ => null,
    };
  } on Object catch (e) {
    // Jeden niepoprawny element nie może wyczyścić całej mapy.
    debugPrint("Pominięto Feature ${feature.id} (${props["kind"]}): $e");
    return null;
  }
}
