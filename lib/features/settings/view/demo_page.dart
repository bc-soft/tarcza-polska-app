import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/mock/demo_scenario.dart";
import "package:tarcza_polska/data/mock/geo_shapes.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/settings/bloc/demo_cubit.dart";

/// Sterowanie scenariuszem demo (`docs/09`) — tylko tryb mock.
class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!AppConfig.useMocks) {
      return Scaffold(
        appBar: TarczaAppBar(title: Text(l10n.demoTitle)),
        body: Padding(padding: const EdgeInsets.all(24), child: Text(l10n.demoOnlyMock)),
      );
    }
    return BlocProvider(
      create: (_) => DemoCubit(getIt<DemoScenario>()),
      child: const DemoView(),
    );
  }
}

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  void _showOnMap(BuildContext context) {
    context.read<MapBloc>().add(
      MapFocusRequested([
        GeoShapes.offset(DemoScenario.center, northMeters: 900, eastMeters: -900),
        GeoShapes.offset(DemoScenario.center, northMeters: -900, eastMeters: 900),
      ]),
    );
    context.go(AppRoutes.map);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.demoTitle)),
      body: BlocBuilder<DemoCubit, DemoState>(
        builder: (context, state) {
          final cubit = context.read<DemoCubit>();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
            children: [
              SectionHeader(l10n.demoCurrentStep),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    for (final step in DemoStep.values)
                      ListTileRow(
                        icon: step.index < state.step.index
                            ? Icons.check_circle
                            : step == state.step
                            ? Icons.play_circle_fill
                            : Icons.radio_button_unchecked,
                        iconColor: step.index <= state.step.index
                            ? TarczaPalette.primary
                            : TarczaPalette.textSecondary,
                        title: step.label,
                        onTap: () => cubit.goTo(step),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                icon: Icons.skip_next,
                label: state.step.next == null ? l10n.demoFinished : l10n.demoNext,
                onPressed: state.step.next == null ? null : cubit.next,
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                icon: Icons.map_outlined,
                label: l10n.demoShowOnMap,
                onPressed: () => _showOnMap(context),
              ),
              const SizedBox(height: 12),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: SwitchListTile(
                  title: Text(l10n.demoAutoplay),
                  subtitle: Text(l10n.demoAutoplaySub),
                  value: state.autoplay,
                  onChanged: (v) => cubit.setAutoplay(enabled: v),
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: cubit.reset,
                icon: const Icon(Icons.restart_alt),
                label: Text(l10n.demoReset),
              ),
            ],
          );
        },
      ),
    );
  }
}
