import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

/// Alerty dla obszaru urządzenia. `AlertsCubit` jest globalny (odznaka na zakładce).
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) => const AlertsView();
}

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  Future<void> _refresh(BuildContext context) => context.read<AlertsCubit>().refresh(
    context.read<LocationCubit>().state.effectivePosition,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.alertsTitle), eyebrow: l10n.mapCommandCenter),
      body: BlocBuilder<AlertsCubit, AlertsState>(
        builder: (context, state) {
          if (state.status == AlertsStatus.initial || state.status == AlertsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == AlertsStatus.failure) {
            return ErrorView(
              message: Formatters.failure(l10n, state.failure!),
              onRetry: () => _refresh(context),
            );
          }
          return RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: state.alerts.isEmpty
                ? ListView(
                    children: [
                      const SizedBox(height: 90),
                      const Center(
                        child: PanelIcon(icon: Icons.notifications_none, size: 64),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        l10n.alertsEmpty,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          l10n.alertsEmptyHint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: TarczaPalette.textSecondary),
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.alerts.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 12),
                    itemBuilder: (context, index) => _AlertTile(alert: state.alerts[index]),
                  ),
          );
        },
      ),
    );
  }
}

class _AlertTile extends StatelessWidget {
  const _AlertTile({required this.alert});

  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final color = context.statusColors.forSeverity(alert.severity);
    return TarczaCard(
      accent: color,
      onTap: () => context.push(AppRoutes.alert(alert.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              StatusChip(
                label: alert.severity.label(l10n),
                color: color,
                icon: alert.severity.icon,
                dense: true,
              ),
              const Spacer(),
              if (alert.createdAt != null)
                DataText(
                  Formatters.relative(l10n, alert.createdAt!),
                  size: 11,
                  color: TarczaPalette.textMuted,
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(alert.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 6),
          Text(
            alert.body,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: TarczaPalette.textSecondary),
          ),
          const SizedBox(height: 10),
          DataText(
            l10n.alertExpires(Formatters.clock(alert.expiresAt)),
            size: 11,
            color: TarczaPalette.textMuted,
          ),
        ],
      ),
    );
  }
}
