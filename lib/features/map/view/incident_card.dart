import "package:animations/animations.dart";
import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/incident/view/incident_page.dart";

/// Kompaktowa karta incydentu (mapa, listy): typ, czas, wiarygodność. Tylko dane zagregowane.
class IncidentCard extends StatelessWidget {
  const IncidentCard({super.key, required this.incident, this.onTap});

  final Incident incident;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forConfidence(incident.confidenceLevel);
    return TarczaCard(
      onTap: onTap,
      accent: color,
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      child: Row(
        children: [
          IncidentAvatar(type: incident.type, level: incident.confidenceLevel),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        // Incydent punktowy: od razu widać, której stacji / schronu dotyczy.
                        incident.poi == null
                            ? incident.typeLabel
                            : "${incident.typeLabel} · ${incident.poi!.name}",
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    DataText(
                      Formatters.relative(l10n, incident.lastActivityAt),
                      size: 11,
                      color: TarczaPalette.textMuted,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ConfidenceBadge(
                  level: incident.confidenceLevel,
                  label: incident.confidenceLabel,
                  score: incident.confidenceScore,
                  dense: true,
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: TarczaPalette.textMuted),
        ],
      ),
    );
  }
}

/// Karta, która rozwija się w ekran szczegółów (Material „container transform”).
/// Ekran otwierany na głównym nawigatorze — nad dolnym paskiem, jak trasa `/incident/:id`.
class IncidentOpenContainer extends StatelessWidget {
  const IncidentOpenContainer({
    super.key,
    required this.incident,
    this.onOpen,
    this.elevation = 0,
  });

  final Incident incident;
  final VoidCallback? onOpen;
  final double elevation;

  @override
  Widget build(BuildContext context) => OpenContainer<void>(
    useRootNavigator: true,
    transitionDuration: const Duration(milliseconds: 420),
    closedElevation: elevation,
    openColor: Colors.transparent,
    middleColor: TarczaPalette.background,
    closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTheme.radius)),
    tappable: false,
    closedBuilder: (context, open) => IncidentCard(
      incident: incident,
      onTap: () {
        onOpen?.call();
        open();
      },
    ),
    openBuilder: (context, _) => PanelBackdrop(
      child: IncidentPage(incidentId: incident.id, initial: incident),
    ),
  );
}
