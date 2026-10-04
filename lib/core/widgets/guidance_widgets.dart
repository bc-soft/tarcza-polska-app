import "package:flutter/material.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
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
          _ProcedureTile(procedure: p, initiallyExpanded: i == 0),
        ],
      ],
    );
  }
}

/// Jedna procedura. Zwinięta pokazuje tytuł i jedną linię opisu — listę ma się dać przebiec
/// wzrokiem. Rozwinięta zastępuje przycięty opis pełnym i dokłada kroki, więc skrót
/// w nagłówku niczego nie gubi.
class _ProcedureTile extends StatefulWidget {
  const _ProcedureTile({required this.procedure, required this.initiallyExpanded});

  final Procedure procedure;
  final bool initiallyExpanded;

  @override
  State<_ProcedureTile> createState() => _ProcedureTileState();
}

class _ProcedureTileState extends State<_ProcedureTile> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final p = widget.procedure;
    return TarczaCard(
      padding: EdgeInsets.zero,
      child: Theme(
        // Bez linii ExpansionTile — karta ma własny obrys.
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded,
          onExpansionChanged: (value) => setState(() => _expanded = value),
          leading: const PanelIcon(
            icon: Icons.checklist_rtl,
            color: TarczaPalette.primary,
            size: 36,
            tinted: true,
          ),
          iconColor: TarczaPalette.textSecondary,
          collapsedIconColor: TarczaPalette.textMuted,
          title: Text(upper(p.title), style: TarczaFonts.heading(size: 16)),
          subtitle: _expanded
              ? null
              : Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    p.summary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: TarczaPalette.textSecondary, fontSize: 13),
                  ),
                ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              p.summary,
              style: const TextStyle(color: TarczaPalette.textSecondary, fontSize: 13.5),
            ),
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
                        color: tint(TarczaPalette.primary, 0.14),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: TarczaPalette.primary.withValues(alpha: 0.4)),
                      ),
                      child: Text(
                        "${n + 1}",
                        style: TarczaFonts.data(
                          size: 11,
                          bold: true,
                          color: TarczaPalette.primaryLight,
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
                                color: TarczaPalette.surfaceAlt,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: TarczaPalette.outlineStrong),
                              ),
                              child: Icon(
                                _icon(e.type),
                                size: 15,
                                color: TarczaPalette.primaryLight,
                              ),
                            ),
                            if (i < entries.length - 1)
                              const Expanded(
                                child: VerticalDivider(
                                  width: 2,
                                  thickness: 2,
                                  color: TarczaPalette.outline,
                                ),
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
                              Text(
                                e.label,
                                style: TarczaFonts.text(
                                  size: 14,
                                  weight: 600,
                                  color: TarczaPalette.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              DataText(
                                Formatters.dateTime(e.at),
                                size: 11,
                                color: TarczaPalette.textMuted,
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
