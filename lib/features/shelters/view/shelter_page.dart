import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/report/bloc/report_cubit.dart";
import "package:tarcza_polska/features/shelters/bloc/shelters_cubit.dart";

class ShelterPage extends StatelessWidget {
  const ShelterPage({super.key, required this.shelterId, this.initial, this.repository});

  final String shelterId;
  final Shelter? initial;

  /// Podgląd ekranów (ustawienia dev) podaje własne repozytorium ze stałymi danymi.
  final ShelterRepository? repository;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => ShelterDetailCubit(
      repository: repository ?? getIt(),
      shelterId: shelterId,
      initial: initial,
    )..load(),
    child: const ShelterView(),
  );
}

class ShelterView extends StatelessWidget {
  const ShelterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ShelterDetailCubit, ShelterDetailState>(
      listenWhen: (a, b) => a.confirm != b.confirm,
      listener: (context, state) {
        if (state.confirm == ShelterConfirmStatus.sent) {
          context.read<MapBloc>().add(const MapRefreshRequested());
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(l10n.shelterConfirmed)));
        } else if (state.confirm == ShelterConfirmStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(Formatters.failure(l10n, state.failure ?? Exception()))),
          );
        }
      },
      builder: (context, state) {
        final shelter = state.shelter;
        return Scaffold(
          appBar: TarczaAppBar(
            eyebrow: l10n.shelterTitle,
            title: Text(shelter?.name ?? l10n.sheltersTitle),
          ),
          body: shelter == null
              ? (state.loading
                    ? const Center(child: CircularProgressIndicator())
                    : ErrorView(
                        message: Formatters.failure(l10n, state.failure ?? Exception()),
                        onRetry: context.read<ShelterDetailCubit>().load,
                      ))
              : _ShelterDetails(
                  shelter: shelter,
                  sending: state.confirm == ShelterConfirmStatus.sending,
                ),
        );
      },
    );
  }
}

class _ShelterDetails extends StatelessWidget {
  const _ShelterDetails({required this.shelter, required this.sending});

  final Shelter shelter;
  final bool sending;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forShelter(shelter.status);
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        SizedBox(
          height: 180,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radius),
            child: IgnorePointer(
              child: FlutterMap(
                options: MapOptions(initialCenter: shelter.location, initialZoom: 16),
                children: [
                  osmTileLayer(),
                  mapLabelsLayer(),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: shelter.location,
                        width: 40,
                        height: 40,
                        child: IconCircleMarker(icon: Icons.night_shelter, color: color, size: 40),
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
              StatusChip(label: shelter.statusLabel, color: color, icon: shelter.status.icon),
              const SizedBox(height: 12),
              InfoRow(label: l10n.shelterName, value: shelter.name),
              if (shelter.address != null)
                InfoRow(label: l10n.shelterAddress, value: shelter.address!),
              if (shelter.distanceMeters != null)
                InfoRow(
                  label: l10n.shelterDistanceLabel,
                  value: l10n.shelterDistance(Formatters.distance(l10n, shelter.distanceMeters!)),
                ),
              if (shelter.occupancy != ShelterOccupancy.unknown || shelter.occupancyLabel != null)
                InfoRow(
                  label: l10n.shelterOccupancy,
                  value: shelter.occupancyLabel ?? shelter.occupancy.label(l10n),
                ),
              if (shelter.availabilityLabel != null)
                InfoRow(label: l10n.shelterAvailability, value: shelter.availabilityLabel!),
              if (shelter.capacity != null)
                InfoRow(
                  label: l10n.shelterCapacity,
                  value: l10n.shelterCapacityValue(shelter.capacity!),
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          icon: Icons.fact_check_outlined,
          label: l10n.shelterConfirm,
          loading: sending,
          onPressed: () => _showConfirmSheet(context),
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          icon: Icons.report_problem_outlined,
          label: l10n.shelterReport,
          onPressed: () => context.push(
            AppRoutes.reportObject,
            extra: ReportStart(
              type: IncidentType.shelterIssue,
              candidate: PoiCandidate(
                poi: PoiRef(
                  kind: PoiKind.shelter,
                  id: shelter.id,
                  name: shelter.name,
                  location: shelter.location,
                ),
                location: shelter.location,
                subtitle: shelter.address,
                distanceMeters: shelter.distanceMeters,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          icon: Icons.map_outlined,
          label: l10n.incidentShowOnMap,
          onPressed: () {
            context.read<MapBloc>().add(MapFocusRequested([shelter.location], zoom: 16.5));
            context.go(AppRoutes.map);
          },
        ),
      ],
    );
  }

  void _showConfirmSheet(BuildContext context) {
    final cubit = context.read<ShelterDetailCubit>();
    unawaited(
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (_) => _ConfirmSheet(
          initial: shelter.status,
          initialOccupancy: shelter.occupancy,
          onSubmit: (status, occupancy, comment) =>
              cubit.confirmStatus(status, occupancy: occupancy, comment: comment),
        ),
      ),
    );
  }
}

class _ConfirmSheet extends StatefulWidget {
  const _ConfirmSheet({
    required this.initial,
    required this.initialOccupancy,
    required this.onSubmit,
  });

  final ShelterStatus initial;
  final ShelterOccupancy initialOccupancy;
  final void Function(ShelterStatus status, ShelterOccupancy? occupancy, String comment) onSubmit;

  @override
  State<_ConfirmSheet> createState() => _ConfirmSheetState();
}

class _ConfirmSheetState extends State<_ConfirmSheet> {
  late ShelterStatus _status = widget.initial;
  late ShelterOccupancy _occupancy = widget.initialOccupancy;
  final _comment = TextEditingController();

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.statusColors;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20 + MediaQuery.viewInsetsOf(context).bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.shelterConfirmTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          for (final status in ShelterStatus.values)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Material(
                color: _status == status
                    ? colors.forShelter(status).withValues(alpha: 0.14)
                    : TarczaPalette.surfaceAlt,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _status == status ? colors.forShelter(status) : TarczaPalette.outline,
                    width: _status == status ? 2 : 1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() {
                    _status = status;
                    if (status == ShelterStatus.full) _occupancy = ShelterOccupancy.full;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        Icon(status.icon, color: colors.forShelter(status)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            status.label(l10n),
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (_status == status) Icon(Icons.check, color: colors.forShelter(status)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          // Zapełnienie tylko dla otwartego schronu — dla „Zamknięty” pomijamy (`§19`).
          if (_status == ShelterStatus.open) ...[
            const SizedBox(height: 8),
            Text(l10n.shelterConfirmOccupancy, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final o in [
                  ShelterOccupancy.plenty,
                  ShelterOccupancy.limited,
                  ShelterOccupancy.unknown,
                ])
                  ChoiceChip(
                    avatar: Icon(o.icon, size: 18),
                    label: Text(o.label(l10n)),
                    selected: _occupancy == o,
                    onSelected: (_) => setState(() => _occupancy = o),
                  ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          const SizedBox(height: 4),
          TextField(
            controller: _comment,
            maxLength: 500,
            decoration: InputDecoration(
              labelText: l10n.shelterConfirmComment,
              hintText: l10n.shelterConfirmCommentHint,
            ),
          ),
          PrimaryButton(
            label: l10n.shelterConfirmSend,
            onPressed: () {
              widget.onSubmit(
                _status,
                switch (_status) {
                  ShelterStatus.closed => null,
                  ShelterStatus.full => ShelterOccupancy.full,
                  _ => _occupancy,
                },
                _comment.text,
              );
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
