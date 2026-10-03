import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/incident/bloc/incident_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";

class IncidentPage extends StatelessWidget {
  const IncidentPage({super.key, required this.incidentId});

  final String incidentId;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => IncidentCubit(repository: getIt(), incidentId: incidentId)..load(),
    child: const IncidentView(),
  );
}

class IncidentView extends StatelessWidget {
  const IncidentView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.incidentTitle)),
      body: BlocBuilder<IncidentCubit, IncidentState>(
        builder: (context, state) {
          final incident = state.incident;
          if (incident == null) {
            if (state.loading) return const Center(child: CircularProgressIndicator());
            return ErrorView(
              message: Formatters.failure(l10n, state.failure ?? Exception()),
              onRetry: context.read<IncidentCubit>().load,
            );
          }
          return RefreshIndicator(
            onRefresh: context.read<IncidentCubit>().load,
            child: _IncidentDetails(incident: incident),
          );
        },
      ),
    );
  }
}

class _IncidentDetails extends StatelessWidget {
  const _IncidentDetails({required this.incident});

  final Incident incident;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forConfidence(incident.confidenceLevel);
    final community = incident.community;
    final percent = Formatters.percent(incident.confidenceScore);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        TarczaCard(
          accent: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IncidentAvatar(type: incident.type, level: incident.confidenceLevel, size: 52),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(incident.typeLabel, style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 4),
                        Text(
                          incident.status.label(l10n),
                          style: const TextStyle(color: TarczaPalette.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (incident.summary != null) ...[
                const SizedBox(height: 14),
                Text(incident.summary!, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ],
          ),
        ),
        SectionHeader(l10n.incidentConfidence),
        TarczaCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ConfidenceBadge(level: incident.confidenceLevel, label: incident.confidenceLabel),
                  const Spacer(),
                  TweenAnimationBuilder<double>(
                    tween: Tween(end: incident.confidenceScore),
                    duration: const Duration(milliseconds: 700),
                    builder: (context, value, _) => Text(
                      l10n.confidencePercent(Formatters.percent(value)),
                      style:
                          Theme.of(
                                context,
                              ).textTheme.headlineSmall
                              ?.copyWith(color: Color.lerp(color, Colors.black, 0.2)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              TweenAnimationBuilder<double>(
                tween: Tween(end: incident.confidenceScore),
                duration: const Duration(milliseconds: 700),
                builder: (context, value, _) => ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: value,
                    minHeight: 10,
                    color: color,
                    backgroundColor: TarczaPalette.outline,
                    semanticsLabel: l10n.incidentConfidence,
                    semanticsValue: "$percent%",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                incident.confidenceLevel.hint(l10n),
                style: const TextStyle(color: TarczaPalette.textSecondary),
              ),
            ],
          ),
        ),
        SectionHeader(l10n.incidentCommunity),
        TarczaCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                community.agreementPct != null
                    ? l10n.communityAgreement(community.agreementPct!)
                    : l10n.communityNoAnswers,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 6),
              Text(
                "${l10n.communityReports(community.reports)} · ${l10n.communityAnswers(community.answers)}",
                style: const TextStyle(color: TarczaPalette.textSecondary),
              ),
            ],
          ),
        ),
        SectionHeader(l10n.incidentArea),
        _AreaPreview(incident: incident, color: color),
        const SizedBox(height: 8),
        Text(
          incident.area is GeoPolygonArea ? l10n.incidentAreaPolygon : l10n.incidentAreaPoint,
          style: const TextStyle(color: TarczaPalette.textSecondary),
        ),
        const SizedBox(height: 12),
        TarczaCard(
          child: Column(
            children: [
              InfoRow(label: l10n.incidentStarted, value: Formatters.dateTime(incident.startedAt)),
              InfoRow(
                label: l10n.incidentLastActivity,
                value: Formatters.relative(l10n, incident.lastActivityAt),
              ),
              if (incident.lastConfirmedAt != null)
                InfoRow(
                  label: l10n.incidentLastConfirmed,
                  value: Formatters.relative(l10n, incident.lastConfirmedAt!),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          icon: Icons.map_outlined,
          label: l10n.incidentShowOnMap,
          onPressed: () {
            context.read<MapBloc>().add(
              MapFocusRequested(incident.area.outlinePoints, selectIncidentId: incident.id),
            );
            context.go(AppRoutes.map);
          },
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          icon: Icons.night_shelter_outlined,
          label: l10n.incidentNearestShelter,
          onPressed: () => context.push(AppRoutes.shelters),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.privacy_tip_outlined, size: 18, color: TarczaPalette.textSecondary),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                l10n.incidentPrivacyNote,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AreaPreview extends StatelessWidget {
  const _AreaPreview({required this.incident, required this.color});

  final Incident incident;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final area = incident.area;
    final points = area.outlinePoints;
    return SizedBox(
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: IgnorePointer(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: area.center,
              initialZoom: 14.5,
              initialCameraFit: points.length > 2
                  ? CameraFit.coordinates(
                      coordinates: points,
                      padding: const EdgeInsets.all(24),
                      maxZoom: 16,
                    )
                  : null,
            ),
            children: [
              osmTileLayer(),
              if (area case GeoPolygonArea(:final polygons))
                PolygonLayer(
                  polygons: [
                    for (final p in polygons)
                      Polygon(
                        points: p.outer,
                        color: color.withValues(alpha: 0.3),
                        borderColor: color,
                        borderStrokeWidth: 2.5,
                      ),
                  ],
                ),
              if (area case GeoPointArea(:final point))
                MarkerLayer(
                  markers: [
                    Marker(
                      point: point,
                      width: 40,
                      height: 40,
                      child: IconCircleMarker(icon: incident.type.icon, color: color, size: 40),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
