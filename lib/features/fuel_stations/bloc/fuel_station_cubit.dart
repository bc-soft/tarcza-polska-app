import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

enum FuelConfirmStatus { idle, sending, sent, failed }

class FuelStationState extends Equatable {
  const FuelStationState({
    this.station,
    this.loading = true,
    this.failure,
    this.confirm = FuelConfirmStatus.idle,
  });

  final FuelStation? station;
  final bool loading;
  final TarczaFailure? failure;
  final FuelConfirmStatus confirm;

  FuelStationState copyWith({
    FuelStation? station,
    bool? loading,
    TarczaFailure? failure,
    FuelConfirmStatus? confirm,
  }) => FuelStationState(
    station: station ?? this.station,
    loading: loading ?? this.loading,
    failure: failure,
    confirm: confirm ?? this.confirm,
  );

  @override
  List<Object?> get props => [station, loading, failure, confirm];
}

/// Stacja paliw: szczegóły (`GET /fuel-stations/{id}`) i potwierdzenie stanu paliw przez
/// osobę na stacji (`POST /fuel-stations/{id}/status`) — bez tworzenia zgłoszenia.
class FuelStationCubit extends Cubit<FuelStationState> {
  FuelStationCubit({required this._repository, required this.stationId, FuelStation? initial})
    : super(FuelStationState(station: initial, loading: initial == null));

  final FuelStationRepository _repository;
  final String stationId;

  Future<void> load() async {
    try {
      final station = await _repository.getStation(stationId);
      final distance = state.station?.distanceMeters;
      emit(
        state.copyWith(
          station: station.distanceMeters == null && distance != null
              ? station.copyWith(distanceMeters: distance)
              : station,
          loading: false,
        ),
      );
    } on TarczaFailure catch (e) {
      emit(state.copyWith(loading: false, failure: e));
    }
  }

  Future<void> confirm(List<FuelType> fuelTypes, {required bool available}) async {
    if (fuelTypes.isEmpty) return;
    emit(state.copyWith(confirm: FuelConfirmStatus.sending));
    try {
      final updated = await _repository.confirmStatus(
        stationId,
        fuelTypes: fuelTypes,
        available: available,
      );
      emit(
        state.copyWith(
          station: updated.copyWith(distanceMeters: state.station?.distanceMeters),
          confirm: FuelConfirmStatus.sent,
        ),
      );
    } on TarczaFailure catch (e) {
      emit(state.copyWith(confirm: FuelConfirmStatus.failed, failure: e));
    }
  }
}
