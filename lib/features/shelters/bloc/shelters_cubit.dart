import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

class SheltersState extends Equatable {
  const SheltersState({this.shelters = const [], this.loading = true, this.failure});

  final List<Shelter> shelters;
  final bool loading;
  final TarczaFailure? failure;

  @override
  List<Object?> get props => [shelters, loading, failure];
}

/// 10 najbliższych schronów (`GET /shelters?lat&lng`, z `distanceMeters`).
class SheltersCubit extends Cubit<SheltersState> {
  SheltersCubit({required this._repository}) : super(const SheltersState());

  final ShelterRepository _repository;

  Future<void> loadNearest(LatLng? position) async {
    if (position == null) {
      emit(const SheltersState(loading: false));
      return;
    }
    emit(SheltersState(shelters: state.shelters));
    try {
      final list = await _repository.getNearest(position);
      emit(SheltersState(shelters: list, loading: false));
    } on TarczaFailure catch (e) {
      emit(SheltersState(shelters: state.shelters, loading: false, failure: e));
    }
  }
}

enum ShelterConfirmStatus { idle, sending, sent, failed }

class ShelterDetailState extends Equatable {
  const ShelterDetailState({
    this.shelter,
    this.loading = true,
    this.failure,
    this.confirm = ShelterConfirmStatus.idle,
  });

  final Shelter? shelter;
  final bool loading;
  final TarczaFailure? failure;
  final ShelterConfirmStatus confirm;

  ShelterDetailState copyWith({
    Shelter? shelter,
    bool? loading,
    TarczaFailure? failure,
    ShelterConfirmStatus? confirm,
  }) => ShelterDetailState(
    shelter: shelter ?? this.shelter,
    loading: loading ?? this.loading,
    failure: failure,
    confirm: confirm ?? this.confirm,
  );

  @override
  List<Object?> get props => [shelter, loading, failure, confirm];
}

/// Szczegóły schronu i potwierdzenie statusu przez mieszkańca.
class ShelterDetailCubit extends Cubit<ShelterDetailState> {
  ShelterDetailCubit({required this._repository, required this.shelterId, Shelter? initial})
    : super(ShelterDetailState(shelter: initial, loading: initial == null));

  final ShelterRepository _repository;
  final String shelterId;

  Future<void> load() async {
    try {
      final shelter = await _repository.getShelter(shelterId);
      // Zachowujemy odległość z listy „najbliższe” — `GET /shelters/{id}` jej nie zwraca.
      final distance = state.shelter?.distanceMeters;
      emit(
        state.copyWith(
          shelter: shelter.distanceMeters == null && distance != null
              ? shelter.copyWith(distanceMeters: distance)
              : shelter,
          loading: false,
        ),
      );
    } on TarczaFailure catch (e) {
      emit(state.copyWith(loading: false, failure: e));
    }
  }

  Future<void> confirmStatus(
    ShelterStatus status, {
    ShelterOccupancy? occupancy,
    String? comment,
  }) async {
    emit(state.copyWith(confirm: ShelterConfirmStatus.sending));
    try {
      final updated = await _repository.confirmStatus(
        shelterId,
        status,
        occupancy: occupancy,
        comment: comment,
      );
      emit(
        state.copyWith(
          shelter: updated.copyWith(distanceMeters: state.shelter?.distanceMeters),
          confirm: ShelterConfirmStatus.sent,
        ),
      );
    } on TarczaFailure catch (e) {
      emit(state.copyWith(confirm: ShelterConfirmStatus.failed, failure: e));
    }
  }
}
