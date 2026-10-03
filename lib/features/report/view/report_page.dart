import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/report/bloc/report_cubit.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

class ReportPage extends StatelessWidget {
  const ReportPage({super.key, this.start});

  /// Zgłoszenie z ekranu schronu / stacji (`/report-object`) — typ i obiekt wybrane.
  final ReportStart? start;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) {
      final cubit = ReportCubit(repository: getIt(), fuelStations: getIt(), shelters: getIt());
      if (start case final start?) {
        unawaited(
          cubit.startWith(start, defaultPosition: context.read<LocationCubit>().state.bestPosition),
        );
      }
      unawaited(cubit.loadTypes());
      return cubit;
    },
    child: const ReportView(),
  );
}

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ReportCubit, ReportState>(
      listenWhen: (a, b) =>
          (b.failure != null && a.failure != b.failure) ||
          (a.step != ReportStep.success && b.step == ReportStep.success) ||
          (a.status?.incident == null && b.status?.incident != null),
      listener: (context, state) {
        if (state.failure != null && state.failure is! ValidationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Formatters.failure(l10n, state.failure!))),
          );
        }
        if (state.step == ReportStep.success) {
          // Backend łączy zgłoszenie w ~1 s — odświeżamy mapę po chwili (`backend-specs` §6).
          final map = context.read<MapBloc>();
          Timer(const Duration(milliseconds: 2500), () {
            if (!map.isClosed) map.add(const MapRefreshRequested());
          });
        }
      },
      builder: (context, state) => Scaffold(
        appBar: TarczaAppBar(
          title: Text(l10n.reportTitle),
          leading: switch (state.step) {
            ReportStep.location || ReportStep.object || ReportStep.description => IconButton(
              tooltip: l10n.commonBack,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                final cubit = context.read<ReportCubit>();
                // Otwarte z ekranu obiektu: pierwszy krok to obiekt — „Wstecz” zamyka ekran.
                if (cubit.startedFromObject && state.step == ReportStep.object) {
                  Navigator.of(context).maybePop();
                } else {
                  cubit.back();
                }
              },
            ),
            _ => null,
          },
        ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: switch (state.step) {
              ReportStep.type => _TypeStep(key: const ValueKey("type"), state: state),
              ReportStep.location => _LocationStep(key: const ValueKey("loc"), state: state),
              ReportStep.object => _ObjectStep(key: const ValueKey("obj"), state: state),
              ReportStep.description => _DescriptionStep(
                key: const ValueKey("desc"),
                state: state,
              ),
              ReportStep.success => _SuccessStep(key: const ValueKey("ok"), state: state),
            },
          ),
        ),
      ),
    );
  }
}

class _StepHeader extends StatelessWidget {
  const _StepHeader({required this.step, required this.title, this.hint});

  final int step;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.onbStepOf(step, 3),
          style: const TextStyle(color: TarczaPalette.textSecondary, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        if (hint != null) ...[
          const SizedBox(height: 4),
          Text(hint!, style: const TextStyle(color: TarczaPalette.textSecondary)),
        ],
      ],
    ),
  );
}

