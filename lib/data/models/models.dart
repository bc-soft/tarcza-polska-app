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

    /// Etykieta statusu z backendu; `null` w danych mockowych — UI ma etykietę zapasową.
    String? statusLabel,
    required ConfidenceLevel confidenceLevel,
    required String confidenceLabel,

    /// 0–1, pokazujemy jako procent. Liczone wyłącznie przez backend.
    required double confidenceScore,
    required DateTime startedAt,
    required DateTime lastActivityAt,
    DateTime? lastConfirmedAt,
    required Community community,
    String? summary,

    /// `null`, dopóki zasięg nie jest wyznaczony (status `detected`). Na mapie taki
    /// incydent przychodzi jako `Point` (centroid zgłoszeń).
    GeoArea? area,

    /// `point` — dotyczy jednego obiektu ([poi]); geometria to `Point`, bez poligonu.
    @Default(ReportScope.area) ReportScope scope,
    PoiRef? poi,

    /// Brakujące paliwa (tylko `fuel_shortage`).
    @Default(<FuelType>[]) List<FuelType> fuelTypes,
  }) = _Incident;
}

@freezed
abstract class Shelter with _$Shelter {
  const factory Shelter({
    required String id,
    required String name,

    /// Schrony dodane ręcznie przez operatora mogą nie mieć adresu.
    String? address,
    required LatLng location,
    required ShelterStatus status,
    required String statusLabel,
    int? capacity,
    DateTime? lastConfirmedAt,
    @Default(0) int confirmationCount,

    /// Tylko w wariancie „najbliższe” (`?lat&lng`).
    double? distanceMeters,
    @Default(ShelterOccupancy.unknown) ShelterOccupancy occupancy,
    String? occupancyLabel,

    /// Tryb otwarcia z rejestru krajowego (Całodobowo / Na żądanie / …) — niezależny od statusu.
    String? availabilityLabel,
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

/// Obiekt, którego dotyczy zgłoszenie / pytanie punktowe (stacja paliw, schron).
@freezed
abstract class PoiRef with _$PoiRef {
  const factory PoiRef({
    required PoiKind kind,
    required String id,
    required String name,
    LatLng? location,
  }) = _PoiRef;
}

@freezed
abstract class FuelStatus with _$FuelStatus {
  const factory FuelStatus({
    required FuelType type,
    required String label,
    required FuelAvailability status,
    required String statusLabel,
    DateTime? confirmedAt,
  }) = _FuelStatus;
}

/// Stacja paliw z dostępnością każdego paliwa (zgłoszenia punktowe `fuel_shortage`).
@freezed
abstract class FuelStation with _$FuelStation {
  const factory FuelStation({
    required String id,
    required String name,
    String? brand,
    String? address,
    required LatLng location,
    @Default(<FuelStatus>[]) List<FuelStatus> fuels,

    /// Co najmniej jedno paliwo zgłoszone jako niedostępne.
    @Default(false) bool shortage,
    @Default(<FuelType>[]) List<FuelType> missingFuelTypes,
    DateTime? lastConfirmedAt,
    @Default(0) int confirmationCount,
    double? distanceMeters,
  }) = _FuelStation;
}

/// Wpis osi czasu incydentu (`GET /incidents/{id}/timeline`) — `label` gotowy po polsku.
@freezed
abstract class IncidentTimelineEntry with _$IncidentTimelineEntry {
  const factory IncidentTimelineEntry({
    required String type,
    required String label,
    required DateTime at,
    @Default(<String, dynamic>{}) Map<String, dynamic> details,
  }) = _IncidentTimelineEntry;
}

/// Procedura „co robić” (`GET /procedures?type=`).
@freezed
abstract class Procedure with _$Procedure {
  const factory Procedure({
    required String id,
    required String title,
    required String summary,
    @Default(<String>[]) List<String> steps,
    @Default(<IncidentType>[]) List<IncidentType> appliesTo,
    @Default(0) int priority,
  }) = _Procedure;
}

/// Element warstwy mapy (`properties.kind`).
@freezed
sealed class MapFeature with _$MapFeature {
  const factory MapFeature.incident(Incident incident) = IncidentFeature;

  const factory MapFeature.shelter(Shelter shelter) = ShelterFeature;

  const factory MapFeature.fuelStation(FuelStation station) = FuelStationFeature;

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

    /// Obiekt, o który pytamy (może to być sąsiednia stacja, nie ta zgłoszona).
    PoiRef? poi,
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

@freezed
abstract class FuelTypeOption with _$FuelTypeOption {
  const factory FuelTypeOption({required FuelType type, required String label}) = _FuelTypeOption;
}

/// Typ zgłoszenia z etykietą (`GET /reports/types`).
@freezed
abstract class ReportTypeOption with _$ReportTypeOption {
  const factory ReportTypeOption({
    required IncidentType type,
    required String label,
    @Default(ReportScope.area) ReportScope scope,
    PoiKind? poiKind,
    @Default(<FuelTypeOption>[]) List<FuelTypeOption> fuelTypes,
  }) = _ReportTypeOption;

  const ReportTypeOption._();

  bool get isPoint => scope == ReportScope.point && poiKind != null;
}

const _defaultFuelTypes = <FuelTypeOption>[
  FuelTypeOption(type: FuelType.pb95, label: "Benzyna 95"),
  FuelTypeOption(type: FuelType.pb98, label: "Benzyna 98"),
  FuelTypeOption(type: FuelType.diesel, label: "Olej napędowy"),
  FuelTypeOption(type: FuelType.lpg, label: "LPG"),
];

/// Typy, których mieszkańcy nie zgłaszają z aplikacji (decyzja produktowa); incydenty tych
/// typów z backendu nadal pokazujemy na mapie.
const hiddenReportTypes = {IncidentType.roadBlocked};

/// Wbudowana lista typów (te same wartości i etykiety co `GET /reports/types`) —
/// używana, zanim przyjdzie odpowiedź z backendu albo gdy zapytanie się nie uda.
const defaultReportTypes = <ReportTypeOption>[
  ReportTypeOption(type: IncidentType.powerOutage, label: "Brak prądu"),
  ReportTypeOption(type: IncidentType.waterOutage, label: "Brak wody"),
  ReportTypeOption(
    type: IncidentType.fuelShortage,
    label: "Brak paliwa",
    scope: ReportScope.point,
    poiKind: PoiKind.fuelStation,
    fuelTypes: _defaultFuelTypes,
  ),
  ReportTypeOption(
    type: IncidentType.shelterIssue,
    label: "Problem ze schronem",
    scope: ReportScope.point,
    poiKind: PoiKind.shelter,
  ),
  ReportTypeOption(type: IncidentType.otherThreat, label: "Inne zagrożenie"),
];

/// Odpowiedź 202 na `POST /reports`.
@freezed
abstract class ReportReceipt with _$ReportReceipt {
  const factory ReportReceipt({
    required String reportId,
    String? h3Cell,
    required DateTime createdAt,
    @Default(ReportScope.area) ReportScope scope,
    PoiRef? poi,
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
    String? typeLabel,
    String? statusLabel,
    String? confidenceLabel,
  }) = _ReportIncidentRef;
}

/// `GET /reports/{id}` — `incident` może być `null`, dopóki backend nie dołączy zgłoszenia.
@freezed
abstract class ReportStatus with _$ReportStatus {
  const factory ReportStatus({
    required String reportId,
    required IncidentType type,
    String? typeLabel,
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
    LocationSource? locationSource,

    /// `preferences.locationRefresh` — zgoda na przypomnienia `location_refresh`.
    @Default(true) bool locationRefresh,
  }) = _DeviceProfile;
}

/// Adres domowy — trzymany lokalnie (`shared_preferences`); do backendu idą tylko współrzędne.
@freezed
abstract class HomeAddress with _$HomeAddress {
  const factory HomeAddress({required String label, required LatLng location}) = _HomeAddress;
}
