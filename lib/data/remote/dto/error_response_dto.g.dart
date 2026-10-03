// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseDto _$ErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    ErrorResponseDto(
      error: ErrorDetailDto.fromJson(json['error'] as Map<String, dynamic>),
    );

ErrorDetailDto _$ErrorDetailDtoFromJson(Map<String, dynamic> json) =>
    ErrorDetailDto(
      code: json['code'] as String,
      message: json['message'] as String?,
      retryAfter: (json['retryAfter'] as num?)?.toInt(),
      violations:
          (json['violations'] as List<dynamic>?)
              ?.map(
                (e) => ErrorViolationDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

ErrorViolationDto _$ErrorViolationDtoFromJson(Map<String, dynamic> json) =>
    ErrorViolationDto(
      field: json['field'] as String,
      message: json['message'] as String,
    );
