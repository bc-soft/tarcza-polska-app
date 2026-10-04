import "dart:async";

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
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/fuel_stations/bloc/fuel_station_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/report/bloc/report_cubit.dart";

/// Kolor stacji: czerwony przy braku paliwa, zielony gdy coś potwierdzono jako dostępne.
Color fuelStationColor(BuildContext context, FuelStation station) {
  if (station.shortage) return TarczaPalette.confirmed;
  if (station.fuels.any((f) => f.status == FuelAvailability.available)) {
    return TarczaPalette.success;
  }
  return TarczaPalette.unverified;
}

Color fuelAvailabilityColor(FuelAvailability status) => switch (status) {
  FuelAvailability.available => TarczaPalette.success,
  FuelAvailability.unavailable => TarczaPalette.confirmed,
  FuelAvailability.unknown => TarczaPalette.unverified,
};

class FuelStationPage extends StatelessWidget {
  const FuelStationPage({super.key, required this.stationId, this.initial, this.repository});

  final String stationId;
  final FuelStation? initial;
  final FuelStationRepository? repository;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => FuelStationCubit(
      repository: repository ?? getIt(),
      stationId: stationId,
      initial: initial,
    )..load(),
    child: const FuelStationView(),
  );
}

class FuelStationView extends StatelessWidget {
  const FuelStationView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<FuelStationCubit, FuelStationState>(
      listenWhen: (a, b) => a.confirm != b.confirm,
      listener: (context, state) {
        if (state.confirm == FuelConfirmStatus.sent) {
          context.read<MapBloc>().add(const MapRefreshRequested());
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.fuelStationConfirmed)));
        } else if (state.confirm == FuelConfirmStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Formatters.failure(l10n, state.failure ?? Exception()))),
          );
        }
      },
      builder: (context, state) {
        final station = state.station;
        return Scaffold(
          appBar: TarczaAppBar(title: Text(station?.name ?? l10n.fuelStationTitle)),
          body: station == null
              ? (state.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ErrorView(
                        message: Formatters.failure(l10n, state.failure ?? Exception()),
                        onRetry: context.read<FuelStationCubit>().load,
                      ))
              : _StationDetails(
                  station: station,
                  sending: state.confirm == FuelConfirmStatus.sending,
                ),
        );
      },
    );
  }
}

class _StationDetails extends StatelessWidget {
  const _StationDetails({required this.station, required this.sending});

  final FuelStation station;
  final bool sending;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = fuelStationColor(context, station);
    final hasData = station.fuels.any((f) => f.status != FuelAvailability.unknown);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        SizedBox(
          height: 170,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: IgnorePointer(
              child: FlutterMap(
                options: MapOptions(initialCenter: station.location, initialZoom: 16),
                children: [
                  osmTileLayer(),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: station.location,
                        width: 40,
                        height: 40,
                        child: IconCircleMarker(
                          icon: Icons.local_gas_station,
                          color: color,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TarczaCard(
          accent: color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusChip(
                label: station.shortage
                    ? l10n.fuelStationShortage
                    : (hasData ? l10n.fuelStationOk : l10n.fuelStationNoData),
                color: color,
                icon: station.shortage ? Icons.warning_amber_rounded : Icons.local_gas_station,
              ),
              const SizedBox(height: 10),
              if (station.brand != null && station.brand != station.name)
                Text(
                  station.brand!,
                  style: const TextStyle(color: TarczaPalette.textSecondary),
                ),
              if (station.address != null)
                InfoRow(label: l10n.fuelStationAddress, value: station.address!),
              if (station.distanceMeters != null)
                InfoRow(
                  label: l10n.shelterDistanceLabel,
                  value: l10n.shelterDistance(Formatters.distance(l10n, station.distanceMeters!)),
                ),
              InfoRow(
                label: l10n.fuelStationLastConfirmed,
                value: station.lastConfirmedAt == null
                    ? l10n.shelterNever
                    : Formatters.relative(l10n, station.lastConfirmedAt!),
              ),
            ],
          ),
        ),
        SectionHeader(l10n.fuelStationFuels),
        TarczaCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (final (i, fuel) in station.fuels.indexed) ...[
                if (i > 0) const Divider(indent: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fuel.type.displayLabel(l10n, fuel.label),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (fuel.confirmedAt != null)
                              Text(
                                Formatters.relative(l10n, fuel.confirmedAt!),
                                style: const TextStyle(
                                  color: TarczaPalette.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                          ],
                        ),
                      ),
                      StatusChip(
                        label: fuel.statusLabel,
                        color: fuelAvailabilityColor(fuel.status),
                        icon: fuel.status.icon,
                        dense: true,
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          icon: Icons.fact_check_outlined,
          label: l10n.fuelStationConfirm,
          loading: sending,
          onPressed: () => _showConfirmSheet(context),
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          icon: Icons.local_gas_station_outlined,
          label: l10n.fuelStationReport,
          onPressed: () => context.push(
            AppRoutes.reportObject,
            extra: ReportStart(
              type: IncidentType.fuelShortage,
              candidate: PoiCandidate(
                poi: PoiRef(
                  kind: PoiKind.fuelStation,
                  id: station.id,
                  name: station.name,
                  location: station.location,
                ),
                location: station.location,
                subtitle: station.address,
                distanceMeters: station.distanceMeters,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          icon: Icons.map_outlined,
          label: l10n.incidentShowOnMap,
          onPressed: () {
            context.read<MapBloc>().add(MapFocusRequested([station.location], zoom: 16.5));
            context.go(AppRoutes.map);
          },
        ),
      ],
    );
  }

  void _showConfirmSheet(BuildContext context) {
    final cubit = context.read<FuelStationCubit>();
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (_) => _FuelConfirmSheet(
          labels: {for (final f in station.fuels) f.type: f.label},
          initiallyAvailable: {
            for (final f in station.fuels)
              if (f.status == FuelAvailability.available) f.type,
          },
          onSubmit: (available) => cubit.confirm(available, available: true),
        ),
      ),
    );
  }
}

/// Jedna akcja: „które paliwa są teraz dostępne”. Niezaznaczonych nie oznaczamy jako brak —
/// stacja może ich po prostu nie sprzedawać; brak zgłasza się zgłoszeniem „Brak paliwa”.
class _FuelConfirmSheet extends StatefulWidget {
  const _FuelConfirmSheet({
    required this.labels,
    required this.initiallyAvailable,
    required this.onSubmit,
  });

  final Map<FuelType, String> labels;
  final Set<FuelType> initiallyAvailable;
  final void Function(List<FuelType> available) onSubmit;

  @override
  State<_FuelConfirmSheet> createState() => _FuelConfirmSheetState();
}

class _FuelConfirmSheetState extends State<_FuelConfirmSheet> {
  late final _selected = {...widget.initiallyAvailable};

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.fuelStationConfirmTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            l10n.fuelStationConfirmHint,
            style: const TextStyle(color: TarczaPalette.textSecondary),
          ),
          const SizedBox(height: 14),
          FuelChips(
            labels: widget.labels,
            selected: _selected,
            onToggle: (type) => setState(
              () => _selected.contains(type) ? _selected.remove(type) : _selected.add(type),
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            icon: Icons.check_rounded,
            label: l10n.fuelStationConfirmSend,
            onPressed: _selected.isEmpty
                ? null
                : () {
                    widget.onSubmit(_selected.toList());
                    Navigator.of(context).pop();
                  },
          ),
        ],
      ),
    );
  }
}
