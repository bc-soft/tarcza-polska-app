import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/utils/geometry.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/fuel_stations/view/fuel_station_page.dart";
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

class _MapViewState extends State<MapView> with TickerProviderStateMixin {
  final _controller = MapController();
  final LayerHitNotifier<String> _hitNotifier = ValueNotifier(null);
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);
  AnimationController? _cameraAnimation;
  bool _ready = false;

  @override
  void dispose() {
    _cameraAnimation?.dispose();
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

  /// Płynny ruch kamery (zoom, „moja pozycja”, „pokaż na mapie”).
  void _animateTo(LatLng center, double zoom) {
    if (!_ready) return;
    _cameraAnimation?.dispose();
    final camera = _controller.camera;
    final latTween = Tween(begin: camera.center.latitude, end: center.latitude);
    final lngTween = Tween(begin: camera.center.longitude, end: center.longitude);
    final zoomTween = Tween(begin: camera.zoom, end: zoom.clamp(5.0, 19.0));
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    final curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    controller
      ..addListener(() {
        _controller.move(
          LatLng(latTween.evaluate(curve), lngTween.evaluate(curve)),
          zoomTween.evaluate(curve),
        );
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _emitViewport();
      });
    _cameraAnimation = controller;
    controller.forward();
  }

  void _zoomBy(double delta) =>
      _animateTo(_controller.camera.center, _controller.camera.zoom + delta);

  void _focus(MapFocus focus) {
    if (!_ready || focus.points.isEmpty) return;
    if (focus.points.length == 1) {
      _animateTo(focus.points.first, focus.zoom ?? 16);
      return;
    }
    final fitted = CameraFit.coordinates(
      coordinates: focus.points,
      padding: const EdgeInsets.fromLTRB(48, 100, 72, 220),
      maxZoom: 16,
    ).fit(_controller.camera);
    _animateTo(fitted.center, fitted.zoom);
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
    final center = location.bestPosition ?? defaultMapCenter;
    final topInset = MediaQuery.paddingOf(context).top;
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
                maxZoom: 19,
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
                  child: PolygonLayer<String>(
                    hitNotifier: _hitNotifier,
                    polygons: _incidentPolygons(context, state),
                  ),
                ),
                // Strefy w trakcie weryfikacji „oddychają”: animujemy tylko przezroczystość
                // osobnej warstwy wypełnień (bez przebudowy poligonów co klatkę).
                IgnorePointer(
                  child: FadeTransition(
                    opacity: _pulse,
                    child: PolygonLayer(polygons: _pulsePolygons(context, state)),
                  ),
                ),
                // Warstwy POI potrafią zasłonić strefy incydentów — patrz `AppConfig`.
                if (AppConfig.showSheltersOnMap)
                  ClusteredMarkerLayer<Shelter>(
                    items: state.shelters,
                    pointOf: (s) => s.location,
                    clusterColor: (group) => shelterGroupColor(context, group),
                    clusterIcon: Icons.night_shelter,
                    markerBuilder: (context, shelter) => GestureDetector(
                      onTap: () => context.push(AppRoutes.shelter(shelter.id), extra: shelter),
                      child: Semantics(
                        label: "${shelter.name} — ${shelter.statusLabel}",
                        child: IconCircleMarker(
                          icon: Icons.night_shelter,
                          color: context.statusColors.forShelter(shelter.status),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                if (AppConfig.showFuelStationsOnMap)
                  ClusteredMarkerLayer<FuelStation>(
                    items: state.fuelStations,
                    pointOf: (s) => s.location,
                    clusterColor: (group) => group.any((s) => s.shortage)
                        ? TarczaPalette.confirmed
                        : TarczaPalette.unverified,
                    clusterIcon: Icons.local_gas_station,
                    markerBuilder: (context, station) => GestureDetector(
                      onTap: () => context.push(AppRoutes.fuelStation(station.id), extra: station),
                      child: Semantics(
                        label: station.name,
                        child: IconCircleMarker(
                          icon: Icons.local_gas_station,
                          color: fuelStationColor(context, station),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                MarkerLayer(markers: _markers(context, state, location)),
                // Podpisy na wierzchu — nazwy ulic muszą być czytelne także pod strefą.
                mapLabelsLayer(),
                const OsmAttribution(),
              ],
            ),
            // Scrim u góry — nagłówek musi być czytelny nad dowolnym fragmentem mapy.
            IgnorePointer(
              child: Container(
                height: topInset + 96,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      TarczaPalette.background,
                      TarczaPalette.background.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: topInset + 6,
              child: const _MapHeader(),
            ),
            if (state.refreshFailed)
              Positioned(
                left: 12,
                right: 12,
                top: topInset + 62,
                child: const _RefreshFailedBanner(),
              ),
            Positioned(
              right: 12,
              top: topInset + (state.refreshFailed ? 112 : 62),
              child: _MapButtons(
                loading: state.status == MapStatus.loading,
                onZoomIn: () => _zoomBy(1),
                onZoomOut: () => _zoomBy(-1),
                onMyLocation: location.bestPosition == null
                    ? null
                    : () => _animateTo(location.bestPosition!, 16),
                onHome: location.homeAddress == null
                    ? null
                    : () => _animateTo(location.homeAddress!.location, 16),
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
      final selected = incident.id == state.selectedIncidentId;
      // Sąsiadujące komórki H3 to jeden problem — rysujemy wspólny obrys, bez siatki w środku.
      for (final p in dissolvePolygons(area.polygons)) {
        polygons.add(
          Polygon<String>(
            points: p.outer,
            holePointsList: p.holes.isEmpty ? null : p.holes,
            color: color.withValues(alpha: 0.26),
            borderColor: color,
            borderStrokeWidth: selected ? 3.5 : 2,
            hitValue: incident.id,
          ),
        );
      }
    }
    return polygons;
  }

  /// Dodatkowe wypełnienie stref, które jeszcze się zmieniają (nie `active`).
  List<Polygon> _pulsePolygons(BuildContext context, MapState state) {
    final colors = context.statusColors;
    return [
      for (final incident in state.incidents)
        if (incident.status != IncidentStatus.active)
          if (incident.area case GeoPolygonArea(:final polygons))
            for (final p in dissolvePolygons(polygons))
              Polygon(
                points: p.outer,
                holePointsList: p.holes.isEmpty ? null : p.holes,
                color: colors.forConfidence(incident.confidenceLevel).withValues(alpha: 0.14),
              ),
    ];
  }

  List<Marker> _markers(BuildContext context, MapState state, LocationState location) {
    final colors = context.statusColors;
    final me = location.livePosition ?? location.position;
    return [
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
      if (me != null) userLocationMarker(me),
      // Dom na wierzchu — pinezka, wyraźnie inna niż okrągłe schrony.
      if (location.homeAddress != null) homeMarker(location.homeAddress!.location),
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
            for (final p in dissolvePolygons(polygons))
              Polygon(
                points: p.outer,
                holePointsList: p.holes.isEmpty ? null : p.holes,
                color: colors.forSeverity(alert.severity).withValues(alpha: 0.06),
                borderColor: colors.forSeverity(alert.severity),
                borderStrokeWidth: 2,
                pattern: StrokePattern.dashed(segments: const [10, 6]),
              ),
      ],
    );
  }
}

/// Nagłówek mapy w stylu panelu: logo, nadtytuł „MAPA SYTUACYJNA”, wskaźnik „na żywo”
/// i liczba widocznych incydentów.
class _MapHeader extends StatelessWidget {
  const _MapHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TarczaLogo(size: 36),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _LiveDot(),
                const SizedBox(width: 7),
                Text(
                  upper(l10n.statLive),
                  style: TarczaFonts.label(size: 9.5, weight: 700, color: TarczaPalette.success),
                ),
                Text(
                  "  ·  ",
                  style: TarczaFonts.label(size: 9.5),
                ),
                Text(upper(l10n.mapCommandCenter), style: TarczaFonts.label(size: 9.5)),
              ],
            ),
            const SizedBox(height: 3),
            DisplayHeading(l10n.mapSituational, size: 22, maxLines: 1),
          ],
        ),
      ],
    );
  }
}

