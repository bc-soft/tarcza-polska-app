import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

class IncidentState extends Equatable {
  const IncidentState({
    this.incident,
    this.loading = true,
    this.failure,
    this.timeline = const [],
    this.procedures = const [],
  });

  final Incident? incident;
  final bool loading;
  final TarczaFailure? failure;

  /// Oś czasu (`GET /incidents/{id}/timeline`), rosnąco.
  final List<IncidentTimelineEntry> timeline;

  /// „Co robić” dla typu incydentu (`GET /procedures?type=`).
  final List<Procedure> procedures;

  IncidentState copyWith({
    Incident? incident,
    bool? loading,
    TarczaFailure? failure,
    List<IncidentTimelineEntry>? timeline,
    List<Procedure>? procedures,
  }) => IncidentState(
    incident: incident ?? this.incident,
    loading: loading ?? this.loading,
    failure: failure,
    timeline: timeline ?? this.timeline,
    procedures: procedures ?? this.procedures,
  );

  @override
  List<Object?> get props => [incident, loading, failure, timeline, procedures];
}

/// Szczegóły incydentu (`GET /incidents/{id}`) z osią czasu i procedurami, odświeżane co
/// [refreshInterval], żeby było widać zmianę confidence i zasięgu.
class IncidentCubit extends Cubit<IncidentState> {
  IncidentCubit({
    required this._repository,
    required this._guidance,
    required this.incidentId,
    Incident? initial,
    this.refreshInterval = const Duration(seconds: 15),
  }) : super(IncidentState(incident: initial, loading: initial == null));

  final IncidentRepository _repository;
  final GuidanceRepository _guidance;
  final String incidentId;
  final Duration refreshInterval;
  Timer? _timer;
  bool _proceduresLoaded = false;

  Future<void> load() async {
    _timer?.cancel();
    try {
      final incident = await _repository.getIncident(incidentId);
      if (isClosed) return;
      emit(state.copyWith(incident: incident, loading: false));
      await Future.wait([_loadTimeline(), if (!_proceduresLoaded) _loadProcedures(incident.type)]);
    } on TarczaFailure catch (e) {
      if (isClosed) return;
      emit(state.copyWith(loading: false, failure: e));
    }
    if (!isClosed) _timer = Timer(refreshInterval, load);
  }

  /// Oś czasu i procedury są dodatkiem — ich błąd nie psuje ekranu.
  Future<void> _loadTimeline() async {
    try {
      final timeline = await _repository.getTimeline(incidentId);
      if (!isClosed) emit(state.copyWith(timeline: timeline));
    } on TarczaFailure {
      // Zostaje poprzednia oś czasu.
    }
  }

  Future<void> _loadProcedures(IncidentType type) async {
    try {
      final procedures = await _guidance.getProcedures(type: type);
      _proceduresLoaded = true;
      if (!isClosed) emit(state.copyWith(procedures: procedures));
    } on TarczaFailure {
      // Spróbujemy przy kolejnym odświeżeniu.
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
