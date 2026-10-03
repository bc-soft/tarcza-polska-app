// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityDto _$CommunityDtoFromJson(Map<String, dynamic> json) => CommunityDto(
  reports: (json['reports'] as num?)?.toInt() ?? 0,
  answers: (json['answers'] as num?)?.toInt() ?? 0,
  agreementPct: json['agreementPct'] as num?,
);

IncidentDto _$IncidentDtoFromJson(Map<String, dynamic> json) => IncidentDto(
  id: json['id'] as String,
  type: json['type'] as String,
  typeLabel: json['typeLabel'] as String?,
  status: json['status'] as String,
  confidenceLevel: json['confidenceLevel'] as String,
  confidenceLabel: json['confidenceLabel'] as String?,
  confidenceScore: json['confidenceScore'] as num? ?? 0,
  startedAt: DateTime.parse(json['startedAt'] as String),
  lastActivityAt: json['lastActivityAt'] == null
      ? null
      : DateTime.parse(json['lastActivityAt'] as String),
  lastConfirmedAt: json['lastConfirmedAt'] == null
      ? null
      : DateTime.parse(json['lastConfirmedAt'] as String),
  community: json['community'] == null
      ? null
      : CommunityDto.fromJson(json['community'] as Map<String, dynamic>),
  summary: json['summary'] as String?,
  area: json['area'] == null
      ? null
      : GeometryDto.fromJson(json['area'] as Map<String, dynamic>),
);

ShelterDto _$ShelterDtoFromJson(Map<String, dynamic> json) => ShelterDto(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String?,
  location: json['location'] == null
      ? null
      : GeometryDto.fromJson(json['location'] as Map<String, dynamic>),
  status: json['status'] as String,
  statusLabel: json['statusLabel'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  lastConfirmedAt: json['lastConfirmedAt'] == null
      ? null
      : DateTime.parse(json['lastConfirmedAt'] as String),
  confirmationCount: (json['confirmationCount'] as num?)?.toInt() ?? 0,
  distanceMeters: json['distanceMeters'] as num?,
);

AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => AlertDto(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  severity: json['severity'] as String,
  incidentId: json['incidentId'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  active: json['active'] as bool? ?? true,
  area: json['area'] == null
      ? null
      : GeometryDto.fromJson(json['area'] as Map<String, dynamic>),
);

VerificationQuestionDto _$VerificationQuestionDtoFromJson(
  Map<String, dynamic> json,
) => VerificationQuestionDto(
  verificationId: json['verificationId'] as String,
  incidentId: json['incidentId'] as String,
  type: json['type'] as String,
  typeLabel: json['typeLabel'] as String?,
  question: json['question'] as String,
  context: json['context'] as String,
  options:
      (json['options'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const ["yes", "no", "unknown"],
  sentAt: DateTime.parse(json['sentAt'] as String),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  answered: json['answered'] as bool? ?? false,
);

VerificationResultDto _$VerificationResultDtoFromJson(
  Map<String, dynamic> json,
) => VerificationResultDto(
  verificationId: json['verificationId'] as String,
  incidentId: json['incidentId'] as String,
  thanks: json['thanks'] as String,
);

ReportTypeDto _$ReportTypeDtoFromJson(Map<String, dynamic> json) =>
    ReportTypeDto(
      value: json['value'] as String,
      label: json['label'] as String,
    );

ReportReceiptDto _$ReportReceiptDtoFromJson(Map<String, dynamic> json) =>
    ReportReceiptDto(
      reportId: json['reportId'] as String,
      h3Cell: json['h3Cell'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

ReportIncidentRefDto _$ReportIncidentRefDtoFromJson(
  Map<String, dynamic> json,
) => ReportIncidentRefDto(
  id: json['id'] as String,
  status: json['status'] as String,
  confidenceLevel: json['confidenceLevel'] as String,
  confidenceScore: json['confidenceScore'] as num? ?? 0,
);

ReportStatusDto _$ReportStatusDtoFromJson(Map<String, dynamic> json) =>
    ReportStatusDto(
      reportId: json['reportId'] as String,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      incident: json['incident'] == null
          ? null
          : ReportIncidentRefDto.fromJson(
              json['incident'] as Map<String, dynamic>,
            ),
    );

DeviceProfileDto _$DeviceProfileDtoFromJson(Map<String, dynamic> json) =>
    DeviceProfileDto(
      deviceId: json['deviceId'] as String,
      platform: json['platform'] as String?,
      hasPushToken: json['hasPushToken'] as bool? ?? false,
      lastLocation: json['lastLocation'] == null
          ? null
          : GeometryDto.fromJson(json['lastLocation'] as Map<String, dynamic>),
      h3Cell: json['h3Cell'] as String?,
      locationUpdatedAt: json['locationUpdatedAt'] == null
          ? null
          : DateTime.parse(json['locationUpdatedAt'] as String),
    );

LocationUpdateDto _$LocationUpdateDtoFromJson(Map<String, dynamic> json) =>
    LocationUpdateDto(h3Cell: json['h3Cell'] as String?);

ErrorResponseDto _$ErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    ErrorResponseDto(
      error: ErrorBodyDto.fromJson(json['error'] as Map<String, dynamic>),
    );

ErrorBodyDto _$ErrorBodyDtoFromJson(Map<String, dynamic> json) => ErrorBodyDto(
  code: json['code'] as String,
  message: json['message'] as String?,
  violations:
      (json['violations'] as List<dynamic>?)
          ?.map((e) => ViolationDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

ViolationDto _$ViolationDtoFromJson(Map<String, dynamic> json) => ViolationDto(
  field: json['field'] as String,
  message: json['message'] as String,
);
