import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/shell/view/app_coordinator.dart";

/// Dolny pasek: Mapa, Zgłoś, Alerty, Więcej (`docs/07`).
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  static const alertsTabIndex = 2;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final unseen = context.select((AlertsCubit c) => c.state.unseenCount);
    return AppCoordinator(
      child: Scaffold(
        body: shell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: shell.currentIndex,
          onDestinationSelected: (index) {
            if (index == alertsTabIndex) {
              // Otwarcie zakładki = alerty obejrzane (zeruje odznakę).
              final cubit = context.read<AlertsCubit>();
              cubit.markSeen(cubit.state.alerts.map((a) => a.id));
            }
            shell.goBranch(index, initialLocation: index == shell.currentIndex);
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.map_outlined),
              selectedIcon: const Icon(Icons.map),
              label: l10n.navMap,
            ),
            NavigationDestination(
              icon: const Icon(Icons.add_circle_outline),
              selectedIcon: const Icon(Icons.add_circle),
              label: l10n.navReport,
            ),
            NavigationDestination(
              icon: Badge(
                isLabelVisible: unseen > 0,
                label: Text("$unseen"),
                child: const Icon(Icons.notifications_outlined),
              ),
              selectedIcon: Badge(
                isLabelVisible: unseen > 0,
                label: Text("$unseen"),
                child: const Icon(Icons.notifications),
              ),
              label: l10n.navAlerts,
            ),
            NavigationDestination(
              icon: const Icon(Icons.menu),
              selectedIcon: const Icon(Icons.menu_open),
              label: l10n.navMore,
            ),
          ],
        ),
      ),
    );
  }
}