class _TypeStep extends StatelessWidget {
  const _TypeStep({super.key, required this.state});

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final position = context.read<LocationCubit>().state.bestPosition;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepHeader(step: 1, title: l10n.reportStepType, hint: l10n.reportStepTypeHint),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.95,
            children: [
              for (final option in state.types)
                TarczaCard(
                  onTap: () => context.read<ReportCubit>().selectType(
                    option,
                    defaultPosition: position,
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(option.type.icon, size: 34, color: TarczaPalette.primary),
                      const SizedBox(height: 8),
                      Text(
                        option.label,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        option.type.description(l10n),
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
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

class _LocationStep extends StatelessWidget {
  const _LocationStep({super.key, required this.state});

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<ReportCubit>();
    final location = context.watch<LocationCubit>().state;
    final myPosition = location.livePosition ?? location.position;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepHeader(step: 2, title: l10n.reportStepLocation, hint: l10n.reportStepLocationHint),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LocationPickerMap(
              position: state.position,
              onChanged: cubit.setPosition,
              fallbackCenter: location.bestPosition ?? defaultMapCenter,
              extraMarkers: [
                if (location.livePosition ?? location.position case final me?)
                  userLocationMarker(me),
                if (location.homeAddress != null)
                  homeMarker(location.homeAddress!.location, size: 38),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  if (myPosition != null)
                    Expanded(
                      child: SecondaryButton(
                        icon: Icons.my_location,
                        label: l10n.reportUseMyLocation,
                        onPressed: () => cubit.setPosition(myPosition),
                      ),
                    ),
                  if (myPosition != null && location.homeAddress != null) const SizedBox(width: 12),
                  if (location.homeAddress != null)
                    Expanded(
                      child: SecondaryButton(
                        icon: Icons.home_outlined,
                        label: l10n.reportUseHome,
                        onPressed: () => cubit.setPosition(location.homeAddress!.location),
                      ),
                    ),
                ],
              ),
              if (state.position == null) ...[
                const SizedBox(height: 8),
                Text(l10n.reportNoLocation, textAlign: TextAlign.center),
              ],
              const SizedBox(height: 12),
              PrimaryButton(
                label: l10n.commonContinue,
                onPressed: state.position == null ? null : cubit.confirmLocation,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Zgłoszenie punktowe: wybór stacji / schronu na mapie (najbliższy zaznaczony, tapnięcie
/// w marker zmienia wybór) i — dla paliwa — rodzajów brakującego paliwa.
class _ObjectStep extends StatelessWidget {
  const _ObjectStep({super.key, required this.state});

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<ReportCubit>();
    final type = state.type!;
    final isFuel = state.needsFuels;
    final selected = state.poi;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _StepHeader(
          step: 2,
          title: isFuel ? l10n.reportObjectFuelTitle : l10n.reportObjectShelterTitle,
          hint: cubit.startedFromObject ? l10n.reportObjectChangeHint : l10n.reportObjectMapHint,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _PoiPickerMap(state: state, onSelect: cubit.selectPoi),
          ),
        ),
        // Panel na dole odcięty od mapy — treść nie wjeżdża pod przycisk.
        Container(
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: TarczaPalette.outline)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.candidatesLoading)
                const Center(child: CircularProgressIndicator())
              else if (selected == null)
                Text(
                  state.candidates.isEmpty ? l10n.reportObjectNone : l10n.reportObjectMapHint,
                  style: const TextStyle(color: TarczaPalette.textSecondary),
                )
              else
                Row(
                  children: [
                    Icon(selected.poi.kind.icon, color: TarczaPalette.primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selected.poi.name,
                            style: Theme.of(context).textTheme.titleMedium,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            [
                              if (selected.distanceMeters != null)
                                Formatters.distance(l10n, selected.distanceMeters!),
                              ?selected.subtitle,
                            ].join(" · "),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: TarczaPalette.textSecondary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              if (isFuel) ...[
                const SizedBox(height: 14),
                Text(l10n.reportFuelTypesTitle, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 6),
                FuelChips(
                  types: type.fuelTypes.isEmpty
                      ? FuelType.values
                      : type.fuelTypes.map((f) => f.type).toList(),
                  labels: {for (final f in type.fuelTypes) f.type: f.label},
                  selected: state.fuels,
                  onToggle: cubit.toggleFuel,
                ),
              ],
              const SizedBox(height: 16),
              PrimaryButton(
                label: l10n.commonContinue,
                onPressed: state.objectReady ? cubit.confirmObject : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Mapa obiektów do wyboru (schrony / stacje) z pozycją użytkownika i domem.
class _PoiPickerMap extends StatefulWidget {
  const _PoiPickerMap({required this.state, required this.onSelect});

  final ReportState state;
  final ValueChanged<PoiCandidate> onSelect;

  @override
  State<_PoiPickerMap> createState() => _PoiPickerMapState();
}

class _PoiPickerMapState extends State<_PoiPickerMap> {
  final _controller = MapController();
  bool _ready = false;
  bool _fitted = false;

  List<LatLng> _points(LocationState location) => [
    ...widget.state.candidates.take(5).map((c) => c.location),
    ?(location.livePosition ?? location.position ?? widget.state.position),
  ];

  /// Kamera obejmuje najbliższe obiekty i użytkownika — raz, gdy lista przyjdzie.
  /// Zawsze po klatce: ruch kamery w `onMapReady` (przed pierwszym kadrem) nie ładuje kafelków.
  void _fit(LocationState location) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _fitNow(location);
    });
  }

  void _fitNow(LocationState location) {
    if (!_ready || _fitted || widget.state.candidates.isEmpty) return;
    final points = _points(location);
    _fitted = true;
    if (points.length == 1) {
      _controller.move(points.first, 16);
    } else {
      _controller.fitCamera(
        CameraFit.coordinates(
          coordinates: points,
          padding: const EdgeInsets.all(40),
          maxZoom: 16.5,
        ),
      );
    }
  }

  @override
  void didUpdateWidget(_PoiPickerMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.state.candidates.length != widget.state.candidates.length) {
      _fitted = false;
      _fit(context.read<LocationCubit>().state);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final location = context.watch<LocationCubit>().state;
    final me = location.livePosition ?? location.position;
    final selectedId = widget.state.poi?.poi.id;
    final candidates = widget.state.candidates;
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: FlutterMap(
        mapController: _controller,
        options: MapOptions(
          initialCenter:
              candidates.firstOrNull?.location ?? location.bestPosition ?? defaultMapCenter,
          initialZoom: 15,
          interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
          onMapReady: () {
            _ready = true;
            _fit(location);
          },
        ),
        children: [
          osmTileLayer(),
          MarkerLayer(
            markers: [
              if (location.homeAddress != null)
                homeMarker(location.homeAddress!.location, size: 38),
              if (me != null) userLocationMarker(me),
              // Wybrany na wierzchu.
              for (final c in [
                ...candidates.where((c) => c.poi.id != selectedId),
                ...candidates.where((c) => c.poi.id == selectedId),
              ])
                Marker(
                  point: c.location,
                  width: c.poi.id == selectedId ? 50 : 36,
                  height: c.poi.id == selectedId ? 50 : 36,
                  child: GestureDetector(
                    onTap: () => widget.onSelect(c),
                    child: Semantics(
                      label: c.poi.name,
                      selected: c.poi.id == selectedId,
                      button: true,
                      child: _PoiMarker(kind: c.poi.kind, selected: c.poi.id == selectedId),
                    ),
                  ),
                ),
            ],
          ),
          const OsmAttribution(),
        ],
      ),
    );
  }
}

class _PoiMarker extends StatelessWidget {
  const _PoiMarker({required this.kind, required this.selected});

  final PoiKind kind;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    if (!selected) {
      return IconCircleMarker(icon: kind.icon, color: TarczaPalette.unverified);
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: TarczaPalette.primary.withValues(alpha: 0.2),
          ),
        ),
        IconCircleMarker(icon: kind.icon, color: TarczaPalette.primary, size: 40),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: const Icon(Icons.check_circle, size: 18, color: TarczaPalette.success),
          ),
        ),
      ],
    );
  }
}

class _DescriptionStep extends StatefulWidget {
  const _DescriptionStep({super.key, required this.state});

