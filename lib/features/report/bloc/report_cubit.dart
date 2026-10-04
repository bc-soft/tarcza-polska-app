import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

/// Flow obszarowy: typ → lokalizacja → opcjonalny opis → wyślij → podziękowanie.
/// Flow punktowy (paliwo, schron): typ → obiekt (+ paliwa) → opis → wyślij.
enum ReportStep { type, location, object, description, success }

/// Obiekt do wyboru w zgłoszeniu punktowym (stacja / schron z odległością).
class PoiCandidate extends Equatable {
  const PoiCandidate({
    required this.poi,
    required this.location,
    this.subtitle,
    this.distanceMeters,
  });

  final PoiRef poi;
  final LatLng location;
  final String? subtitle;
  final double? distanceMeters;

  @override
  List<Object?> get props => [poi, location, subtitle, distanceMeters];
}

/// Start zgłoszenia z ekranu obiektu (schron, stacja): typ i obiekt są już znane.
class ReportStart {
  const ReportStart({required this.type, required this.candidate});

  final IncidentType type;
  final PoiCandidate candidate;
}

class ReportState extends Equatable {
  const ReportState({
    this.step = ReportStep.type,
    this.types = defaultReportTypes,
    this.type,
    this.position,
    this.candidates = const [],
    this.candidatesLoading = false,
    this.poi,
    this.fuels = const {},
    this.description = "",
    this.submitting = false,
    this.receipt,
    this.status,
    this.failure,
  });

  static const maxDescription = 1000;

  final ReportStep step;
  final List<ReportTypeOption> types;
  final ReportTypeOption? type;

  /// Pozycja zgłoszenia (obszarowe) albo urządzenia (punktowe — backend aktualizuje pozycję).
  final LatLng? position;
  final List<PoiCandidate> candidates;
  final bool candidatesLoading;
  final PoiCandidate? poi;

  /// Brakujące paliwa (tylko `fuel_shortage`, co najmniej jedno).
  final Set<FuelType> fuels;
  final String description;
  final bool submitting;
  final ReportReceipt? receipt;

  /// Status po wysłaniu — `incident` jest `null`, dopóki backend nie połączy zgłoszenia.
  final ReportStatus? status;
  final TarczaFailure? failure;

  bool get isPoint => type?.isPoint ?? false;

  bool get needsFuels => type?.poiKind == PoiKind.fuelStation;

  bool get descriptionTooLong => description.length > maxDescription;

  bool get objectReady => poi != null && (!needsFuels || fuels.isNotEmpty);

  bool get canSubmit =>
      type != null &&
      !descriptionTooLong &&
      !submitting &&
      (isPoint ? objectReady : position != null);

  ReportState copyWith({
    ReportStep? step,
    List<ReportTypeOption>? types,
    ReportTypeOption? type,
    LatLng? position,
    List<PoiCandidate>? candidates,
    bool? candidatesLoading,
    PoiCandidate? poi,
    Set<FuelType>? fuels,
    String? description,
    bool? submitting,
    ReportReceipt? receipt,
    ReportStatus? status,
    TarczaFailure? failure,
  }) => ReportState(
    step: step ?? this.step,
    types: types ?? this.types,
    type: type ?? this.type,
    position: position ?? this.position,
    candidates: candidates ?? this.candidates,
    candidatesLoading: candidatesLoading ?? this.candidatesLoading,
    poi: poi ?? this.poi,
    fuels: fuels ?? this.fuels,
    description: description ?? this.description,
    submitting: submitting ?? this.submitting,
    receipt: receipt ?? this.receipt,
    status: status ?? this.status,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    step,
    types,
    type,
    position,
    candidates,
    candidatesLoading,
    poi,
    fuels,
    description,
    submitting,
    receipt,
    status,
    failure,
  ];
}

class ReportCubit extends Cubit<ReportState> {
  ReportCubit({
    required this._repository,
    required this._fuelStations,
    required this._shelters,
    this.statusPollInterval = const Duration(seconds: 2),
    this.statusPollAttempts = 5,
  }) : super(const ReportState());

  final ReportRepository _repository;
  final FuelStationRepository _fuelStations;
  final ShelterRepository _shelters;
  final Duration statusPollInterval;
  final int statusPollAttempts;
  Timer? _pollTimer;

  /// Zgłoszenie otwarte z ekranu schronu / stacji ([startWith]).
  bool startedFromObject = false;

  /// Typy z backendu (z `scope` / `poiKind` / `fuelTypes`); przy błędzie zostają wbudowane.
  Future<void> loadTypes() async {
    try {
      final types = (await _repository.getTypes())
          .where((t) => !hiddenReportTypes.contains(t.type))
          .toList();
      if (types.isNotEmpty && !isClosed) emit(state.copyWith(types: types));
    } on TarczaFailure {
      // Zostajemy przy liście wbudowanej.
    }
  }

