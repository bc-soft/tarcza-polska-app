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

  /// Etykiety wszystkich typów — także tych, których nie da się zgłosić z aplikacji (droga).
  static const _typeLabels = {
    IncidentType.powerOutage: "Brak prądu",
    IncidentType.waterOutage: "Brak wody",
    IncidentType.fuelShortage: "Brak paliwa",
    IncidentType.roadBlocked: "Nieprzejezdna droga",
    IncidentType.shelterIssue: "Problem ze schronem",
    IncidentType.otherThreat: "Inne zagrożenie",
  };

  static String typeLabel(IncidentType type) => _typeLabels[type]!;

  static const confidenceLabels = {
    ConfidenceLevel.unverified: "Niezweryfikowane",
    ConfidenceLevel.likely: "Prawdopodobne",
    ConfidenceLevel.high: "Wysoka wiarygodność",
    ConfidenceLevel.confirmed: "Potwierdzone",
  };

  static const fuelLabels = {
    FuelType.pb95: "Benzyna 95",
    FuelType.pb98: "Benzyna 98",
    FuelType.diesel: "Olej napędowy",
    FuelType.lpg: "LPG",
  };

  static const occupancyLabels = {
    ShelterOccupancy.plenty: "Dużo miejsc",
    ShelterOccupancy.limited: "Mało miejsc",
    ShelterOccupancy.full: "Pełny",
    ShelterOccupancy.unknown: "Brak danych o miejscach",
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
      occupancy: ShelterOccupancy.plenty,
      occupancyLabel: "Dużo miejsc",
      availabilityLabel: "Całodobowo",
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
      occupancy: ShelterOccupancy.full,
      occupancyLabel: "Pełny",
      availabilityLabel: "Na żądanie",
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

  static List<FuelStation> fuelStations(DateTime now) => [
    FuelStation(
      id: "station-01",
      name: "Orlen Dąbrowskiego",
      brand: "Orlen",
      address: "ul. Dąbrowskiego 120, Poznań",
      location: const LatLng(52.4166, 16.8905),
      fuels: [
        FuelStatus(
          type: FuelType.pb95,
          label: "Benzyna 95",
          status: FuelAvailability.available,
          statusLabel: "Dostępne",
          confirmedAt: now.subtract(const Duration(minutes: 8)),
        ),
        FuelStatus(
          type: FuelType.diesel,
          label: "Olej napędowy",
          status: FuelAvailability.unavailable,
          statusLabel: "Brak",
          confirmedAt: now.subtract(const Duration(minutes: 8)),
        ),
        const FuelStatus(
          type: FuelType.lpg,
          label: "LPG",
          status: FuelAvailability.unknown,
          statusLabel: "Brak danych",
        ),
      ],
      shortage: true,
      missingFuelTypes: const [FuelType.diesel],
      lastConfirmedAt: now.subtract(const Duration(minutes: 8)),
      confirmationCount: 4,
    ),
    FuelStation(
      id: "station-02",
      name: "BP Bukowska",
      brand: "BP",
      address: "ul. Bukowska 3, Poznań",
      location: const LatLng(52.4071, 16.8978),
      fuels: [
        for (final (type, label) in const [
          (FuelType.pb95, "Benzyna 95"),
          (FuelType.pb98, "Benzyna 98"),
          (FuelType.diesel, "Olej napędowy"),
        ])
          FuelStatus(
            type: type,
            label: label,
            status: FuelAvailability.available,
            statusLabel: "Dostępne",
            confirmedAt: now.subtract(const Duration(minutes: 25)),
          ),
      ],
      lastConfirmedAt: now.subtract(const Duration(minutes: 25)),
      confirmationCount: 2,
    ),
  ];

  static const procedures = <Procedure>[
    Procedure(
      id: "power-outage",
      title: "Brak prądu",
      summary: "Zabezpiecz sprzęt i oszczędzaj baterie — awaria może potrwać kilka godzin.",
      steps: [
        "Wyłącz z gniazdek wrażliwe urządzenia (komputer, telewizor).",
        "Ogranicz otwieranie lodówki i zamrażarki.",
        "Oszczędzaj baterię telefonu — włącz tryb oszczędzania energii.",
        "Sprawdzaj komunikaty w Tarczy i lokalnym radiu.",
      ],
      appliesTo: [IncidentType.powerOutage],
      priority: 90,
    ),
    Procedure(
      id: "water-outage",
      title: "Brak wody",
      summary: "Korzystaj z zapasów wody pitnej i punktów poboru wskazanych przez wodociągi.",
      steps: [
        "Nie pij wody z kranu po przywróceniu dostaw, dopóki nie spłynie przez kilka minut.",
        "Sprawdź komunikat wodociągów o beczkowozach w okolicy.",
      ],
      appliesTo: [IncidentType.waterOutage],
      priority: 80,
    ),
    Procedure(
      id: "general",
      title: "W każdej sytuacji kryzysowej",
      summary: "Zachowaj spokój i sprawdzaj wiarygodne źródła informacji.",
      steps: [
        "Miej naładowany telefon i powerbank.",
        "Sprawdź, czy sąsiedzi (zwłaszcza starsze osoby) potrzebują pomocy.",
        "W zagrożeniu życia dzwoń pod 112.",
      ],
      priority: 10,
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
      area: GeoShapes.hexArea(
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
