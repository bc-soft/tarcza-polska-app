import "dart:math" as math;

import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";

/// Delikatna siatka w tle ekranu — ten sam motyw co tło panelu operatora.
/// Rysowana raz w `CustomPainter`, bez kosztu układu.
class GridBackground extends StatelessWidget {
  const GridBackground({super.key, this.child, this.step = 44});

  final Widget? child;
  final double step;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _GridPainter(step),
    isComplex: true,
    child: child,
  );
}

class _GridPainter extends CustomPainter {
  const _GridPainter(this.step);

  final double step;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = TarczaPalette.grid
      ..strokeWidth = 1;
    for (var x = 0.0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (var y = 0.0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) => oldDelegate.step != step;
}

/// Tło aplikacji: kolor + siatka. `Scaffold` jest przezroczysty, więc każda trasa musi
/// leżeć na tym podkładzie — także trasa `OpenContainer`, która jest przezroczysta i sama
/// przyciemnia to, co pod nią (bez podkładu strona wyglądałaby na przygaszoną).
class PanelBackdrop extends StatelessWidget {
  const PanelBackdrop({super.key, required this.child});

  /// `MaterialApp.builder` dostaje `Widget?`, stąd typ dopuszczający brak dziecka.
  final Widget? child;

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: TarczaPalette.background,
    child: GridBackground(child: child),
  );
}

/// Nadtytuł znad nagłówka: kropka sygnałowa + etykieta wersalikami
/// („• COMMAND CENTER”, „• INCYDENT · 01A10320”).
class Eyebrow extends StatelessWidget {
  const Eyebrow(this.text, {super.key, this.color = TarczaPalette.primary, this.trailing});

  final String text;
  final Color color;

  /// Np. identyfikator pisany czcionką monospace.
  final String? trailing;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 6,
        height: 6,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      Flexible(
        child: Text(
          upper(text),
          overflow: TextOverflow.ellipsis,
          style: TarczaFonts.label(weight: 700, color: color),
        ),
      ),
      if (trailing != null) ...[
        Text("  ·  ", style: TarczaFonts.label()),
        Text(
          trailing!,
          style: TarczaFonts.data(size: 11, bold: true),
        ),
      ],
    ],
  );
}

/// Nagłówek ekranu wersalikami — jak „MAPA SYTUACYJNA” w panelu.
class DisplayHeading extends StatelessWidget {
  const DisplayHeading(
    this.text, {
    super.key,
    this.size = 30,
    this.color = TarczaPalette.heading,
    this.maxLines = 2,
  });

  final String text;
  final double size;
  final Color color;
  final int maxLines;

  @override
  Widget build(BuildContext context) => Text(
    upper(text),
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
    style: TarczaFonts.heading(size: size, color: color),
  );
}

/// Nagłówek ekranu z nadtytułem — wspólny blok dla ekranów listowych i szczegółów.
class PanelHeader extends StatelessWidget {
  const PanelHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.eyebrowColor = TarczaPalette.primary,
    this.eyebrowTrailing,
    this.titleSize = 26,
    this.trailing,
  });

  final String eyebrow;
  final String title;
  final Color eyebrowColor;
  final String? eyebrowTrailing;
  final double titleSize;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Eyebrow(eyebrow, color: eyebrowColor, trailing: eyebrowTrailing),
            const SizedBox(height: 6),
            DisplayHeading(title, size: titleSize),
          ],
        ),
      ),
      if (trailing != null) ...[const SizedBox(width: 12), trailing!],
    ],
  );
}

/// Kafelek liczby: mała etykieta wersalikami nad dużą wartością („OTWARTE INCYDENTY / 15”).
class StatTile extends StatelessWidget {
  const StatTile({
    super.key,
    required this.label,
    required this.value,
    this.caption,
    this.valueColor = TarczaPalette.heading,
    this.valueSize = 26,
    this.compact = false,
  });

  final String label;
  final String value;
  final String? caption;
  final Color valueColor;
  final double valueSize;
  final bool compact;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: compact ? 10 : 14, vertical: compact ? 10 : 12),
    decoration: BoxDecoration(
      color: TarczaPalette.surfaceAlt,
      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      border: Border.all(color: TarczaPalette.outline),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          upper(label),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TarczaFonts.label(size: compact ? 9.5 : 10.5),
        ),
        SizedBox(height: compact ? 4 : 8),
        Text(
          value,
          maxLines: 1,
          style: TarczaFonts.metric(size: valueSize, color: valueColor),
        ),
        if (caption != null) ...[
          const SizedBox(height: 4),
          Text(
            caption!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TarczaFonts.text(size: 11, color: TarczaPalette.textMuted),
          ),
        ],
      ],
    ),
  );
}

