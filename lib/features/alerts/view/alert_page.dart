import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/guidance_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";

/// Pełnoekranowy alert z komunikatem operatora (INFORM).
class AlertPage extends StatelessWidget {
  const AlertPage({
    super.key,
    required this.alertId,
    this.repository,
    this.incidents,
    this.guidance,
  });

  final String alertId;

  /// Podgląd ekranów (ustawienia dev) podaje własne repozytorium ze stałymi danymi.
  final AlertRepository? repository;
  final IncidentRepository? incidents;
  final GuidanceRepository? guidance;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => AlertDetailCubit(
      repository: repository ?? getIt(),
      incidents: incidents ?? getIt(),
      guidance: guidance ?? getIt(),
      alertId: alertId,
    )..load(),
    child: const AlertView(),
  );
}

class AlertView extends StatelessWidget {
  const AlertView({super.key});

  void _close(BuildContext context) {
    // `Navigator` obsługuje i strony go_router, i trasy otwarte imperatywnie (podgląd ekranów).
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
    } else {
      context.go(AppRoutes.alerts);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<AlertDetailCubit, AlertDetailState>(
      listenWhen: (a, b) => a.alert?.id != b.alert?.id && b.alert != null,
      listener: (context, state) => context.read<AlertsCubit>().markSeen([state.alert!.id]),
      builder: (context, state) {
        final alert = state.alert;
        final color = alert == null
            ? Theme.of(context).colorScheme.primary
            : context.statusColors.forSeverity(alert.severity);
        return Scaffold(
          // Tło jak na pozostałych ekranach — kolor ważności niosą odznaka i ikona,
          // podbarwianie całego ekranu brudziło jasną paletę.
          appBar: TarczaAppBar(
            showLogo: false,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            automaticallyImplyLeading: false,
            divider: false,
            eyebrow: l10n.alertFrom,
            eyebrowColor: alert == null ? TarczaPalette.primary : color,
            title: Text(l10n.mapCommandCenter),
            actions: [
              IconButton(
                tooltip: l10n.commonClose,
                icon: const Icon(Icons.close),
                onPressed: () => _close(context),
              ),
            ],
          ),
          body: SafeArea(
            child: alert == null
                ? (state.loading
                      ? const Center(child: CircularProgressIndicator())
                      : ErrorView(
                          message: Formatters.failure(l10n, state.failure ?? Exception()),
                          onRetry: context.read<AlertDetailCubit>().load,
                        ))
                : _AlertBody(alert: alert, color: color, procedures: state.procedures),
          ),
        );
      },
    );
  }
}

class _AlertBody extends StatelessWidget {
  const _AlertBody({required this.alert, required this.color, required this.procedures});

  final Alert alert;
  final Color color;
  final List<Procedure> procedures;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PanelIcon(
                        icon: alert.severity.icon,
                        color: color,
                        size: 56,
                        tinted: true,
                      ),
                      const SizedBox(width: 14),
                      PanelBadge(
                        label: alert.severity.label(l10n),
                        color: color,
                        filled: alert.severity == AlertSeverity.danger,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DisplayHeading(alert.title, size: 32, maxLines: 4),
                  const SizedBox(height: 14),
                  Text(
                    alert.body,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 18),
                  DataText(
                    l10n.alertExpires(Formatters.clock(alert.expiresAt)),
                    size: 11.5,
                    color: TarczaPalette.textMuted,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ProceduresSection(procedures: procedures),
                  ),
                  // Oddech między przewijaną treścią a przyciskami pod spodem.
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          PrimaryButton(
            icon: Icons.map_outlined,
            label: l10n.alertShowOnMap,
            onPressed: () {
              final points = alert.area?.outlinePoints ?? const [];
              if (points.isNotEmpty) {
                context.read<MapBloc>().add(
                  MapFocusRequested(points, selectIncidentId: alert.incidentId),
                );
              }
              context.go(AppRoutes.map);
            },
          ),
          const SizedBox(height: 12),
          SecondaryButton(
            icon: Icons.night_shelter_outlined,
            label: l10n.alertNearestShelter,
            onPressed: () => context.push(AppRoutes.shelters),
          ),
        ],
      ),
    );
  }
}
