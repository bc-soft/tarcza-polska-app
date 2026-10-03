import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/mock/geo_shapes.dart";
import "package:tarcza_polska/data/models/models.dart";

/// Dane seed trybu mock — Poznań, Jeżyce (`docs/09-demo-scenariusz.md`).
abstract final class MockSeed {
  /// Środek awarii prądu ze scenariusza (`make simulate` w backendzie).
  static const LatLng demoCenter = LatLng(52.4121, 16.9012);

  /// Proponowany adres domowy telefonu demo.
  static const HomeAddress demoHome = HomeAddress(
    label: "Jeżyce, Poznań (adres demo)",
    location: LatLng(52.4125, 16.9020),
  );

  static const reportTypes = defaultReportTypes;

  static String typeLabel(IncidentType type) => reportTypes.firstWhere((t) => t.type == type).label;

  static const confidenceLabels = {
    ConfidenceLevel.unverified: "Niezweryfikowane",
    ConfidenceLevel.likely: "Prawdopodobne",
    ConfidenceLevel.high: "Wysoka wiarygodność",
    ConfidenceLevel.confirmed: "Potwierdzone",
  };

  static const shelterLabels = {
    ShelterStatus.open: "Otwarty",
    ShelterStatus.full: "Pełny",
    ShelterStatus.closed: "Zamknięty",
    ShelterStatus.unknown: "Brak danych",
  };

  static List<Shelter> shelters(DateTime now) => [
    Shelter(
      id: "shelter-01",
      name: "Schron — Szkoła Podstawowa",
      address: "ul. Kościelna 12, Poznań",
      location: const LatLng(52.4152, 16.9071),
      status: ShelterStatus.open,
      statusLabel: shelterLabels[ShelterStatus.open]!,
      capacity: 320,
      lastConfirmedAt: now.subtract(const Duration(minutes: 12)),
      confirmationCount: 14,
    ),
    Shelter(
      id: "shelter-02",
      name: "Parking podziemny — Rynek Jeżycki",
      address: "ul. Szamarzewskiego 3, Poznań",
      location: const LatLng(52.4093, 16.9089),
      status: ShelterStatus.full,
      statusLabel: shelterLabels[ShelterStatus.full]!,
      capacity: 180,
      lastConfirmedAt: now.subtract(const Duration(minutes: 4)),
      confirmationCount: 22,
    ),
    Shelter(
      id: "shelter-03",
      name: "Piwnica — Zespół Szkół Technicznych",
      address: "ul. Dąbrowskiego 81, Poznań",
      location: const LatLng(52.4178, 16.8941),
      status: ShelterStatus.closed,
      statusLabel: shelterLabels[ShelterStatus.closed]!,
      capacity: 90,
      lastConfirmedAt: now.subtract(const Duration(hours: 2)),
      confirmationCount: 3,
    ),
    Shelter(
      id: "shelter-04",
      name: "Hala sportowa — Ogrody",
      address: "ul. Szczepanowskiego 7, Poznań",
      location: const LatLng(52.4062, 16.8952),
      status: ShelterStatus.unknown,
      statusLabel: shelterLabels[ShelterStatus.unknown]!,
      capacity: 450,
    ),
    Shelter(
      id: "shelter-05",
      name: "Przejście podziemne — Dworzec Zachodni",
      address: "ul. Głogowska 10, Poznań",
      location: const LatLng(52.4028, 16.9061),
      status: ShelterStatus.open,
      statusLabel: shelterLabels[ShelterStatus.open]!,
      capacity: 600,
      lastConfirmedAt: now.subtract(const Duration(minutes: 30)),
      confirmationCount: 9,
    ),
    Shelter(
      id: "shelter-06",
      name: "Centrum Kultury — piwnice",
      address: "ul. Św. Marcin 80, Poznań",
      location: const LatLng(52.4079, 16.9184),
      status: ShelterStatus.open,
      statusLabel: shelterLabels[ShelterStatus.open]!,
      capacity: 250,
      lastConfirmedAt: now.subtract(const Duration(minutes: 55)),
      confirmationCount: 5,
    ),
  ];

  /// Incydenty „w tle”, niezależne od scenariusza — żeby mapa nie była pusta.
  static List<Incident> backgroundIncidents(DateTime now) => [
    Incident(
      id: "incident-water-lazarz",
      type: IncidentType.waterOutage,
      typeLabel: typeLabel(IncidentType.waterOutage),
      status: IncidentStatus.verifying,
      confidenceLevel: ConfidenceLevel.likely,
      confidenceLabel: confidenceLabels[ConfidenceLevel.likely]!,
      confidenceScore: 0.55,
      startedAt: now.subtract(const Duration(minutes: 48)),
      lastActivityAt: now.subtract(const Duration(minutes: 6)),
      community: const Community(reports: 6, answers: 14, agreementPct: 71),
      summary: "Mieszkańcy zgłaszają brak wody w kilku budynkach.",
      area: GeoShapes.blob(
        const LatLng(52.3968, 16.8921),
        radiusMeters: 320,
        radial: const [1, 0.8, 1.15, 0.9, 1.05],
      ),
    ),
    Incident(
      id: "incident-road-wierzbiecice",
      type: IncidentType.roadBlocked,
      typeLabel: typeLabel(IncidentType.roadBlocked),
      status: IncidentStatus.detected,
      confidenceLevel: ConfidenceLevel.unverified,
      confidenceLabel: confidenceLabels[ConfidenceLevel.unverified]!,
      confidenceScore: 0.18,
      startedAt: now.subtract(const Duration(minutes: 9)),
      lastActivityAt: now.subtract(const Duration(minutes: 9)),
      community: const Community(reports: 1),
      area: const GeoArea.point(LatLng(52.4186, 16.9233)),
    ),
  ];
}
