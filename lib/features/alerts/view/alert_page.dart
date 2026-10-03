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
          backgroundColor: alert == null ? null : Color.lerp(color, Colors.white, 0.9),
          appBar: TarczaAppBar(
            showLogo: false,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            automaticallyImplyLeading: false,
            title: Text(l10n.alertFrom),
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
    final dark = Color.lerp(color, Colors.black, 0.35)!;
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
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                    child: Icon(alert.severity.icon, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 20),
                  StatusChip(
                    label: alert.severity.label(l10n),
                    color: color,
                    icon: alert.severity.icon,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    alert.title,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: dark, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 14),
                  Text(alert.body, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 18),
                  Text(
                    l10n.alertExpires(Formatters.clock(alert.expiresAt)),
                    style: TextStyle(color: dark),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ProceduresSection(procedures: procedures),
                  ),
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