/// Cienki pasek wskaźnika (wiarygodność, postęp) — jak pod procentem w panelu.
class MeterBar extends StatelessWidget {
  const MeterBar({
    super.key,
    required this.value,
    required this.color,
    this.height = 6,
    this.animate = true,
  });

  /// 0..1.
  final double value;
  final Color color;
  final double height;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final clamped = value.clamp(0.0, 1.0);
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: Container(
        height: height,
        color: TarczaPalette.surfaceAlt,
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: math.max(clamped, 0.015),
            // `ColoredBox`/`Container` bez dziecka przyjmują `constraints.smallest` —
            // na tej wysokości to zero, więc wypełnienie byłoby niewidoczne mimo
            // poprawnej szerokości. `SizedBox.expand` wymusza zajęcie całej komórki.
            child: SizedBox.expand(
              child: animate
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOut,
                      decoration: BoxDecoration(
                        color: color,
                        boxShadow: [
                          BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 6),
                        ],
                      ),
                    )
                  : ColoredBox(color: color),
            ),
          ),
        ),
      ),
    );
  }
}

/// Prostokątna odznaka wersalikami („AKTYWNY”, „POTWIERDZONE”). `filled` = pełne tło
/// (najmocniejszy sygnał), domyślnie przezroczyste tło z obrysem.
class PanelBadge extends StatelessWidget {
  const PanelBadge({
    super.key,
    required this.label,
    required this.color,
    this.filled = false,
    this.icon,
    this.dense = false,
  });

  final String label;
  final Color color;
  final bool filled;
  final IconData? icon;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final fg = filled ? Colors.white : readable(color, 0.3);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: dense ? 7 : 9, vertical: dense ? 3 : 5),
      decoration: BoxDecoration(
        color: filled ? color : tint(color),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: filled ? color : color.withValues(alpha: 0.45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: dense ? 11 : 13, color: fg),
            const SizedBox(width: 5),
          ],
          Flexible(
            child: Text(
              upper(label),
              overflow: TextOverflow.ellipsis,
              style: TarczaFonts.label(size: dense ? 9.5 : 10.5, weight: 700, color: fg),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dane techniczne czcionką monospace (identyfikator incydentu, komórka H3, czas).
class DataText extends StatelessWidget {
  const DataText(
    this.text, {
    super.key,
    this.size = 12,
    this.color = TarczaPalette.textSecondary,
    this.bold = false,
  });

  final String text;
  final double size;
  final Color color;
  final bool bold;

  @override
  Widget build(BuildContext context) => Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: TarczaFonts.data(size: size, bold: bold, color: color),
  );
}

/// Nagłówek sekcji wewnątrz karty — wersaliki z cienką linią pod spodem.
class PanelSectionTitle extends StatelessWidget {
  const PanelSectionTitle(this.text, {super.key, this.icon, this.trailing});

  final String text;
  final IconData? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 15, color: TarczaPalette.primary),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            upper(text),
            style: TarczaFonts.label(size: 12, weight: 700, color: TarczaPalette.textPrimary),
          ),
        ),
        ?trailing,
      ],
    ),
  );
}

/// Kwadratowa ikona w ramce — zamiast kolorowych kółek z wersji jasnej.
class PanelIcon extends StatelessWidget {
  const PanelIcon({
    super.key,
    required this.icon,
    this.color = TarczaPalette.textSecondary,
    this.size = 40,
    this.tinted = false,
  });

  final IconData icon;
  final Color color;
  final double size;

  /// `true` = tło i obrys w kolorze ikony (status), `false` = neutralne.
  final bool tinted;

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: tinted ? tint(color, 0.14) : TarczaPalette.surfaceAlt,
      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      border: Border.all(
        color: tinted ? color.withValues(alpha: 0.38) : TarczaPalette.outline,
      ),
    ),
    child: Icon(icon, size: size * 0.5, color: tinted ? readable(color, 0.2) : color),
  );
}
