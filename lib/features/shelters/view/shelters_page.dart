import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
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
          ..loadNearest(context.read<LocationCubit>().state.effectivePosition),
    child: const SheltersView(),
  );
}

class SheltersView extends StatelessWidget {
  const SheltersView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Future<void> reload() => context.read<SheltersCubit>().loadNearest(
      context.read<LocationCubit>().state.effectivePosition,
    );
    return Scaffold(
      appBar: AppBar(title: Text(l10n.sheltersTitle)),
      body: BlocBuilder<SheltersCubit, SheltersState>(
        builder: (context, state) {
          if (state.loading && state.shelters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.failure != null && state.shelters.isEmpty) {
            return ErrorView(message: Formatters.failure(l10n, state.failure!), onRetry: reload);
          }
          if (state.shelters.isEmpty) return Center(child: Text(l10n.sheltersEmpty));
          return RefreshIndicator(
            onRefresh: reload,
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.shelters.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) =>
                  ShelterTile(shelter: state.shelters[index], nearest: index == 0),
            ),
          );
        },
      ),
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
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.night_shelter_outlined, color: Color.lerp(color, Colors.black, 0.2)),
          ),
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
                    shelter.address,
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
          const Icon(Icons.chevron_right, color: TarczaPalette.textSecondary),
        ],
      ),
    );
  }
}
