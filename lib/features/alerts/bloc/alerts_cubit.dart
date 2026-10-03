import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

enum AlertsStatus { initial, loading, ready, failure }

class AlertsState extends Equatable {
  const AlertsState({
    this.status = AlertsStatus.initial,
    this.alerts = const [],
    this.seenIds = const {},
    this.failure,
  });

  final AlertsStatus status;
  final List<Alert> alerts;

  /// Alerty obejrzane w tej sesji (odznaka na zakładce).
  final Set<String> seenIds;
  final TarczaFailure? failure;

  int get unseenCount => alerts.where((a) => !seenIds.contains(a.id)).length;

  AlertsState copyWith({
    AlertsStatus? status,
    List<Alert>? alerts,
    Set<String>? seenIds,
    TarczaFailure? failure,
  }) => AlertsState(
    status: status ?? this.status,
    alerts: alerts ?? this.alerts,
    seenIds: seenIds ?? this.seenIds,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, alerts, seenIds, failure];
}

/// Alerty obejmujące pozycję urządzenia (`GET /alerts?lat&lng`) — globalny, bo
/// zasila zakładkę i odznakę.
class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit({required this._repository}) : super(const AlertsState());

  final AlertRepository _repository;
  bool _loading = false;

  Future<void> refresh(LatLng? position) async {
    if (position == null || _loading) return;
    _loading = true;
    if (state.status == AlertsStatus.initial) emit(state.copyWith(status: AlertsStatus.loading));
    try {
      final alerts = await _repository.getAlertsAt(position);
      emit(
        state.copyWith(status: AlertsStatus.ready, alerts: alerts.where((a) => a.active).toList()),
      );
    } on TarczaFailure catch (e) {
      emit(
        state.copyWith(
          status: state.alerts.isEmpty ? AlertsStatus.failure : AlertsStatus.ready,
          failure: e,
        ),
      );
    } finally {
      _loading = false;
    }
  }

  void markSeen(Iterable<String> ids) {
    final next = {...state.seenIds, ...ids};
    if (next.length != state.seenIds.length) emit(state.copyWith(seenIds: next));
  }
}

class AlertDetailState extends Equatable {
  const AlertDetailState({
    this.alert,
    this.loading = true,
    this.failure,
    this.procedures = const [],
  });

  final Alert? alert;
  final bool loading;
  final TarczaFailure? failure;

  /// „Co robić” — dla typu powiązanego incydentu, bez incydentu ogólne.
  final List<Procedure> procedures;

  @override
  List<Object?> get props => [alert, loading, failure, procedures];
}

/// Ekran alertu — `GET /alerts/{id}` (z `area`) i procedury „co robić”.
class AlertDetailCubit extends Cubit<AlertDetailState> {
  AlertDetailCubit({
    required this._repository,
    required this._incidents,
    required this._guidance,
    required this.alertId,
  }) : super(const AlertDetailState());

  final AlertRepository _repository;
  final IncidentRepository _incidents;
  final GuidanceRepository _guidance;
  final String alertId;

  Future<void> load() async {
    emit(AlertDetailState(alert: state.alert, procedures: state.procedures));
    try {
      final alert = await _repository.getAlert(alertId);
      emit(AlertDetailState(alert: alert, loading: false, procedures: state.procedures));
      await _loadProcedures(alert);
    } on TarczaFailure catch (e) {
      emit(
        AlertDetailState(
          alert: state.alert,
          loading: false,
          failure: e,
          procedures: state.procedures,
        ),
      );
    }
  }

  /// Procedury są dodatkiem — ich błąd (albo zamknięty incydent) nie psuje ekranu.
  Future<void> _loadProcedures(Alert alert) async {
    try {
      IncidentType? type;
      if (alert.incidentId case final id?) {
        try {
          type = (await _incidents.getIncident(id)).type;
        } on TarczaFailure {
          type = null;
        }
      }
      final procedures = await _guidance.getProcedures(type: type);
      if (!isClosed) {
        emit(AlertDetailState(alert: state.alert, loading: false, procedures: procedures));
      }
    } on TarczaFailure {
      // Bez procedur.
    }
  }
}
