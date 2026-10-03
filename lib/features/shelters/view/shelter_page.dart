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
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/shelters/bloc/shelters_cubit.dart";

class ShelterPage extends StatelessWidget {
  const ShelterPage({super.key, required this.shelterId, this.initial});

  final String shelterId;
  final Shelter? initial;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) =>
        ShelterDetailCubit(repository: getIt(), shelterId: shelterId, initial: initial)..load(),
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
          appBar: AppBar(title: Text(shelter?.name ?? l10n.sheltersTitle)),
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
            borderRadius: BorderRadius.circular(14),
            child: IgnorePointer(
              child: FlutterMap(
                options: MapOptions(initialCenter: shelter.location, initialZoom: 16),
                children: [
                  osmTileLayer(),
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
              InfoRow(label: l10n.shelterAddress, value: shelter.address),
              if (shelter.distanceMeters != null)
                InfoRow(
                  label: l10n.shelterDistanceLabel,
                  value: l10n.shelterDistance(Formatters.distance(l10n, shelter.distanceMeters!)),
                ),
              if (shelter.capacity != null)
                InfoRow(
                  label: l10n.shelterCapacity,
                  value: l10n.shelterCapacityValue(shelter.capacity!),
                ),
              InfoRow(
                label: l10n.shelterLastConfirmed,
                value: shelter.lastConfirmedAt == null
                    ? l10n.shelterNever
                    : Formatters.relative(l10n, shelter.lastConfirmedAt!),
              ),
              InfoRow(label: l10n.shelterConfirmations, value: "${shelter.confirmationCount}"),
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
          onSubmit: (status, comment) => cubit.confirmStatus(status, comment: comment),
        ),
      ),
    );
  }
}

class _ConfirmSheet extends StatefulWidget {
  const _ConfirmSheet({required this.initial, required this.onSubmit});

  final ShelterStatus initial;
  final void Function(ShelterStatus status, String comment) onSubmit;

  @override
  State<_ConfirmSheet> createState() => _ConfirmSheetState();
}

class _ConfirmSheetState extends State<_ConfirmSheet> {
  late ShelterStatus _status = widget.initial;
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
    return Padding(
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
                    ? colors.forShelter(status).withValues(alpha: 0.12)
                    : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _status == status ? colors.forShelter(status) : TarczaPalette.outline,
                    width: _status == status ? 2 : 1,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => setState(() => _status = status),
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
              widget.onSubmit(_status, _comment.text);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
