import "package:flutter/material.dart";

import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/l10n/app_localizations.dart";

/// Ikony i etykiety zapasowe dla enumów. Etykiety preferencyjnie z backendu
/// (`typeLabel`, `statusLabel`, `confidenceLabel`); te tutaj tylko tam, gdzie API ich nie daje.
extension IncidentTypeVisuals on IncidentType {
  /// Krótki opis pod nazwą typu w kroku „Co się dzieje?”.
  String description(AppLocalizations l10n) => switch (this) {
    IncidentType.powerOutage => l10n.reportTypePowerOutageDesc,
    IncidentType.waterOutage => l10n.reportTypeWaterOutageDesc,
    IncidentType.fuelShortage => l10n.reportTypeFuelShortageDesc,
    IncidentType.roadBlocked => l10n.reportTypeRoadBlockedDesc,
    IncidentType.shelterIssue => l10n.reportTypeShelterIssueDesc,
    IncidentType.otherThreat => l10n.reportTypeOtherThreatDesc,
  };

  /// Podpowiedź w polu opisu zgłoszenia.
  String descriptionHint(AppLocalizations l10n) => switch (this) {
    IncidentType.powerOutage => l10n.reportTypePowerOutageHint,
    IncidentType.waterOutage => l10n.reportTypeWaterOutageHint,
    IncidentType.fuelShortage => l10n.reportTypeFuelShortageHint,
    IncidentType.roadBlocked => l10n.reportTypeRoadBlockedHint,
    IncidentType.shelterIssue => l10n.reportTypeShelterIssueHint,
    IncidentType.otherThreat => l10n.reportTypeOtherThreatHint,
  };

  IconData get icon => switch (this) {
    IncidentType.powerOutage => Icons.power_off_outlined,
    IncidentType.waterOutage => Icons.water_drop_outlined,
    IncidentType.fuelShortage => Icons.local_gas_station_outlined,
    IncidentType.roadBlocked => Icons.block_outlined,
    IncidentType.shelterIssue => Icons.night_shelter_outlined,
    IncidentType.otherThreat => Icons.warning_amber_outlined,
  };
}

extension ConfidenceVisuals on ConfidenceLevel {
  IconData get icon => switch (this) {
    ConfidenceLevel.unverified => Icons.help_outline,
    ConfidenceLevel.likely => Icons.report_outlined,
    ConfidenceLevel.high => Icons.verified_outlined,
    ConfidenceLevel.confirmed => Icons.verified,
  };

  String hint(AppLocalizations l10n) => switch (this) {
    ConfidenceLevel.unverified => l10n.confidenceHintUnverified,
    ConfidenceLevel.likely => l10n.confidenceHintLikely,
    ConfidenceLevel.high => l10n.confidenceHintHigh,
    ConfidenceLevel.confirmed => l10n.confidenceHintConfirmed,
  };
}

extension IncidentLabels on Incident {
  /// `statusLabel` z backendu; etykieta lokalna tylko jako zapas (np. dane mockowe).
  String statusText(AppLocalizations l10n) => statusLabel ?? status.label(l10n);
}

extension IncidentStatusVisuals on IncidentStatus {
  String label(AppLocalizations l10n) => switch (this) {
    IncidentStatus.detected => l10n.statusDetected,
    IncidentStatus.verifying => l10n.statusVerifying,
    IncidentStatus.active => l10n.statusActive,
    IncidentStatus.resolved => l10n.statusResolved,
  };
}

extension ShelterStatusVisuals on ShelterStatus {
  IconData get icon => switch (this) {
    ShelterStatus.open => Icons.check_circle_outline,
    ShelterStatus.full => Icons.groups_outlined,
    ShelterStatus.closed => Icons.lock_outline,
    ShelterStatus.unknown => Icons.help_outline,
  };

  String label(AppLocalizations l10n) => switch (this) {
    ShelterStatus.open => l10n.shelterOpen,
    ShelterStatus.full => l10n.shelterFull,
    ShelterStatus.closed => l10n.shelterClosed,
    ShelterStatus.unknown => l10n.shelterUnknown,
  };
}

extension AlertSeverityVisuals on AlertSeverity {
  IconData get icon => switch (this) {
    AlertSeverity.info => Icons.info_outline,
    AlertSeverity.warning => Icons.warning_amber_rounded,
    AlertSeverity.danger => Icons.dangerous_outlined,
  };

  String label(AppLocalizations l10n) => switch (this) {
    AlertSeverity.info => l10n.severityInfo,
    AlertSeverity.warning => l10n.severityWarning,
    AlertSeverity.danger => l10n.severityDanger,
  };
}

extension FuelTypeVisuals on FuelType {
  /// Nazwa do wyświetlenia: etykieta z API, z wyjątkiem oleju napędowego, który w aplikacji
  /// nazywamy krótko „Diesel” (decyzja produktowa).
  String displayLabel(AppLocalizations l10n, [String? apiLabel]) =>
      this == FuelType.diesel ? l10n.fuelDiesel : (apiLabel ?? label(l10n));

  /// Etykieta zapasowa — w danych z API etykieta przychodzi razem z typem (`label`).
  String label(AppLocalizations l10n) => switch (this) {
    FuelType.pb95 => l10n.fuelPb95,
    FuelType.pb98 => l10n.fuelPb98,
    FuelType.diesel => l10n.fuelDiesel,
    FuelType.lpg => l10n.fuelLpg,
  };
}

extension FuelAvailabilityVisuals on FuelAvailability {
  IconData get icon => switch (this) {
    FuelAvailability.available => Icons.check_circle_outline,
    FuelAvailability.unavailable => Icons.cancel_outlined,
    FuelAvailability.unknown => Icons.help_outline,
  };
}

extension ShelterOccupancyVisuals on ShelterOccupancy {
  IconData get icon => switch (this) {
    ShelterOccupancy.plenty => Icons.event_seat_outlined,
    ShelterOccupancy.limited => Icons.groups_2_outlined,
    ShelterOccupancy.full => Icons.no_accounts_outlined,
    ShelterOccupancy.unknown => Icons.help_outline,
  };

  String label(AppLocalizations l10n) => switch (this) {
    ShelterOccupancy.plenty => l10n.occupancyPlenty,
    ShelterOccupancy.limited => l10n.occupancyLimited,
    ShelterOccupancy.full => l10n.occupancyFull,
    ShelterOccupancy.unknown => l10n.occupancyUnknown,
  };
}

extension PoiKindVisuals on PoiKind {
  IconData get icon => switch (this) {
    PoiKind.fuelStation => Icons.local_gas_station,
    PoiKind.shelter => Icons.night_shelter,
  };
}
