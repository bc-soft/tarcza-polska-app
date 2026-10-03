import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/map/view/incident_card.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";

/// Ekran główny. `MapBloc` jest globalny (alert / incydent mogą przesunąć kamerę),
/// dlatego strona nie tworzy własnego `BlocProvider`.
class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) => const MapView();
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with SingleTickerProviderStateMixin {
  final _controller = MapController();
  final LayerHitNotifier<String> _hitNotifier = ValueNotifier(null);
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);
  bool _ready = false;

  @override
  void dispose() {
    _pulse.dispose();
    _hitNotifier.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _emitViewport() {
    if (!_ready) return;
    final b = _controller.camera.visibleBounds;
    // Zapas 25% — mniej zapytań przy drobnym przesuwaniu.
    final dLat = (b.north - b.south) * 0.25;
    final dLng = (b.east - b.west) * 0.25;
    context.read<MapBloc>().add(
      MapViewportChanged(
        BBox(
          minLng: b.west - dLng,
          minLat: b.south - dLat,
          maxLng: b.east + dLng,
          maxLat: b.north + dLat,
        ),
      ),
    );
  }

  void _focus(MapFocus focus) {
    if (!_ready || focus.points.isEmpty) return;
    if (focus.points.length == 1) {
      _controller.move(focus.points.first, focus.zoom ?? 16);
    } else {
      _controller.fitCamera(
        CameraFit.coordinates(
          coordinates: focus.points,
          padding: const EdgeInsets.fromLTRB(48, 140, 48, 260),
          maxZoom: 16,
        ),
      );
    }
    _emitViewport();
  }

  void _openIncident(Incident incident) {
    context.read<MapBloc>().add(MapIncidentSelected(incident.id));
    unawaited(context.push(AppRoutes.incident(incident.id)));
  }

  void _onPolygonTap() {
    final hit = _hitNotifier.value?.hitValues.firstOrNull;
    if (hit == null) return;
    final incident = context.read<MapBloc>().state.incidents.where((i) => i.id == hit).firstOrNull;
    if (incident != null) _openIncident(incident);
  }

  @override
  Widget build(BuildContext context) {
    final location = context.watch<LocationCubit>().state;
    final center = location.effectivePosition ?? defaultMapCenter;
    return BlocConsumer<MapBloc, MapState>(
      listenWhen: (a, b) => a.focus?.id != b.focus?.id && b.focus != null,
      listener: (context, state) => _focus(state.focus!),
      builder: (context, state) => Scaffold(
        body: Stack(
          children: [
            FlutterMap(
              mapController: _controller,
              options: MapOptions(
                initialCenter: center,
                initialZoom: 14.5,
                minZoom: 5,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                ),
                onMapReady: () {
                  _ready = true;
                  _emitViewport();
                  final focus = context.read<MapBloc>().state.focus;
                  if (focus != null) _focus(focus);
                },
                onPositionChanged: (_, hasGesture) {
                  if (hasGesture) _emitViewport();
                },
              ),
              children: [
                osmTileLayer(),
                _AlertAreasLayer(alerts: state.alerts),
                GestureDetector(
                  onTap: _onPolygonTap,
                  child: AnimatedBuilder(
                    animation: _pulse,
                    builder: (context, _) => PolygonLayer<String>(
                      hitNotifier: _hitNotifier,
                      polygons: _incidentPolygons(context, state),
                    ),
                  ),
                ),
                MarkerLayer(markers: _markers(context, state, location)),
                const OsmAttribution(),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: _TopBar(state: state),
              ),
            ),
            Positioned(
              right: 12,
              top: MediaQuery.paddingOf(context).top + (state.refreshFailed ? 136 : 84),
              child: _MapButtons(
                onMyLocation: () {
                  final p = context.read<LocationCubit>().state.effectivePosition;
                  if (p != null) context.read<MapBloc>().add(MapFocusRequested([p], zoom: 15.5));
                },
                onHome: location.homeAddress == null
                    ? null
                    : () => context.read<MapBloc>().add(
                        MapFocusRequested([location.homeAddress!.location], zoom: 15.5),
                      ),
                onRefresh: () => context.read<MapBloc>().add(const MapRefreshRequested()),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _BottomPanel(state: state, onIncidentTap: _openIncident),
            ),
          ],
        ),
      ),
    );
  }

  List<Polygon<String>> _incidentPolygons(BuildContext context, MapState state) {
    final colors = context.statusColors;
    final polygons = <Polygon<String>>[];
    for (final incident in state.incidents) {
      final area = incident.area;
      if (area is! GeoPolygonArea) continue;
      final color = colors.forConfidence(incident.confidenceLevel);
      // Strefa w trakcie weryfikacji „oddycha” — widać, że obszar żyje.
      final live = incident.status != IncidentStatus.active ? _pulse.value * 0.12 : 0.0;
      final selected = incident.id == state.selectedIncidentId;
      for (final p in area.polygons) {
        polygons.add(
          Polygon<String>(
            points: p.outer,
            holePointsList: p.holes.isEmpty ? null : p.holes,
            color: color.withValues(alpha: 0.28 + live),
            borderColor: color,
            borderStrokeWidth: selected ? 4 : 2.5,
            hitValue: incident.id,
          ),
        );
      }
    }
    return polygons;
  }

  List<Marker> _markers(BuildContext context, MapState state, LocationState location) {
    final colors = context.statusColors;
    return [
      for (final shelter in state.shelters)
        Marker(
          point: shelter.location,
          child: GestureDetector(
            onTap: () => context.push(AppRoutes.shelter(shelter.id), extra: shelter),
            child: Tooltip(
              message: "${shelter.name} — ${shelter.statusLabel}",
              child: IconCircleMarker(
                icon: Icons.night_shelter,
                color: colors.forShelter(shelter.status),
                size: 30,
              ),
            ),
          ),
        ),
      for (final incident in state.incidents)
        if (incident.area case GeoPointArea(:final point))
          Marker(
            point: point,
            width: 40,
            height: 40,
            child: GestureDetector(
              onTap: () => _openIncident(incident),
              child: IconCircleMarker(
                icon: incident.type.icon,
                color: colors.forConfidence(incident.confidenceLevel),
                size: 40,
              ),
            ),
          ),
      if (location.homeAddress != null)
        Marker(
          point: location.homeAddress!.location,
          width: 32,
          height: 32,
          child: const IconCircleMarker(
            icon: Icons.home_rounded,
            color: TarczaPalette.primaryDark,
            size: 32,
          ),
        ),
      if (location.position != null)
        Marker(
          point: location.position!,
          width: 22,
          height: 22,
          child: const IconCircleMarker(icon: Icons.circle, color: TarczaPalette.info, size: 22),
        ),
    ];
  }
}