  final ReportState state;

  @override
  State<_DescriptionStep> createState() => _DescriptionStepState();
}

class _DescriptionStepState extends State<_DescriptionStep> {
  late final _controller = TextEditingController(text: widget.state.description);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = widget.state;
    final cubit = context.read<ReportCubit>();
    final serverError = switch (state.failure) {
      ValidationFailure(:final violations) => violations["description"],
      _ => null,
    };
    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        _StepHeader(step: 3, title: l10n.reportStepDescription),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TarczaCard(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(state.type!.type.icon, color: TarczaPalette.primary),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.type!.label,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          // Zgłoszenie punktowe: którego obiektu i jakich paliw dotyczy.
                          if (state.isPoint && state.poi != null)
                            Text(
                              [
                                state.poi!.poi.name,
                                if (state.needsFuels)
                                  state.type!.fuelTypes
                                      .where((f) => state.fuels.contains(f.type))
                                      .map((f) => f.type.displayLabel(l10n, f.label))
                                      .join(", "),
                              ].join(" · "),
                              style: const TextStyle(color: TarczaPalette.textSecondary),
                            ),
                        ],
                      ),
                    ),
                    Icon(
                      state.isPoint ? state.type!.poiKind!.icon : Icons.place_outlined,
                      color: TarczaPalette.textSecondary,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                onChanged: cubit.setDescription,
                minLines: 4,
                maxLines: 8,
                maxLength: ReportState.maxDescription,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: state.type!.type.descriptionHint(l10n),
                  errorText: state.descriptionTooLong ? l10n.reportDescriptionTooLong : serverError,
                ),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                icon: Icons.send_outlined,
                label: l10n.reportSend,
                loading: state.submitting,
                onPressed: state.canSubmit ? cubit.submit : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SuccessStep extends StatelessWidget {
  const _SuccessStep({super.key, required this.state});

  final ReportState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final incident = state.status?.incident;
    return MessageView(
      icon: Icons.check_circle_outline,
      title: l10n.reportSuccessTitle,
      body: l10n.reportSuccessBody,
      extra: incident == null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
                Flexible(child: Text(l10n.reportSuccessPending)),
              ],
            )
          : Column(
              children: [
                if (incident.typeLabel != null && incident.confidenceLabel != null) ...[
                  Text(
                    l10n.reportSuccessJoined(incident.typeLabel!, incident.confidenceLabel!),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                ],
                ConfidenceBadge(
                  level: incident.confidenceLevel,
                  label: incident.confidenceLabel ?? state.type?.label ?? "",
                  score: incident.confidenceScore,
                ),
              ],
            ),
      actions: [
        PrimaryButton(
          icon: Icons.map_outlined,
          label: l10n.reportSuccessShowMap,
          onPressed: () {
            final position = state.position;
            if (position != null) {
              context.read<MapBloc>().add(
                MapFocusRequested([position], zoom: 15.5, selectIncidentId: incident?.id),
              );
            }
            context.read<ReportCubit>().reset();
            context.go(AppRoutes.map);
          },
        ),
        SecondaryButton(label: l10n.reportAnother, onPressed: context.read<ReportCubit>().reset),
      ],
    );
  }
}
