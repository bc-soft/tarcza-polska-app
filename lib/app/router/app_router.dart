import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/alerts/view/alert_page.dart";
import "package:tarcza_polska/features/alerts/view/alerts_page.dart";
import "package:tarcza_polska/features/fuel_stations/view/fuel_station_page.dart";
import "package:tarcza_polska/features/incident/view/incident_page.dart";
import "package:tarcza_polska/features/map/view/incidents_page.dart";
import "package:tarcza_polska/features/map/view/map_page.dart";
import "package:tarcza_polska/features/onboarding/view/onboarding_page.dart";
import "package:tarcza_polska/features/report/bloc/report_cubit.dart";
import "package:tarcza_polska/features/report/view/report_page.dart";
import "package:tarcza_polska/features/settings/view/demo_page.dart";
import "package:tarcza_polska/features/settings/view/home_address_page.dart";
import "package:tarcza_polska/features/settings/view/more_page.dart";
import "package:tarcza_polska/features/settings/view/preview_page.dart";
import "package:tarcza_polska/features/settings/view/settings_page.dart";
import "package:tarcza_polska/features/shell/view/app_shell.dart";
import "package:tarcza_polska/features/shelters/view/shelter_page.dart";
import "package:tarcza_polska/features/shelters/view/shelters_page.dart";
import "package:tarcza_polska/features/verification/view/verification_page.dart";

/// Ścieżki aplikacji. Deep linki z pushy: `/verification/:id`, `/alerts/:id`.
abstract final class AppRoutes {
  static const onboarding = "/onboarding";
  static const map = "/map";
  static const report = "/report";
  static const reportObject = "/report-object";
  static const alerts = "/alerts";
  static const more = "/more";
  static const shelters = "/shelters";
  static const incidents = "/incidents";
  static const settings = "/settings";
  static const homeAddress = "/settings/home";
  static const demo = "/demo";
  static const preview = "/preview";

  static String verification(String id) => "/verification/$id";

  static String alert(String id) => "$alerts/$id";

  static String incident(String id) => "/incident/$id";

  static String shelter(String id) => "/shelter/$id";

  static String fuelStation(String id) => "/fuel-station/$id";
}

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "root");

GoRouter createRouter(AppPreferences prefs) => GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.map,
  redirect: (context, state) {
    final onboarding = state.matchedLocation == AppRoutes.onboarding;
    if (!prefs.onboardingDone) return onboarding ? null : AppRoutes.onboarding;
    return onboarding ? AppRoutes.map : null;
  },
  routes: [
    GoRoute(path: AppRoutes.onboarding, builder: (_, _) => const OnboardingPage()),
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => AppShell(shell: shell),
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: AppRoutes.map, builder: (_, _) => const MapPage())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: AppRoutes.report, builder: (_, _) => const ReportPage())],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.alerts,
              builder: (_, _) => const AlertsPage(),
              routes: [
                GoRoute(
                  path: ":id",
                  parentNavigatorKey: rootNavigatorKey,
                  pageBuilder: (_, state) => MaterialPage(
                    fullscreenDialog: true,
                    child: AlertPage(alertId: state.pathParameters["id"]!),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: AppRoutes.more, builder: (_, _) => const MorePage())],
        ),
      ],
    ),
    GoRoute(
      path: "/verification/:id",
      pageBuilder: (_, state) => MaterialPage(
        fullscreenDialog: true,
        child: VerificationPage(verificationId: state.pathParameters["id"]!),
      ),
    ),
    GoRoute(
      path: "/incident/:id",
      builder: (_, state) => IncidentPage(incidentId: state.pathParameters["id"]!),
    ),
    GoRoute(path: AppRoutes.incidents, builder: (_, _) => const IncidentsPage()),
    // Zgłoszenie z ekranu schronu / stacji (poza zakładką „Zgłoś”).
    GoRoute(
      path: AppRoutes.reportObject,
      builder: (_, state) =>
          ReportPage(start: state.extra is ReportStart ? state.extra! as ReportStart : null),
    ),
    GoRoute(path: AppRoutes.shelters, builder: (_, _) => const SheltersPage()),
    GoRoute(
      path: "/shelter/:id",
      builder: (_, state) => ShelterPage(
        shelterId: state.pathParameters["id"]!,
        initial: state.extra is Shelter ? state.extra! as Shelter : null,
      ),
    ),
    GoRoute(
      path: "/fuel-station/:id",
      builder: (_, state) => FuelStationPage(
        stationId: state.pathParameters["id"]!,
        initial: state.extra is FuelStation ? state.extra! as FuelStation : null,
      ),
    ),
    GoRoute(path: AppRoutes.settings, builder: (_, _) => const SettingsPage()),
    GoRoute(path: AppRoutes.homeAddress, builder: (_, _) => const HomeAddressPage()),
    GoRoute(path: AppRoutes.demo, builder: (_, _) => const DemoPage()),
    GoRoute(path: AppRoutes.preview, builder: (_, _) => const PreviewPage()),
  ],
);
