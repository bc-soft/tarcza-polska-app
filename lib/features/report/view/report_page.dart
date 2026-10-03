import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/report/bloc/report_cubit.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => ReportCubit(repository: getIt())..loadTypes(),
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
        appBar: AppBar(
          title: Text(l10n.reportTitle),
          leading: switch (state.step) {
            ReportStep.location || ReportStep.description => IconButton(
              tooltip: l10n.commonBack,
              icon: const Icon(Icons.arrow_back),
              onPressed: context.read<ReportCubit>().back,
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
    final position = context.read<LocationCubit>().state.effectivePosition;
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
            childAspectRatio: 1.25,
            children: [
              for (final option in state.types)
                TarczaCard(
                  onTap: () => context.read<ReportCubit>().selectType(
                    option,
                    defaultPosition: position,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(option.type.icon, size: 36, color: TarczaPalette.primary),
                      const SizedBox(height: 10),
                      Text(
                        option.label,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
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
              fallbackCenter: location.effectivePosition ?? defaultMapCenter,
              extraMarkers: [
                if (location.homeAddress != null)
                  Marker(
                    point: location.homeAddress!.location,
                    width: 28,
                    height: 28,
                    child: const IconCircleMarker(
                      icon: Icons.home_rounded,
                      color: TarczaPalette.primaryDark,
                      size: 28,
                    ),
                  ),
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
                  if (location.position != null)
                    Expanded(
                      child: SecondaryButton(
                        icon: Icons.my_location,
                        label: l10n.reportUseMyLocation,
                        onPressed: () => cubit.setPosition(location.position!),
                      ),
                    ),
                  if (location.position != null && location.homeAddress != null)
                    const SizedBox(width: 12),
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
                      child: Text(
                        state.type!.label,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Icon(Icons.place_outlined, color: TarczaPalette.textSecondary),
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
                  hintText: l10n.reportDescriptionHint,
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
          : ConfidenceBadge(
              level: incident.confidenceLevel,
              label: state.type?.label ?? "",
              score: incident.confidenceScore,
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
