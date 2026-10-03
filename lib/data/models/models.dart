import "package:freezed_annotation/freezed_annotation.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/data/models/enums.dart";
import "package:tarcza_polska/data/models/geo.dart";

export "enums.dart";
export "geo.dart";

part "models.freezed.dart";

/// Zagregowane dane społeczności dla incydentu.
@freezed
abstract class Community with _$Community {
  const factory Community({
    @Default(0) int reports,
    @Default(0) int answers,

    /// `null`, gdy nikt jeszcze nie odpowiedział.
    int? agreementPct,
  }) = _Community;
}

/// Incydent w widoku Citizen. Nie zawiera pozycji pojedynczych zgłoszeń.
@freezed
abstract class Incident with _$Incident {
  const factory Incident({
    required String id,
    required IncidentType type,
    required String typeLabel,
    required IncidentStatus status,
    required ConfidenceLevel confidenceLevel,
    required String confidenceLabel,

    /// 0–1, pokazujemy jako procent. Liczone wyłącznie przez backend.
    required double confidenceScore,
    required DateTime startedAt,
    required DateTime lastActivityAt,
    DateTime? lastConfirmedAt,
    required Community community,
    String? summary,
    required GeoArea area,
  }) = _Incident;
}

@freezed
abstract class Shelter with _$Shelter {
  const factory Shelter({
    required String id,
    required String name,
    required String address,
    required LatLng location,
    required ShelterStatus status,
    required String statusLabel,
    int? capacity,
    DateTime? lastConfirmedAt,
    @Default(0) int confirmationCount,

    /// Tylko w wariancie „najbliższe” (`?lat&lng`).
    double? distanceMeters,
  }) = _Shelter;
}

@freezed
abstract class Alert with _$Alert {
  const factory Alert({
    required String id,
    required String title,
    required String body,
    required AlertSeverity severity,
    String? incidentId,
    DateTime? createdAt,
    required DateTime expiresAt,
    @Default(true) bool active,

    /// Tylko w `GET /alerts/{id}` i na mapie.
    GeoArea? area,
  }) = _Alert;
}

/// Element warstwy mapy (`properties.kind`).
@freezed
sealed class MapFeature with _$MapFeature {
  const factory MapFeature.incident(Incident incident) = IncidentFeature;

  const factory MapFeature.shelter(Shelter shelter) = ShelterFeature;

  const factory MapFeature.alert(Alert alert) = AlertFeature;
}

@freezed
abstract class VerificationQuestion with _$VerificationQuestion {
  const factory VerificationQuestion({
    required String verificationId,
    required String incidentId,
    required IncidentType type,
    required String typeLabel,
    required String question,
    required String context,
    @Default(VerificationAnswer.values) List<VerificationAnswer> options,
    required DateTime sentAt,
    required DateTime expiresAt,
    @Default(false) bool answered,
  }) = _VerificationQuestion;

  const VerificationQuestion._();

  bool isExpiredAt(DateTime now) => !now.isBefore(expiresAt);
}

@freezed
abstract class VerificationResult with _$VerificationResult {
  const factory VerificationResult({
    required String verificationId,
    required String incidentId,
    required String thanks,
  }) = _VerificationResult;
}

/// Typ zgłoszenia z etykietą (`GET /reports/types`).
@freezed
abstract class ReportTypeOption with _$ReportTypeOption {
  const factory ReportTypeOption({required IncidentType type, required String label}) =
      _ReportTypeOption;
}

/// Wbudowana lista typów (te same wartości i etykiety co `GET /reports/types`) —
/// używana, zanim przyjdzie odpowiedź z backendu albo gdy zapytanie się nie uda.
const defaultReportTypes = <ReportTypeOption>[
  ReportTypeOption(type: IncidentType.powerOutage, label: "Brak prądu"),
  ReportTypeOption(type: IncidentType.waterOutage, label: "Brak wody"),
  ReportTypeOption(type: IncidentType.fuelShortage, label: "Brak paliwa"),
  ReportTypeOption(type: IncidentType.roadBlocked, label: "Nieprzejezdna droga"),
  ReportTypeOption(type: IncidentType.shelterIssue, label: "Problem ze schronem"),
  ReportTypeOption(type: IncidentType.otherThreat, label: "Inne zagrożenie"),
];

/// Odpowiedź 202 na `POST /reports`.
@freezed
abstract class ReportReceipt with _$ReportReceipt {
  const factory ReportReceipt({
    required String reportId,
    String? h3Cell,
    required DateTime createdAt,
  }) = _ReportReceipt;
}

/// Skrót incydentu, do którego trafiło zgłoszenie.
@freezed
abstract class ReportIncidentRef with _$ReportIncidentRef {
  const factory ReportIncidentRef({
    required String id,
    required IncidentStatus status,
    required ConfidenceLevel confidenceLevel,
    required double confidenceScore,
  }) = _ReportIncidentRef;
}

/// `GET /reports/{id}` — `incident` może być `null`, dopóki backend nie dołączy zgłoszenia.
@freezed
abstract class ReportStatus with _$ReportStatus {
  const factory ReportStatus({
    required String reportId,
    required IncidentType type,
    required DateTime createdAt,
    ReportIncidentRef? incident,
  }) = _ReportStatus;
}

@freezed
abstract class DeviceProfile with _$DeviceProfile {
  const factory DeviceProfile({
    required String deviceId,
    String? platform,
    @Default(false) bool hasPushToken,
    LatLng? lastLocation,
    String? h3Cell,
    DateTime? locationUpdatedAt,
  }) = _DeviceProfile;
}

/// Adres domowy — trzymany lokalnie (`shared_preferences`); do backendu idą tylko współrzędne.
@freezed
abstract class HomeAddress with _$HomeAddress {
  const factory HomeAddress({required String label, required LatLng location}) = _HomeAddress;
}
