import "package:flutter/material.dart";

import "package:tarcza_polska/data/models/enums.dart";

/// Paleta w duchu mObywatela (`docs/07`). Inspiracja stylem, bez logo i godła.
abstract final class TarczaPalette {
  static const primary = Color(0xFF0052A5);
  static const primaryDark = Color(0xFF003B7A);
  static const accentRed = Color(0xFFDC143C);
  static const background = Color(0xFFF5F6F8);
  static const surface = Colors.white;
  static const outline = Color(0xFFE1E5EB);
  static const textPrimary = Color(0xFF1B2330);
  static const textSecondary = Color(0xFF5B6575);
  static const heading = Color(0xFF0B2A55);

  // Confidence — jak w panelu operatora (`backend-specs.md` §5).
  static const unverified = Color(0xFF64748B);
  static const likely = Color(0xFFF59E0B);
  static const high = Color(0xFFF97316);
  static const confirmed = Color(0xFFEF4444);

  static const success = Color(0xFF16A34A);
  static const info = Color(0xFF2563EB);
}

/// Kolory statusów jako `ThemeExtension` — widgety nie znają heksów.
@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({
    required this.confidence,
    required this.shelter,
    required this.severity,
  });

  static const light = StatusColors(
    confidence: {
      ConfidenceLevel.unverified: TarczaPalette.unverified,
      ConfidenceLevel.likely: TarczaPalette.likely,
      ConfidenceLevel.high: TarczaPalette.high,
      ConfidenceLevel.confirmed: TarczaPalette.confirmed,
    },
    shelter: {
      ShelterStatus.open: TarczaPalette.success,
      ShelterStatus.full: TarczaPalette.likely,
      ShelterStatus.closed: TarczaPalette.confirmed,
      ShelterStatus.unknown: TarczaPalette.unverified,
    },
    severity: {
      AlertSeverity.info: TarczaPalette.info,
      AlertSeverity.warning: TarczaPalette.likely,
      AlertSeverity.danger: TarczaPalette.accentRed,
    },
  );

  final Map<ConfidenceLevel, Color> confidence;
  final Map<ShelterStatus, Color> shelter;
  final Map<AlertSeverity, Color> severity;

  Color forConfidence(ConfidenceLevel level) => confidence[level]!;

  Color forShelter(ShelterStatus status) => shelter[status]!;

  Color forSeverity(AlertSeverity severity) => this.severity[severity]!;

  @override
  StatusColors copyWith({
    Map<ConfidenceLevel, Color>? confidence,
    Map<ShelterStatus, Color>? shelter,
    Map<AlertSeverity, Color>? severity,
  }) => StatusColors(
    confidence: confidence ?? this.confidence,
    shelter: shelter ?? this.shelter,
    severity: severity ?? this.severity,
  );

  @override
  StatusColors lerp(StatusColors? other, double t) => t < 0.5 ? this : (other ?? this);
}

extension StatusColorsContext on BuildContext {
  StatusColors get statusColors => Theme.of(this).extension<StatusColors>() ?? StatusColors.light;
}