class _AlertAreasLayer extends StatelessWidget {
  const _AlertAreasLayer({required this.alerts});

  final List<Alert> alerts;

  @override
  Widget build(BuildContext context) {
    final colors = context.statusColors;
    return PolygonLayer(
      polygons: [
        for (final alert in alerts)
          if (alert.area case GeoPolygonArea(:final polygons))
            for (final p in polygons)
              Polygon(
                points: p.outer,
                color: colors.forSeverity(alert.severity).withValues(alpha: 0.06),
                borderColor: colors.forSeverity(alert.severity),
                borderStrokeWidth: 2,
                pattern: StrokePattern.dashed(segments: const [10, 6]),
              ),
      ],
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.state});

  final MapState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final count = state.incidents.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TarczaCard(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.shield_outlined, color: TarczaPalette.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.appTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: TarczaPalette.heading,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      count == 0 ? l10n.mapNoIncidents : l10n.mapIncidentsCount(count),
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
                    ),
                  ],
                ),
              ),
              if (state.status == MapStatus.loading)
                const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
            ],
          ),
        ),
        if (state.refreshFailed) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF4E5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: TarczaPalette.likely),
            ),
            child: Row(
              children: [
                const Icon(Icons.wifi_off, size: 18, color: TarczaPalette.high),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(l10n.mapRefreshFailed, style: const TextStyle(fontSize: 13)),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _MapButtons extends StatelessWidget {
  const _MapButtons({required this.onMyLocation, required this.onHome, required this.onRefresh});

  final VoidCallback onMyLocation;
  final VoidCallback? onHome;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget button(IconData icon, String tooltip, VoidCallback? onPressed) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(side: BorderSide(color: TarczaPalette.outline)),
        elevation: 2,
        child: IconButton(
          tooltip: tooltip,
          icon: Icon(icon, color: TarczaPalette.primary),
          onPressed: onPressed,
        ),
      ),
    );
    return Column(
      children: [
        button(Icons.my_location, l10n.mapMyLocation, onMyLocation),
        if (onHome != null) button(Icons.home_outlined, l10n.mapHome, onHome),
        button(Icons.refresh, l10n.mapRefresh, onRefresh),
      ],
    );
  }
}

/// Dół mapy: oczekujące pytanie, aktywny alert, karty incydentów.
class _BottomPanel extends StatelessWidget {
  const _BottomPanel({required this.state, required this.onIncidentTap});

  final MapState state;
  final ValueChanged<Incident> onIncidentTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final verification = context.watch<VerificationBloc>().state;
    final alerts = context.watch<AlertsCubit>().state.alerts;
    final pending = verification.pending
        .where(
          (q) => q.verificationId != verification.question?.verificationId || !verification.isBusy,
        )
        .firstOrNull;
    final incidents = state.rankedIncidents;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (pending != null) ...[
            _ActionBanner(
              icon: Icons.record_voice_over_outlined,
              color: TarczaPalette.primary,
              title: l10n.mapPendingQuestion,
              subtitle: pending.question,
              action: l10n.mapPendingAnswer,
              onTap: () {
                context.read<VerificationBloc>().add(VerificationOpened(pending.verificationId));
                unawaited(context.push(AppRoutes.verification(pending.verificationId)));
              },
            ),
            const SizedBox(height: 8),
          ],
          if (alerts.isNotEmpty) ...[
            _ActionBanner(
              icon: alerts.first.severity.icon,
              color: context.statusColors.forSeverity(alerts.first.severity),
              title: l10n.mapActiveAlert,
              subtitle: alerts.first.title,
              onTap: () => context.push(AppRoutes.alert(alerts.first.id)),
            ),
            const SizedBox(height: 8),
          ],
          if (incidents.isNotEmpty)
            SizedBox(
              height: 108,
              child: PageView.builder(
                controller: PageController(viewportFraction: incidents.length > 1 ? 0.92 : 1),
                padEnds: false,
                itemCount: incidents.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(right: incidents.length > 1 ? 8 : 0),
                  child: IncidentCard(
                    incident: incidents[index],
                    highlighted: incidents[index].id == state.selectedIncidentId,
                    onTap: () => onIncidentTap(incidents[index]),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionBanner extends StatelessWidget {
  const _ActionBanner({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.action,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String? action;

  @override
  Widget build(BuildContext context) => Material(
    color: color,
    borderRadius: BorderRadius.circular(14),
    elevation: 3,
    child: InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.92), fontSize: 13),
                  ),
                ],
              ),
            ),
            if (action != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  action!,
                  style: TextStyle(color: color, fontWeight: FontWeight.w700),
                ),
              )
            else
              const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    ),
  );
}
