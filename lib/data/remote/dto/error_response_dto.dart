import "package:json_annotation/json_annotation.dart";

part "error_response_dto.g.dart";

/// Koperta błędów `ErrorResponse` (`openapi.json` 1.1.0). `swagger_parser` nie generuje
/// schematów używanych tylko w odpowiedziach 4xx, więc parsujemy ją ręcznie.
@JsonSerializable(createToJson: false)
class ErrorResponseDto {
  const ErrorResponseDto({required this.error});

  factory ErrorResponseDto.fromJson(Map<String, dynamic> json) => _$ErrorResponseDtoFromJson(json);

  final ErrorDetailDto error;
}

@JsonSerializable(createToJson: false)
class ErrorDetailDto {
  const ErrorDetailDto({
    required this.code,
    this.message,
    this.retryAfter,
    this.violations = const [],
  });

  factory ErrorDetailDto.fromJson(Map<String, dynamic> json) => _$ErrorDetailDtoFromJson(json);

  /// Np. `validation_failed`, `token_expired`, `verification_expired`, `too_many_requests`.
  final String code;
  final String? message;

  /// Sekundy do odblokowania przy 429 (to samo co nagłówek `Retry-After`).
  final int? retryAfter;
  final List<ErrorViolationDto> violations;
}

@JsonSerializable(createToJson: false)
class ErrorViolationDto {
  const ErrorViolationDto({required this.field, required this.message});

  factory ErrorViolationDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorViolationDtoFromJson(json);

  final String field;
  final String message;
}
