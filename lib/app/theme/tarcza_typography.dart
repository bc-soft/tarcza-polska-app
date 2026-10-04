import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";

/// Typografia panelu operatora:
/// * **Barlow Condensed ExtraBold** — nagłówki wersalikami, ciężkie i zwężone,
/// * **Inter** — tekst interfejsu,
/// * **IBM Plex Mono** — dane techniczne (identyfikatory, komórki H3, czasy).
///
/// Inter jest fontem zmiennym — jego grubość ustawiamy osią `wght` (`fontVariations`), bo
/// samo `fontWeight` podstawiłoby jeden krój dla wszystkich grubości. Barlow Condensed i
/// IBM Plex Mono mają osobne pliki na grubość, więc tam wystarczy `fontWeight`.
abstract final class TarczaFonts {
  static const display = "BarlowCondensed";
  static const body = "Inter";
  static const mono = "IBMPlexMono";

  /// Nagłówek ekranu: „MAPA SYTUACYJNA”, „BRAK WODY”. Zawsze wersalikami (patrz [upper]).
  static TextStyle heading({
    required double size,
    double weight = 800,
    Color color = TarczaPalette.heading,
    double letterSpacing = 0.4,
    double height = 1.08,
  }) => TextStyle(
    fontFamily: display,
    fontWeight: _nearest(weight),
    fontSize: size,
    height: height,
    letterSpacing: letterSpacing,
    color: color,
  );

  /// Tekst interfejsu.
  static TextStyle text({
    required double size,
    double weight = 400,
    Color? color,
    double height = 1.45,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: body,
    fontVariations: [FontVariation("wght", weight)],
    fontWeight: _nearest(weight),
    fontSize: size,
    height: height,
    letterSpacing: letterSpacing,
    color: color,
  );

  /// Mała etykieta wersalikami z szeroką spacją — „OTWARTE INCYDENTY”, „ZGŁOSZEŃ”.
  static TextStyle label({
    double size = 11,
    double weight = 600,
    Color color = TarczaPalette.textMuted,
  }) => TextStyle(
    fontFamily: body,
    fontVariations: [FontVariation("wght", weight)],
    fontWeight: _nearest(weight),
    fontSize: size,
    height: 1.2,
    letterSpacing: 1.1,
    color: color,
  );

  /// Dane techniczne: `01A10320`, `891e24a14cffff`, `13:57 02.10`.
  static TextStyle data({
    double size = 12,
    bool bold = false,
    Color color = TarczaPalette.textSecondary,
    double letterSpacing = 0.2,
  }) => TextStyle(
    fontFamily: mono,
    fontWeight: bold ? FontWeight.w600 : FontWeight.w500,
    fontSize: size,
    height: 1.3,
    letterSpacing: letterSpacing,
    color: color,
  );

  /// Duża liczba na kafelku („15”, „469”, „90%”).
  static TextStyle metric({double size = 30, Color color = TarczaPalette.heading}) =>
      heading(size: size, letterSpacing: 0, color: color);

  static FontWeight _nearest(double w) => switch (w) {
    <= 350 => FontWeight.w300,
    <= 450 => FontWeight.w400,
    <= 550 => FontWeight.w500,
    <= 650 => FontWeight.w600,
    <= 750 => FontWeight.w700,
    <= 850 => FontWeight.w800,
    _ => FontWeight.w900,
  };
}

/// Nagłówki i etykiety w panelu są wersalikami. Polskie znaki `toUpperCase()` obsługuje
/// poprawnie, ale wymaga locale — stąd jawne `pl`.
String upper(String text) => text.toUpperCase();