/// Pulsująca kropka „na żywo” — ten sam sygnał co w panelu operatora.
class _LiveDot extends StatefulWidget {
  const _LiveDot();

  @override
  State<_LiveDot> createState() => _LiveDotState();
}

class _LiveDotState extends State<_LiveDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: Tween<double>(begin: 0.35, end: 1).animate(_controller),
    child: Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(color: TarczaPalette.success, shape: BoxShape.circle),
    ),
  );
}

class _RefreshFailedBanner extends StatelessWidget {
  const _RefreshFailedBanner();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
    margin: const EdgeInsets.only(right: 60),
    decoration: BoxDecoration(
      color: TarczaPalette.surface,
      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      border: Border.all(color: TarczaPalette.likely.withValues(alpha: 0.5)),
      boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12, offset: Offset(0, 2))],
    ),
    child: Row(
      children: [
        const Icon(Icons.wifi_off, size: 16, color: TarczaPalette.likely),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            context.l10n.mapRefreshFailed,
            style: const TextStyle(fontSize: 12.5, color: TarczaPalette.textPrimary),
          ),
        ),
      ],
    ),
  );
}

class _MapButtons extends StatelessWidget {
  const _MapButtons({
    required this.loading,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onMyLocation,
    required this.onHome,
    required this.onRefresh,
  });

  final bool loading;
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback? onMyLocation;
  final VoidCallback? onHome;
  final VoidCallback onRefresh;

