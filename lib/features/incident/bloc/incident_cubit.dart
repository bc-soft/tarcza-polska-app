import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

class IncidentState extends Equatable {
  const IncidentState({this.incident, this.loading = true, this.failure});

  final Incident? incident;
  final bool loading;
  final TarczaFailure? failure;

  @override
  List<Object?> get props => [incident, loading, failure];
}

/// Szczegóły incydentu (`GET /incidents/{id}`), odświeżane co [refreshInterval],
/// żeby było widać zmianę confidence i zasięgu.
class IncidentCubit extends Cubit<IncidentState> {
  IncidentCubit({
    required this._repository,
    required this.incidentId,
    this.refreshInterval = const Duration(seconds: 15),
  }) : super(const IncidentState());

  final IncidentRepository _repository;
  final String incidentId;
  final Duration refreshInterval;
  Timer? _timer;

  Future<void> load() async {
    _timer?.cancel();
    if (state.incident == null) emit(const IncidentState());
    try {
      final incident = await _repository.getIncident(incidentId);
      if (isClosed) return;
      emit(IncidentState(incident: incident, loading: false));
    } on TarczaFailure catch (e) {
      if (isClosed) return;
      emit(IncidentState(incident: state.incident, loading: false, failure: e));
    }
    if (!isClosed) _timer = Timer(refreshInterval, load);
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
