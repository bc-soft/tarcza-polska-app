import "package:flutter/material.dart";

import "package:tarcza_polska/data/models/enums.dart";

/// Paleta „command center” w wariancie jasnym — ta sama stylistyka co panel operatora
/// (siatka w tle, moduły z cienkim obrysem, czerwień sygnałowa jako jedyny mocny akcent),
/// tylko z odwróconymi wartościami jasności (`docs/07`).
abstract final class TarczaPalette {
  /// Czerwień sygnałowa — akcja główna, aktywna zakładka, marka.
  static const primary = Color(0xFFE11D2E);

  /// Ciemniejszy wariant czerwieni (naciśnięty przycisk, obrys).
  static const primaryDark = Color(0xFF9E1020);

  /// Czerwień do tekstu i ikon na jasnym tle — mocniejsza, żeby utrzymać kontrast.
  static const primaryLight = Color(0xFFC2142A);

  static const accentRed = Color(0xFFE11D2E);

  /// Tło ekranu — bardzo jasna szarość, z delikatną siatką (`GridBackground`).
  static const background = Color(0xFFF3F5F8);

  /// Karta / panel.
  static const surface = Color(0xFFFFFFFF);

  /// Element wewnątrz karty (kafelek liczby, pole formularza, pigułka).
  static const surfaceAlt = Color(0xFFF1F3F7);

  /// Element wyżej (bottom sheet, menu, pasek nawigacji).
  static const surfaceHigh = Color(0xFFFFFFFF);

  static const outline = Color(0xFFE1E5EC);
  static const outlineStrong = Color(0xFFC8CEDA);

  static const textPrimary = Color(0xFF161A21);
  static const textSecondary = Color(0xFF59616F);

  /// Etykiety wersalikowe („OTWARTE INCYDENTY”) — jeszcze ciszej niż `textSecondary`.
  static const textMuted = Color(0xFF858E9D);
  static const heading = Color(0xFF0B0E14);

  /// Linie siatki w tle ekranu.
  static const grid = Color(0xFFE6EAF0);

  // Confidence — jak w panelu operatora (`backend-specs.md` §5), przyciemnione pod jasne tło.
  static const unverified = Color(0xFF68748A);
  static const likely = Color(0xFFD97706);
  static const high = Color(0xFFEA580C);
  static const confirmed = Color(0xFFDC2626);

  static const success = Color(0xFF15803D);
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

/// Kolor statusu w wersji „do tekstu”: na jasnym tle przyciemniamy go, żeby etykieta na
/// delikatnym wypełnieniu (patrz [tint]) miała kontrast.
Color readable(Color c, [double amount = 0.22]) => Color.lerp(c, Colors.black, amount)!;

/// Delikatne wypełnienie w kolorze statusu (odznaka, ikona w ramce).
Color tint(Color c, [double alpha = 0.12]) => c.withValues(alpha: alpha);
