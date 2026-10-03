import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/features/onboarding/bloc/address_picker_cubit.dart";
import "package:tarcza_polska/features/onboarding/bloc/onboarding_cubit.dart";
import "package:tarcza_polska/features/onboarding/view/address_picker_view.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => OnboardingCubit(
          push: getIt(),
          locationService: getIt(),
          device: getIt(),
          locationCubit: context.read<LocationCubit>(),
          preferences: getIt(),
        ),
      ),
      BlocProvider(create: (_) => AddressPickerCubit(locationService: getIt())),
    ],
    child: const OnboardingView(),
  );
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) => BlocConsumer<OnboardingCubit, OnboardingState>(
    listenWhen: (a, b) => !a.done && b.done,
    listener: (context, _) => context.go(AppRoutes.map),
    builder: (context, state) {
      final progressIndex = OnboardingState.progressSteps.indexOf(state.step);
      final canGoBack = progressIndex >= 0;
      return Scaffold(
        appBar: state.step == OnboardingStep.welcome
            ? null
            : AppBar(
                leading: canGoBack
                    ? IconButton(
                        tooltip: context.l10n.commonBack,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: context.read<OnboardingCubit>().back,
                      )
                    : null,
                automaticallyImplyLeading: false,
                title: progressIndex < 0
                    ? null
                    : Text(
                        context.l10n.onbStepOf(
                          progressIndex + 1,
                          OnboardingState.progressSteps.length,
                        ),
                        style: const TextStyle(fontSize: 15, color: TarczaPalette.textSecondary),
                      ),
                bottom: progressIndex < 0
                    ? null
                    : PreferredSize(
                        preferredSize: const Size.fromHeight(4),
                        child: LinearProgressIndicator(
                          value: (progressIndex + 1) / OnboardingState.progressSteps.length,
                          backgroundColor: TarczaPalette.outline,
                        ),
                      ),
              ),
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: KeyedSubtree(key: ValueKey(state.step), child: _step(context, state)),
          ),
        ),
      );
    },
  );

  Widget _step(BuildContext context, OnboardingState state) {
    final l10n = context.l10n;
    final cubit = context.read<OnboardingCubit>();
    return switch (state.step) {
      OnboardingStep.welcome => _InfoStep(
        icon: Icons.shield_outlined,
        title: l10n.onbWelcomeTitle,
        body: l10n.onbWelcomeBody,
        note: l10n.onbWelcomeAnon,
        primary: PrimaryButton(label: l10n.onbStart, onPressed: cubit.start),
      ),
      OnboardingStep.notifications => _InfoStep(
        icon: Icons.notifications_active_outlined,
        title: l10n.onbNotificationsTitle,
        body: l10n.onbNotificationsBody,
        primary: PrimaryButton(
          label: l10n.onbNotificationsAllow,
          onPressed: cubit.requestNotifications,
        ),
        secondary: TextButton(onPressed: cubit.skipNotifications, child: Text(l10n.commonNotNow)),
      ),
      OnboardingStep.home => Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.onbHomeTitle, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(l10n.onbHomeBody, style: const TextStyle(color: TarczaPalette.textSecondary)),
            const SizedBox(height: 14),
            Expanded(child: AddressPickerView(onConfirm: cubit.confirmHome)),
          ],
        ),
      ),
      OnboardingStep.location => _InfoStep(
        icon: Icons.location_on_outlined,
        title: l10n.onbLocationTitle,
        body: l10n.onbLocationBody,
        primary: PrimaryButton(label: l10n.onbLocationAllow, onPressed: cubit.requestLocation),
        secondary: TextButton(onPressed: cubit.skipLocation, child: Text(l10n.onbLocationSkip)),
      ),
      OnboardingStep.watchMode => _InfoStep(
        icon: Icons.radar_outlined,
        title: l10n.onbWatchTitle,
        body: l10n.onbWatchBody,
        note: l10n.onbWatchDetail,
        primary: PrimaryButton(label: l10n.onbWatchEnable, onPressed: cubit.enableWatchMode),
        secondary: TextButton(onPressed: cubit.skipWatchMode, child: Text(l10n.commonNotNow)),
      ),
      OnboardingStep.finishing =>
        state.failure == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(l10n.onbFinishing),
                  ],
                ),
              )
            : ErrorView(message: l10n.onbRegisterError, onRetry: cubit.finish),
    };
  }
}

class _InfoStep extends StatelessWidget {
  const _InfoStep({
    required this.icon,
    required this.title,
    required this.body,
    required this.primary,
    this.secondary,
    this.note,
  });

  final IconData icon;
  final String title;
  final String body;
  final String? note;
  final Widget primary;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Center(
          child: Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              color: TarczaPalette.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 54, color: TarczaPalette.primary),
          ),
        ),
        const SizedBox(height: 28),
        Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 14),
        Text(
          body,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge
              ?.copyWith(color: TarczaPalette.textSecondary),
        ),
        if (note != null) ...[
          const SizedBox(height: 18),
          TarczaCard(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const Icon(Icons.lock_outline, size: 20, color: TarczaPalette.primary),
                const SizedBox(width: 10),
                Expanded(child: Text(note!, style: Theme.of(context).textTheme.bodySmall)),
              ],
            ),
          ),
        ],
        const Spacer(),
        primary,
        if (secondary != null) ...[const SizedBox(height: 8), secondary!],
      ],
    ),
  );
}
