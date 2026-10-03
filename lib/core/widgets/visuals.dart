import "package:flutter/material.dart";

import "package:tarcza_polska/data/models/enums.dart";
import "package:tarcza_polska/l10n/app_localizations.dart";

/// Ikony i etykiety zapasowe dla enumów. Etykiety preferencyjnie z backendu
/// (`typeLabel`, `statusLabel`, `confidenceLabel`); te tutaj tylko tam, gdzie API ich nie daje.
extension IncidentTypeVisuals on IncidentType {
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
