import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/panel_widgets.dart";
import "package:tarcza_polska/core/widgets/visuals.dart";
import "package:tarcza_polska/data/models/enums.dart";

export "fuel_chips.dart";
export "panel_widgets.dart";
export "tarcza_app_bar.dart";
export "visuals.dart";

/// Panel: ciemna karta z cienkim obrysem (bez cienia — jak moduły w Command Center).
class TarczaCard extends StatelessWidget {
  const TarczaCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.accent,
    this.title,
    this.titleIcon,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  /// Kolorowy pasek po lewej (np. kolor confidence).
  final Color? accent;

  /// Nagłówek sekcji wersalikami wewnątrz karty.
  final String? title;
  final IconData? titleIcon;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: padding,
      child: title == null
          ? child
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [PanelSectionTitle(title!, icon: titleIcon), child],
            ),
    );
    if (accent != null) {
      content = IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 3, color: accent),
            Expanded(child: content),
          ],
        ),
      );
    }
    return Card(
      clipBehavior: Clip.antiAlias,
      child: onTap == null
          ? content
          : InkWell(
              onTap: onTap,
              highlightColor: TarczaPalette.primary.withValues(alpha: 0.06),
              child: content,
            ),
    );
  }
}

/// Status zawsze jako ikona + tekst (nie tylko kolor — dostępność).
/// Forma odznaki z panelu: prostokąt wersalikami, nie owalna „pigułka”.
class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.label,
    required this.color,
    required this.icon,
    this.dense = false,
    this.filled = false,
  });

  final String label;
  final Color color;
  final IconData icon;
  final bool dense;
  final bool filled;

  @override
  Widget build(BuildContext context) =>
      PanelBadge(label: label, color: color, icon: icon, dense: dense, filled: filled);
}

/// `confidenceLabel` z backendu + `confidenceScore` jako procent.
class ConfidenceBadge extends StatelessWidget {
  const ConfidenceBadge({
    super.key,
    required this.level,
    required this.label,
    this.score,
    this.dense = false,
  });

  final ConfidenceLevel level;
  final String label;
  final double? score;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final text = score == null
        ? label
        : "$label · ${context.l10n.confidencePercent(Formatters.percent(score!))}";
    return StatusChip(
      label: text,
      color: context.statusColors.forConfidence(level),
      icon: level.icon,
      dense: dense,
      // Potwierdzone = najmocniejszy sygnał, pełne wypełnienie jak w panelu.
      filled: level == ConfidenceLevel.confirmed,
    );
  }
}

/// Wiersz listy: kwadratowa ikona w ramce, tytuł, podtytuł, strzałka.
class ListTileRow extends StatelessWidget {
  const ListTileRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.trailing,
    this.iconColor,
    this.tinted = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;

  /// Ikona w kolorze statusu (tło + obrys), zamiast neutralnej.
  final bool tinted;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        children: [
          PanelIcon(
            icon: icon,
            color: iconColor ?? TarczaPalette.textSecondary,
            tinted: tinted || iconColor != null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
                  ),
                ],
              ],
            ),
          ),
          trailing ??
              (onTap == null
                  ? const SizedBox.shrink()
                  : const Icon(Icons.chevron_right, size: 20, color: TarczaPalette.textMuted)),
        ],
      ),
    ),
  );
}

class SectionHeader extends StatelessWidget {
  const SectionHeader(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(2, 22, 2, 10),
    child: Row(
      children: [
        Container(width: 3, height: 12, color: TarczaPalette.primary),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            upper(text),
            style: TarczaFonts.label(weight: 700, color: TarczaPalette.textSecondary),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(child: Divider(color: TarczaPalette.outline)),
      ],
    ),
  );
}

/// Przycisk główny pełnej szerokości ze stanem ładowania.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => FilledButton(
    onPressed: loading ? null : onPressed,
    child: loading
        ? const SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[Icon(icon, size: 19), const SizedBox(width: 9)],
              Flexible(child: Text(upper(label), textAlign: TextAlign.center)),
            ],
          ),
  );
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({super.key, required this.label, required this.onPressed, this.icon});

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onPressed,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[Icon(icon, size: 19), const SizedBox(width: 9)],
        Flexible(child: Text(upper(label), textAlign: TextAlign.center)),
      ],
    ),
  );
}

/// Pełnoekranowy komunikat (sukces / potwierdzenie) z dużą ikoną.
class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
    required this.icon,
    required this.title,
    this.body,
    this.color = TarczaPalette.success,
    this.actions = const [],
    this.extra,
  });

  final IconData icon;
  final String title;
  final String? body;
  final Color color;
  final List<Widget> actions;
  final Widget? extra;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        const Spacer(),
        Container(
          width: 92,
          height: 92,
          decoration: BoxDecoration(
            color: tint(color),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: 0.45), width: 1.5),
          ),
          child: Icon(icon, size: 46, color: readable(color, 0.15)),
        ),
        const SizedBox(height: 26),
        DisplayHeading(title, size: 26),
        if (body != null) ...[
          const SizedBox(height: 12),
          Text(
            body!,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: TarczaPalette.textSecondary),
          ),
        ],
        if (extra != null) ...[const SizedBox(height: 20), extra!],
        const Spacer(),
        for (final action in actions) ...[action, const SizedBox(height: 12)],
      ],
    ),
  );
}

/// Błąd z przyciskiem ponowienia.
class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message, this.onRetry});

  final String message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PanelIcon(icon: Icons.cloud_off_outlined, size: 56),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: TarczaPalette.textSecondary),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 18),
            SecondaryButton(label: context.l10n.commonRetry, onPressed: onRetry),
          ],
        ],
      ),
    ),
  );
}

/// Ikona typu incydentu w kolorze confidence.
class IncidentAvatar extends StatelessWidget {
  const IncidentAvatar({super.key, required this.type, required this.level, this.size = 44});

  final IncidentType type;
  final ConfidenceLevel level;
  final double size;

  @override
  Widget build(BuildContext context) => PanelIcon(
    icon: type.icon,
    color: context.statusColors.forConfidence(level),
    size: size,
    tinted: true,
  );
}

/// Para etykieta–wartość w kartach szczegółów. Etykieta wersalikami, wartość po prawej.
class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.label, required this.value, this.mono = false});

  final String label;
  final String value;

  /// Wartość techniczna (identyfikator, komórka H3, czas) — czcionka monospace.
  final bool mono;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(upper(label), style: TarczaFonts.label(size: 10.5)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: mono
              ? DataText(value, size: 12.5, color: TarczaPalette.textPrimary, bold: true)
              : Text(
                  value,
                  style: TarczaFonts.text(
                    size: 14,
                    weight: 600,
                    color: TarczaPalette.textPrimary,
                  ),
                ),
        ),
      ],
    ),
  );
}

/// Separator w stylu panelu — cienka linia o pełnej szerokości karty.
class PanelDivider extends StatelessWidget {
  const PanelDivider({super.key, this.height = 24});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: const Center(child: Divider(color: TarczaPalette.outline)),
  );
}

/// Stały, powtarzalny rozmiar zaokrąglenia dla elementów spoza `ThemeData`.
const panelRadius = AppTheme.radius;
