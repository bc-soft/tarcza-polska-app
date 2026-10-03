import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";

/// „Co robić” — procedury z backendu (szczegóły incydentu, ekran alertu).
class ProceduresSection extends StatelessWidget {
  const ProceduresSection({super.key, required this.procedures});

  final List<Procedure> procedures;

  @override
  Widget build(BuildContext context) {
    if (procedures.isEmpty) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(context.l10n.proceduresTitle),
        for (final (i, p) in procedures.indexed) ...[
          if (i > 0) const SizedBox(height: 10),
          TarczaCard(
            padding: EdgeInsets.zero,
            child: Theme(
              // Bez linii ExpansionTile — karta ma własny obrys.
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                initiallyExpanded: i == 0,
                leading: const Icon(Icons.checklist_rtl, color: TarczaPalette.primary),
                title: Text(p.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                subtitle: Text(p.summary),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final (n, step) in p.steps.indexed)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: TarczaPalette.primary.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${n + 1}",
                              style: const TextStyle(
                                color: TarczaPalette.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(child: Text(step)),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

/// Pionowa oś czasu incydentu (`label` gotowy po polsku z backendu).
class IncidentTimeline extends StatelessWidget {
  const IncidentTimeline({super.key, required this.entries});

  final List<IncidentTimelineEntry> entries;

  static IconData _icon(String type) => switch (type) {
    "created" => Icons.flag_outlined,
    "wave_started" || "wave_closed" => Icons.record_voice_over_outlined,
    "area_changed" => Icons.hexagon_outlined,
    "confidence_changed" => Icons.trending_up,
    "research_completed" => Icons.travel_explore,
    "source_added" => Icons.fact_check_outlined,
    "alert_published" => Icons.campaign_outlined,
    "photo_attached" => Icons.photo_camera_outlined,
    "resolved" => Icons.check_circle_outline,
    _ => Icons.circle_outlined,
  };

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(l10n.timelineTitle),
        TarczaCard(
          child: Column(
            children: [
              for (final (i, e) in entries.indexed)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: 32,
                        child: Column(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: TarczaPalette.primary.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(_icon(e.type), size: 16, color: TarczaPalette.primary),
                            ),
                            if (i < entries.length - 1)
                              const Expanded(
                                child: VerticalDivider(width: 2, thickness: 2),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: i < entries.length - 1 ? 14 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.label, style: const TextStyle(fontWeight: FontWeight.w600)),
                              Text(
                                Formatters.dateTime(e.at),
                                style: const TextStyle(
                                  color: TarczaPalette.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
