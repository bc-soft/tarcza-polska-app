import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Kompaktowa karta incydentu (mapa, listy). Tylko dane zagregowane.
class IncidentCard extends StatelessWidget {
  const IncidentCard({super.key, required this.incident, this.onTap, this.highlighted = false});

  final Incident incident;
  final VoidCallback? onTap;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forConfidence(incident.confidenceLevel);
    final agreement = incident.community.agreementPct;
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
                        incident.typeLabel,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      Formatters.relative(l10n, incident.lastActivityAt),
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: TarczaPalette.textSecondary),
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
                const SizedBox(height: 6),
                Text(
                  agreement != null
                      ? l10n.communityAgreement(agreement)
                      : "${incident.status.label(l10n)} · ${l10n.communityReports(incident.community.reports)}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
                ),
              ],
            ),
          ),
          if (onTap != null) const Icon(Icons.chevron_right, color: TarczaPalette.textSecondary),
        ],
      ),
    );
  }
}
