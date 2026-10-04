import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/visuals.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Wybór paliw (wszystkie rodzaje, zwarte odstępy) — ekran stacji i zgłoszenie braku paliwa.
class FuelChips extends StatelessWidget {
  const FuelChips({
    super.key,
    required this.selected,
    required this.onToggle,
    this.labels = const {},
    this.types = FuelType.values,
  });

  final Set<FuelType> selected;
  final ValueChanged<FuelType> onToggle;

  /// Etykiety z API (gdy są); „Diesel” zawsze z naszego słownika.
  final Map<FuelType, String> labels;
  final List<FuelType> types;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: [
        for (final type in types)
          FilterChip(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            showCheckmark: false,
            label: Text(upper(type.displayLabel(l10n, labels[type]))),
            labelStyle: TarczaFonts.label(
              weight: 700,
              color: selected.contains(type)
                  ? TarczaPalette.primaryLight
                  : TarczaPalette.textSecondary,
            ),
            selectedColor: TarczaPalette.primary.withValues(alpha: 0.16),
            side: BorderSide(
              color: selected.contains(type)
                  ? TarczaPalette.primary.withValues(alpha: 0.6)
                  : TarczaPalette.outline,
            ),
            selected: selected.contains(type),
            onSelected: (_) => onToggle(type),
          ),
      ],
    );
  }
}