  Future<void> selectType(ReportTypeOption type, {LatLng? defaultPosition}) async {
    final position = state.position ?? defaultPosition;
    if (!type.isPoint) {
      emit(state.copyWith(type: type, step: ReportStep.location, position: position));
      return;
    }
    emit(
      ReportState(
        types: state.types,
        type: type,
        step: ReportStep.object,
        position: position,
        candidatesLoading: position != null,
      ),
    );
    if (position == null) return;
    try {
      final candidates = await _nearby(type.poiKind!, position);
      if (isClosed) return;
      // Proponujemy najbliższy obiekt — użytkownik może zmienić.
      emit(
        state.copyWith(
          candidates: candidates,
          candidatesLoading: false,
          poi: candidates.firstOrNull,
        ),
      );
    } on TarczaFailure catch (e) {
      if (!isClosed) emit(state.copyWith(candidatesLoading: false, failure: e));
    }
  }

  /// Zgłoszenie z ekranu schronu / stacji — od razu krok obiektu z zaznaczonym obiektem.
  /// Lista najbliższych dochodzi w tle, żeby dało się jeszcze zmienić wybór na mapie.
  Future<void> startWith(ReportStart start, {LatLng? defaultPosition}) async {
    startedFromObject = true;
    final type =
        state.types.where((t) => t.type == start.type).firstOrNull ??
        defaultReportTypes.firstWhere((t) => t.type == start.type);
    emit(
      ReportState(
        types: state.types,
        type: type,
        step: ReportStep.object,
        position: defaultPosition,
        candidates: [start.candidate],
        poi: start.candidate,
      ),
    );
    if (type.poiKind == null) return;
    try {
      final nearby = await _nearby(type.poiKind!, defaultPosition ?? start.candidate.location);
      if (isClosed) return;
      emit(
        state.copyWith(
          candidates: [
            start.candidate,
            ...nearby.where((c) => c.poi.id != start.candidate.poi.id),
          ],
        ),
      );
    } on TarczaFailure {
      // Zostaje sam wskazany obiekt.
    }
  }

  Future<List<PoiCandidate>> _nearby(PoiKind kind, LatLng position) async => switch (kind) {
    PoiKind.fuelStation => [
      for (final s in await _fuelStations.getNearest(position))
        PoiCandidate(
          poi: PoiRef(kind: kind, id: s.id, name: s.name, location: s.location),
          location: s.location,
          subtitle: s.address,
          distanceMeters: s.distanceMeters,
        ),
    ],
    PoiKind.shelter => [
      for (final s in await _shelters.getNearest(position))
        PoiCandidate(
          poi: PoiRef(kind: kind, id: s.id, name: s.name, location: s.location),
          location: s.location,
          subtitle: s.address,
          distanceMeters: s.distanceMeters,
        ),
    ],
  };

  void selectPoi(PoiCandidate candidate) => emit(state.copyWith(poi: candidate));

  void toggleFuel(FuelType fuel) {
    final next = {...state.fuels};
    if (!next.remove(fuel)) next.add(fuel);
    emit(state.copyWith(fuels: next));
  }

  void confirmObject() {
    if (state.objectReady) emit(state.copyWith(step: ReportStep.description));
  }

  void setPosition(LatLng position) => emit(state.copyWith(position: position));

  void confirmLocation() {
    if (state.position != null) emit(state.copyWith(step: ReportStep.description));
  }

  void setDescription(String value) => emit(state.copyWith(description: value));

  void back() {
    final previous = switch (state.step) {
      ReportStep.location || ReportStep.object => ReportStep.type,
      ReportStep.description => state.isPoint ? ReportStep.object : ReportStep.location,
      _ => state.step,
    };
    emit(state.copyWith(step: previous));
  }

  Future<void> submit() async {
    if (!state.canSubmit) return;
    emit(state.copyWith(submitting: true));
    try {
      final receipt = await _repository.createReport(
        type: state.type!.type,
        position: state.position ?? state.poi!.location,
        description: state.description,
        poiId: state.isPoint ? state.poi?.poi.id : null,
        fuelTypes: state.needsFuels ? state.fuels.toList() : const [],
      );
      emit(state.copyWith(submitting: false, receipt: receipt, step: ReportStep.success));
      _pollStatus(receipt.reportId, statusPollAttempts);
    } on TarczaFailure catch (e) {
      // 429 i inne błędy: komunikat bez automatycznego ponawiania.
      // 422 `poi_required` (brak obiektu w pobliżu) — wracamy do wyboru obiektu.
      final poiMissing = e is ValidationFailure && e.violations.containsKey("poiId");
      emit(
        state.copyWith(
          submitting: false,
          failure: e,
          step: poiMissing ? ReportStep.object : null,
        ),
      );
    }
  }

  void _pollStatus(String reportId, int attemptsLeft) {
    _pollTimer?.cancel();
    if (attemptsLeft <= 0) return;
    _pollTimer = Timer(statusPollInterval, () async {
      try {
        final status = await _repository.getReportStatus(reportId);
        if (isClosed) return;
        emit(state.copyWith(status: status));
        if (status.incident == null) _pollStatus(reportId, attemptsLeft - 1);
      } on TarczaFailure {
        if (!isClosed) _pollStatus(reportId, attemptsLeft - 1);
      }
    });
  }

  void reset() {
    _pollTimer?.cancel();
    emit(ReportState(types: state.types));
  }

  @override
  Future<void> close() {
    _pollTimer?.cancel();
    return super.close();
  }
}
