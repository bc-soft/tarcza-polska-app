import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/utils/geometry.dart";
import "package:tarcza_polska/core/widgets/guidance_widgets.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/incident/bloc/incident_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";

class IncidentPage extends StatelessWidget {
  const IncidentPage({
    super.key,
    required this.incidentId,
    this.initial,
    this.repository,
    this.guidance,
  });

  final String incidentId;

  /// Dane z karty na mapie — ekran rysuje się od razu, `GET /incidents/{id}` je odświeża.
  final Incident? initial;

  /// Podgląd ekranów (ustawienia dev) podaje własne repozytorium ze stałymi danymi.
  final IncidentRepository? repository;
  final GuidanceRepository? guidance;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => IncidentCubit(
      repository: repository ?? getIt(),
      guidance: guidance ?? getIt(),
      incidentId: incidentId,
      initial: initial,
    )..load(),
    child: const IncidentView(),
  );
}

class IncidentView extends StatelessWidget {
  const IncidentView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: TarczaAppBar(
        title: Text(l10n.incidentTitle),
        eyebrow: l10n.incidentIncident,
        eyebrowTrailing: context.select(
          (IncidentCubit c) => Formatters.shortId(c.state.incident?.id),
        ),
      ),
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
            child: _IncidentDetails(incident: incident, state: state),
          );
        },
      ),
    );
  }
}

class _IncidentDetails extends StatelessWidget {
  const _IncidentDetails({required this.incident, required this.state});

  final Incident incident;
  final IncidentState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forConfidence(incident.confidenceLevel);
    final percent = Formatters.percent(incident.confidenceScore);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        // Nagłówek jak w panelu operatora: typ wersalikami, obok odznaki stanu.
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: DisplayHeading(incident.typeLabel, size: 31)),
            const SizedBox(width: 12),
            // Poziom wiarygodności ma własną kartę niżej — tu tylko stan incydentu.
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: PanelBadge(
                label: incident.statusText(l10n),
                color: incident.status == IncidentStatus.resolved
                    ? TarczaPalette.success
                    : TarczaPalette.unverified,
                dense: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        DataText(
          l10n.incidentDetectedAt(
            Formatters.dateTime(incident.startedAt),
            Formatters.relative(l10n, incident.startedAt),
          ),
          size: 11.5,
          color: TarczaPalette.textMuted,
        ),
        if (incident.summary != null) ...[
          const SizedBox(height: 14),
          Text(incident.summary!, style: Theme.of(context).textTheme.bodyLarge),
        ],
        const SizedBox(height: 18),
        // Moduł „WIARYGODNOŚĆ” — duży procent, pasek i jedno zdanie, co to znaczy.
        TarczaCard(
          accent: color,
          title: l10n.incidentConfidence,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween(end: incident.confidenceScore),
                    duration: const Duration(milliseconds: 700),
                    builder: (context, value, _) => Text(
                      l10n.confidencePercent(Formatters.percent(value)),
                      style: TarczaFonts.metric(size: 50, color: readable(color, 0.1)),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      incident.confidenceLabel,
                      style: TarczaFonts.label(
                        size: 12,
                        weight: 700,
                        color: readable(color, 0.25),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Semantics(
                label: l10n.incidentConfidence,
                value: "$percent%",
                child: MeterBar(value: incident.confidenceScore, color: color, height: 7),
              ),
              const SizedBox(height: 14),
              Text(
                incident.confidenceLevel.hint(l10n),
                style: const TextStyle(color: TarczaPalette.textSecondary, fontSize: 13),
              ),
            ],
          ),
        ),
        if (incident.poi case final poi?) ...[
          SectionHeader(l10n.incidentPoiTitle),
          TarczaCard(
            padding: EdgeInsets.zero,
            child: ListTileRow(
              icon: poi.kind.icon,
              title: poi.name,
              subtitle: incident.fuelTypes.isEmpty
                  ? null
                  : l10n.incidentMissingFuels(
                      incident.fuelTypes.map((f) => f.displayLabel(l10n)).join(", "),
                    ),
              onTap: () => switch (poi.kind) {
                PoiKind.fuelStation => context.push(AppRoutes.fuelStation(poi.id)),
                PoiKind.shelter => context.push(AppRoutes.shelter(poi.id)),
              },
            ),
          ),
        ],
        SectionHeader(l10n.incidentArea),
        // `area == null` — zasięg niewyznaczony (status `detected`), nie ma czego rysować.
        if (incident.area != null) ...[
          _AreaPreview(area: incident.area!, type: incident.type, color: color),
          const SizedBox(height: 8),
        ],
        Text(
          switch (incident) {
            Incident(scope: ReportScope.point) => l10n.incidentAreaObject,
            Incident(area: GeoPolygonArea()) => l10n.incidentAreaPolygon,
            _ => l10n.incidentAreaPoint,
          },
          style: const TextStyle(color: TarczaPalette.textSecondary),
        ),
        ProceduresSection(procedures: state.procedures),
        IncidentTimeline(entries: state.timeline),
        const SizedBox(height: 20),
        PrimaryButton(
          icon: Icons.map_outlined,
          label: l10n.incidentShowOnMap,
          onPressed: () {
            final points = incident.area?.outlinePoints ?? const [];
            context.read<MapBloc>().add(
              points.isEmpty
                  ? MapIncidentSelected(incident.id)
                  : MapFocusRequested(points, selectIncidentId: incident.id),
            );
            // Ekran mógł być otwarty z karty (OpenContainer, trasa bez strony go_router) —
            // najpierw go zamykamy, inaczej zostałby nad mapą.
            final router = GoRouter.of(context);
            Navigator.of(context).maybePop();
            router.go(AppRoutes.map);
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.privacy_tip_outlined, size: 16, color: TarczaPalette.textMuted),
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
  const _AreaPreview({required this.area, required this.type, required this.color});

  final GeoArea area;
  final IncidentType type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final points = area.outlinePoints;
    return SizedBox(
      height: 210,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radius),
          border: Border.all(color: TarczaPalette.outline),
        ),
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
                    for (final p in dissolvePolygons(polygons))
                      Polygon(
                        points: p.outer,
                        holePointsList: p.holes.isEmpty ? null : p.holes,
                        color: color.withValues(alpha: 0.28),
                        borderColor: color,
                        borderStrokeWidth: 2,
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
                      child: IconCircleMarker(icon: type.icon, color: color, size: 40),
                    ),
                  ],
                ),
              mapLabelsLayer(),
            ],
          ),
        ),
      ),
    );
  }
}
