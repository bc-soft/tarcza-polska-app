import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

/// Flow: typ → lokalizacja → opcjonalny opis → wyślij → podziękowanie.
enum ReportStep { type, location, description, success }

class ReportState extends Equatable {
  const ReportState({
    this.step = ReportStep.type,
    this.types = defaultReportTypes,
    this.type,
    this.position,
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
  final LatLng? position;
  final String description;
  final bool submitting;
  final ReportReceipt? receipt;

  /// Status po wysłaniu — `incident` jest `null`, dopóki backend nie połączy zgłoszenia.
  final ReportStatus? status;
  final TarczaFailure? failure;

  bool get descriptionTooLong => description.length > maxDescription;

  bool get canSubmit => type != null && position != null && !descriptionTooLong && !submitting;

  ReportState copyWith({
    ReportStep? step,
    List<ReportTypeOption>? types,
    ReportTypeOption? type,
    LatLng? position,
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
    this.statusPollInterval = const Duration(seconds: 2),
    this.statusPollAttempts = 5,
  }) : super(const ReportState());

  final ReportRepository _repository;
  final Duration statusPollInterval;
  final int statusPollAttempts;
  Timer? _pollTimer;

  /// Etykiety z backendu; przy błędzie zostają wbudowane (te same wartości).
  Future<void> loadTypes() async {
    try {
      final types = await _repository.getTypes();
      if (types.isNotEmpty && !isClosed) emit(state.copyWith(types: types));
    } on TarczaFailure {
      // Zostajemy przy liście wbudowanej.
    }
  }

  void selectType(ReportTypeOption type, {LatLng? defaultPosition}) => emit(
    state.copyWith(
      type: type,
      step: ReportStep.location,
      position: state.position ?? defaultPosition,
    ),
  );

  void setPosition(LatLng position) => emit(state.copyWith(position: position));

  void confirmLocation() {
    if (state.position != null) emit(state.copyWith(step: ReportStep.description));
  }

  void setDescription(String value) => emit(state.copyWith(description: value));

  void back() {
    final previous = switch (state.step) {
      ReportStep.location => ReportStep.type,
      ReportStep.description => ReportStep.location,
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
        position: state.position!,
        description: state.description,
      );
      emit(state.copyWith(submitting: false, receipt: receipt, step: ReportStep.success));
      _pollStatus(receipt.reportId, statusPollAttempts);
    } on TarczaFailure catch (e) {
      // 429 i inne błędy: komunikat bez automatycznego ponawiania.
      emit(state.copyWith(submitting: false, failure: e));
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
