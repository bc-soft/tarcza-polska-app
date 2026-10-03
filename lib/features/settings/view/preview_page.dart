import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/push/local_notifications.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/mock/demo_scenario.dart";
import "package:tarcza_polska/data/mock/mock_backend.dart";
import "package:tarcza_polska/data/mock/mock_repositories.dart";
import "package:tarcza_polska/data/mock/mock_seed.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/alerts/view/alert_page.dart";
import "package:tarcza_polska/features/fuel_stations/view/fuel_station_page.dart";
import "package:tarcza_polska/features/incident/view/incident_page.dart";
import "package:tarcza_polska/features/shelters/view/shelter_page.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";
import "package:tarcza_polska/features/verification/view/verification_page.dart";

/// Podgląd ekranów ze stałymi danymi (ustawienia dev). Działa w każdym trybie — na własnym,
/// prywatnym `MockBackend`, więc nie dotyka prawdziwego backendu ani globalnych BLoC-ów.
class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  late final MockBackend _backend = MockBackend(latency: Duration.zero);
  late final MockPushService _push = MockPushService(LocalNotifications());

  late final DemoScenario _scenario;

  @override
  void initState() {
    super.initState();
    // Stan „potwierdzona awaria + alert” ze scenariusza demo (bez wysyłania pushy).
    // Jawnie tutaj — leniwe `late final` nie wykonałoby `goTo` przed pierwszym `build`.
    _scenario = DemoScenario(_backend, _push)..goTo(DemoStep.confirmed);
    final now = _backend.now;
    _backend.alerts[DemoScenario.alertId] = Alert(
      id: DemoScenario.alertId,
      title: "Potwierdzono awarię prądu",
      body:
          "Problem zgłasza 86% odpowiadających użytkowników w Twojej okolicy. "
          "Najbliższy otwarty punkt pomocy: Schron — Szkoła Podstawowa, ul. Kościelna 12.",
      severity: AlertSeverity.warning,
      incidentId: DemoScenario.incidentId,
      createdAt: now,
      expiresAt: now.add(const Duration(hours: 3)),
      area: _backend.incidents[DemoScenario.incidentId]?.area,
    );
  }

  @override
  void dispose() {
    _scenario.dispose();
    _push.dispose();
    _backend.dispose();
    super.dispose();
  }

  Future<void> _open(Widget page) =>
      Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => page));

  /// Świeże pytanie przy każdym otwarciu — odliczanie startuje od 90 s.
  Future<void> _openQuestion(
    IncidentType type,
    String question,
    String context, {
    PoiRef? poi,
  }) {
    const id = "preview-verification";
    final now = _backend.now;
    _backend.questions[id] = VerificationQuestion(
      verificationId: id,
      incidentId: DemoScenario.incidentId,
      type: type,
      typeLabel: MockSeed.typeLabel(type),
      question: question,
      context: context,
      poi: poi,
      sentAt: now,
      expiresAt: now.add(const Duration(seconds: 90)),
    );
    return _open(
      BlocProvider(
        create: (_) => VerificationBloc(repository: MockVerificationRepository(_backend)),
        child: const VerificationPage(verificationId: id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final incident = _backend.incidents[DemoScenario.incidentId]!;
    final shelter = _backend.shelters.values.first;
    final station = _backend.fuelStations.values.first;
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.previewTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(l10n.previewHint, style: const TextStyle(color: TarczaPalette.textSecondary)),
          SectionHeader(l10n.previewVerification),
          TarczaCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTileRow(
                  icon: Icons.power_off_outlined,
                  title: l10n.previewQuestionPower,
                  subtitle: "Czy w tej chwili masz dostęp do prądu?",
                  onTap: () => _openQuestion(
                    IncidentType.powerOutage,
                    "Czy w tej chwili masz dostęp do prądu?",
                    "W Twojej okolicy zgłoszono: brak prądu.",
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.water_drop_outlined,
                  title: l10n.previewQuestionWater,
                  subtitle: "Czy w tej chwili masz dostęp do wody w kranie?",
                  onTap: () => _openQuestion(
                    IncidentType.waterOutage,
                    "Czy w tej chwili masz dostęp do wody w kranie?",
                    "W Twojej okolicy zgłoszono: brak wody.",
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.local_gas_station_outlined,
                  title: l10n.previewQuestionFuel,
                  subtitle: "Czy na stacji BP Bukowska jest teraz dostępne paliwo: Olej napędowy?",
                  onTap: () => _openQuestion(
                    IncidentType.fuelShortage,
                    "Czy na stacji BP Bukowska jest teraz dostępne paliwo: Olej napędowy?",
                    "Zgłoszono: brak paliwa. Pytamy o obiekt: BP Bukowska.",
                    poi: const PoiRef(
                      kind: PoiKind.fuelStation,
                      id: "station-02",
                      name: "BP Bukowska",
                    ),
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.warning_amber_outlined,
                  title: l10n.previewQuestionGeneric,
                  subtitle: "Czy widzisz dym w okolicy?",
                  onTap: () => _openQuestion(
                    IncidentType.otherThreat,
                    "Czy widzisz dym w okolicy?",
                    "W Twojej okolicy zgłoszono: inne zagrożenie.",
                  ),
                ),
              ],
            ),
          ),
          SectionHeader(l10n.previewScreens),
          TarczaCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTileRow(
                  icon: Icons.info_outline,
                  title: l10n.incidentTitle,
                  subtitle: "${incident.typeLabel} · ${incident.confidenceLabel}",
                  onTap: () => _open(
                    IncidentPage(
                      incidentId: incident.id,
                      initial: incident,
                      repository: MockIncidentRepository(_backend),
                      guidance: MockGuidanceRepository(_backend),
                    ),
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.warning_amber_rounded,
                  title: l10n.alertFrom,
                  subtitle: _backend.alerts[DemoScenario.alertId]!.title,
                  onTap: () => _open(
                    AlertPage(
                      alertId: DemoScenario.alertId,
                      repository: MockAlertRepository(_backend),
                      incidents: MockIncidentRepository(_backend),
                      guidance: MockGuidanceRepository(_backend),
                    ),
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.local_gas_station_outlined,
                  title: station.name,
                  subtitle: l10n.fuelStationShortage,
                  onTap: () => _open(
                    FuelStationPage(
                      stationId: station.id,
                      initial: station,
                      repository: MockFuelStationRepository(_backend),
                    ),
                  ),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.night_shelter_outlined,
                  title: shelter.name,
                  subtitle: shelter.statusLabel,
                  onTap: () => _open(
                    ShelterPage(
                      shelterId: shelter.id,
                      initial: shelter,
                      repository: MockShelterRepository(_backend),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