  static final _decoration = BoxDecoration(
    color: TarczaPalette.surface.withValues(alpha: 0.95),
    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
    border: Border.all(color: TarczaPalette.outline),
    boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12, offset: Offset(0, 2))],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget box(Widget child) => Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DecoratedBox(decoration: _decoration, child: child),
    );
    Widget icon(IconData icon, String tooltip, VoidCallback? onPressed) => IconButton(
      tooltip: tooltip,
      iconSize: 20,
      constraints: const BoxConstraints.tightFor(width: 42, height: 42),
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: onPressed == null ? TarczaPalette.textMuted : TarczaPalette.textPrimary,
      ),
      onPressed: onPressed,
    );
    return Column(
      children: [
        box(
          Column(
            children: [
              icon(Icons.add, l10n.mapZoomIn, onZoomIn),
              const SizedBox(width: 26, child: Divider(height: 1, color: TarczaPalette.outline)),
              icon(Icons.remove, l10n.mapZoomOut, onZoomOut),
            ],
          ),
        ),
        box(icon(Icons.my_location, l10n.mapMyLocation, onMyLocation)),
        if (onHome != null) box(icon(Icons.home_outlined, l10n.mapHome, onHome)),
        box(
          loading
              ? const SizedBox.square(
                  dimension: 42,
                  child: Center(
                    child: SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                )
              : icon(Icons.refresh, l10n.mapRefresh, onRefresh),
        ),
      ],
    );
  }
}

/// Dół mapy: oczekujące pytanie, aktywny alert, karty incydentów + lista wszystkich.
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
          if (incidents.isNotEmpty) ...[
            Align(
              alignment: Alignment.centerRight,
              child: _AllIncidentsButton(count: incidents.length),
            ),
            const SizedBox(height: 8),
            _IncidentCarousel(
              incidents: incidents,
              selectedId: state.selectedIncidentId,
              onTap: onIncidentTap,
            ),
          ],
        ],
      ),
    );
  }
}

class _AllIncidentsButton extends StatelessWidget {
  const _AllIncidentsButton({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: TarczaPalette.surface.withValues(alpha: 0.95),
      borderRadius: BorderRadius.circular(AppTheme.radiusSm),
      border: Border.all(color: TarczaPalette.outline),
      boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black12, offset: Offset(0, 2))],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        onTap: () => context.push(AppRoutes.incidents),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.format_list_bulleted, size: 15, color: TarczaPalette.primaryLight),
              const SizedBox(width: 7),
              Text(
                upper(context.l10n.mapAllIncidents(count)),
                style: TarczaFonts.label(weight: 700, color: TarczaPalette.textPrimary),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/// Poziome karty incydentów. Kontroler żyje ze stanem (nie odtwarzamy go przy każdym
/// odświeżeniu mapy), a wysokość rośnie z rozmiarem czcionki — karty nie są przycinane.
class _IncidentCarousel extends StatefulWidget {
  const _IncidentCarousel({
    required this.incidents,
    required this.selectedId,
    required this.onTap,
  });

  final List<Incident> incidents;
  final String? selectedId;
  final ValueChanged<Incident> onTap;

  @override
  State<_IncidentCarousel> createState() => _IncidentCarouselState();
}

class _IncidentCarouselState extends State<_IncidentCarousel> {
  late PageController _controller = _create();

  PageController _create() =>
      PageController(viewportFraction: widget.incidents.length > 1 ? 0.9 : 1);

  @override
  void didUpdateWidget(_IncidentCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    final wasMany = oldWidget.incidents.length > 1;
    final isMany = widget.incidents.length > 1;
    if (wasMany != isMany) {
      _controller.dispose();
      _controller = _create();
    } else if (widget.selectedId != oldWidget.selectedId && _controller.hasClients) {
      // Wybrany incydent jest pierwszy na liście.
      _controller.animateToPage(
        0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final many = widget.incidents.length > 1;
    return SizedBox(
      height: MediaQuery.textScalerOf(context).scale(56) + 36,
      child: PageView.builder(
        controller: _controller,
        padEnds: false,
        itemCount: widget.incidents.length,
        itemBuilder: (context, index) {
          final incident = widget.incidents[index];
          return Padding(
            padding: EdgeInsets.only(right: many ? 8 : 0),
            child: IncidentOpenContainer(
              incident: incident,
              elevation: 3,
              onOpen: () => context.read<MapBloc>().add(MapIncidentSelected(incident.id)),
            ),
          );
        },
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
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: TarczaPalette.surface,
      borderRadius: BorderRadius.circular(AppTheme.radius),
      border: Border.all(color: color.withValues(alpha: 0.45)),
      boxShadow: const [BoxShadow(blurRadius: 14, color: Colors.black12, offset: Offset(0, 3))],
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppTheme.radius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 11, 12, 11),
          child: Row(
            children: [
              // Pasek sygnałowy — ten sam zabieg co w kartach panelu.
              Container(width: 3, height: 34, color: color),
              const SizedBox(width: 11),
              Icon(icon, size: 20, color: readable(color, 0.2)),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upper(title),
                      style: TarczaFonts.label(
                        size: 10.5,
                        weight: 700,
                        color: readable(color, 0.25),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TarczaFonts.text(
                        size: 13.5,
                        weight: 600,
                        color: TarczaPalette.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (action != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    upper(action!),
                    style: TarczaFonts.label(size: 10.5, weight: 700, color: Colors.white),
                  ),
                )
              else
                const Icon(Icons.chevron_right, size: 20, color: TarczaPalette.textMuted),
            ],
          ),
        ),
      ),
    ),
  );
}
