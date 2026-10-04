import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";
import "package:tarcza_polska/features/shelters/bloc/shelters_cubit.dart";

class SheltersPage extends StatelessWidget {
  const SheltersPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) =>
        SheltersCubit(repository: getIt())
          ..loadNearest(context.read<LocationCubit>().state.bestPosition),
    child: const SheltersView(),
  );
}

class SheltersView extends StatelessWidget {
  const SheltersView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Future<void> reload() => context.read<SheltersCubit>().loadNearest(
      context.read<LocationCubit>().state.bestPosition,
    );
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.sheltersTitle)),
      body: BlocBuilder<SheltersCubit, SheltersState>(
        builder: (context, state) {
          if (state.loading && state.shelters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.failure != null && state.shelters.isEmpty) {
            return ErrorView(message: Formatters.failure(l10n, state.failure!), onRetry: reload);
          }
          if (state.shelters.isEmpty) return Center(child: Text(l10n.sheltersEmpty));
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.38,
                child: _SheltersMap(shelters: state.shelters),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: reload,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.shelters.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 10),
                    itemBuilder: (context, index) =>
                        ShelterTile(shelter: state.shelters[index], nearest: index == 0),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Mapa schronów: kolor znacznika = status, kamera obejmuje schrony i użytkownika.
class _SheltersMap extends StatelessWidget {
  const _SheltersMap({required this.shelters});

  final List<Shelter> shelters;

  @override
  Widget build(BuildContext context) {
    final colors = context.statusColors;
    final location = context.watch<LocationCubit>().state;
    final me = location.livePosition ?? location.position;
    final points = <LatLng>[
      ...shelters.map((s) => s.location),
      ?(me ?? location.homeAddress?.location),
    ];
    return FlutterMap(
      options: MapOptions(
        initialCenter: points.firstOrNull ?? defaultMapCenter,
        initialZoom: 14,
        initialCameraFit: points.length < 2
            ? null
            : CameraFit.coordinates(
                coordinates: points,
                padding: const EdgeInsets.fromLTRB(36, 36, 36, 28),
                maxZoom: 16,
              ),
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        osmTileLayer(),
        ClusteredMarkerLayer<Shelter>(
          items: shelters,
          pointOf: (s) => s.location,
          markerSize: 36,
          clusterColor: (group) => shelterGroupColor(context, group),
          clusterIcon: Icons.night_shelter,
          markerBuilder: (context, shelter) => GestureDetector(
            onTap: () => context.push(AppRoutes.shelter(shelter.id), extra: shelter),
            child: Semantics(
              label: "${shelter.name} — ${shelter.statusLabel}",
              child: IconCircleMarker(
                icon: Icons.night_shelter,
                color: colors.forShelter(shelter.status),
                size: 36,
              ),
            ),
          ),
        ),
        MarkerLayer(
          markers: [
            if (me != null) userLocationMarker(me),
            if (location.homeAddress != null) homeMarker(location.homeAddress!.location),
          ],
        ),
        const OsmAttribution(),
      ],
    );
  }
}

class ShelterTile extends StatelessWidget {
  const ShelterTile({super.key, required this.shelter, this.nearest = false});

  final Shelter shelter;
  final bool nearest;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forShelter(shelter.status);
    return TarczaCard(
      onTap: () => context.push(AppRoutes.shelter(shelter.id), extra: shelter),
      child: Row(
        children: [
          PanelIcon(icon: Icons.night_shelter_outlined, color: color, tinted: true),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shelter.name, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 2),
                Text(
                  [
                    if (shelter.distanceMeters != null)
                      Formatters.distance(l10n, shelter.distanceMeters!),
                    ?shelter.address,
                  ].join(" · "),
                  style: const TextStyle(color: TarczaPalette.textSecondary, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    StatusChip(
                      label: shelter.statusLabel,
                      color: color,
                      icon: shelter.status.icon,
                      dense: true,
                    ),
                    if (shelter.status == ShelterStatus.open &&
                        shelter.occupancy != ShelterOccupancy.unknown)
                      StatusChip(
                        label: shelter.occupancyLabel ?? shelter.occupancy.label(l10n),
                        color: shelter.occupancy == ShelterOccupancy.plenty
                            ? TarczaPalette.success
                            : TarczaPalette.likely,
                        icon: shelter.occupancy.icon,
                        dense: true,
                      ),
                    if (nearest)
                      StatusChip(
                        label: l10n.shelterNearestBadge,
                        color: TarczaPalette.primary,
                        icon: Icons.near_me_outlined,
                        dense: true,
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 20, color: TarczaPalette.textMuted),
        ],
      ),
    );
  }
}
