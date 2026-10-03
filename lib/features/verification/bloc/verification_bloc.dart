import "dart:async";

import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

part "verification_event.dart";
part "verification_state.dart";

/// Active Crowd Verification po stronie aplikacji: odbiór pytania (push + polling
/// `pending`), odliczanie do `expiresAt`, odpowiedź TAK / NIE / NIE WIEM, 409 / 410.
class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  VerificationBloc({
    required this._repository,
    DateTime Function()? clock,
    this._tick = const Duration(seconds: 1),
  }) : _clock = clock ?? DateTime.now,
       super(const VerificationState()) {
    on<VerificationCheckRequested>(_onCheck, transformer: droppable());
    on<VerificationPushReceived>(_onPush, transformer: sequential());
    on<VerificationOpened>(_onOpened);
    on<VerificationAnswerSubmitted>(_onAnswer, transformer: droppable());
    on<VerificationDismissed>(_onDismissed);
    on<_VerificationTicked>(_onTick);
  }

  final VerificationRepository _repository;
  final DateTime Function() _clock;
  final Duration _tick;
  Timer? _timer;

  Future<void> _onCheck(VerificationCheckRequested event, Emitter<VerificationState> emit) async {
    try {
      final pending = (await _repository.getPending())
          .where((q) => !q.answered && !q.isExpiredAt(_clock()))
          .toList();
      emit(state.copyWith(pending: pending));
      if (state.isBusy) return;
      final next = pending.where((q) => !state.dismissedIds.contains(q.verificationId)).firstOrNull;
      if (next != null) _present(next, emit);
    } on TarczaFailure {
      // Polling jest cichy — kolejna próba przy następnym cyklu.
    }
  }

  Future<void> _onPush(VerificationPushReceived event, Emitter<VerificationState> emit) async {
    if (state.question?.verificationId == event.verificationId && state.isBusy) return;
    await _load(event.verificationId, emit);
  }

  Future<void> _onOpened(VerificationOpened event, Emitter<VerificationState> emit) async {
    final current = state.question;
    if (current?.verificationId == event.verificationId && state.phase != VerificationPhase.none) {
      return;
    }
    final known = state.pending.where((q) => q.verificationId == event.verificationId).firstOrNull;
    if (known != null) {
      _present(known, emit);
    } else {
      await _load(event.verificationId, emit);
    }
  }

  Future<void> _load(String verificationId, Emitter<VerificationState> emit) async {
    emit(state.copyWith(phase: VerificationPhase.loading, clearQuestion: true));
    try {
      final question = await _repository.getQuestion(verificationId);
      if (question.answered) {
        emit(state.copyWith(phase: VerificationPhase.alreadyAnswered, question: question));
      } else if (question.isExpiredAt(_clock())) {
        emit(state.copyWith(phase: VerificationPhase.expired, question: question));
      } else {
        _present(question, emit);
      }
    } on TarczaFailure catch (e) {
      emit(state.copyWith(phase: VerificationPhase.failed, failure: e));
    }
  }

  void _present(VerificationQuestion question, Emitter<VerificationState> emit) {
    emit(
      state.copyWith(
        phase: VerificationPhase.asking,
        question: question,
        secondsLeft: _secondsLeft(question),
        presentationId: state.presentationId + 1,
      ),
    );
    _startTimer();
  }

  Future<void> _onAnswer(VerificationAnswerSubmitted event, Emitter<VerificationState> emit) async {
    final question = state.question;
    if (question == null || state.phase != VerificationPhase.asking) return;
    emit(state.copyWith(phase: VerificationPhase.submitting, answer: event.answer));
    try {
      final result = await _repository.respond(question.verificationId, event.answer);
      _stopTimer();
      emit(
        state.copyWith(
          phase: VerificationPhase.answered,
          thanks: result.thanks,
          pending: _without(question.verificationId),
          answeredCount: state.answeredCount + 1,
        ),
      );
    } on AlreadyAnsweredFailure {
      // 409 — odpowiedź już zapisana (np. z innego ekranu): traktujemy jak sukces.
      _stopTimer();
      emit(
        state.copyWith(
          phase: VerificationPhase.alreadyAnswered,
          pending: _without(question.verificationId),
          answeredCount: state.answeredCount + 1,
        ),
      );
    } on QuestionExpiredFailure {
      _stopTimer();
      emit(
        state.copyWith(
          phase: VerificationPhase.expired,
          pending: _without(question.verificationId),
        ),
      );
    } on TarczaFailure catch (e) {
      // Np. brak sieci — pozwalamy spróbować ponownie, dopóki pytanie żyje.
      emit(state.copyWith(phase: VerificationPhase.asking, failure: e));
    }
  }

  void _onDismissed(VerificationDismissed event, Emitter<VerificationState> emit) {
    _stopTimer();
    final id = state.question?.verificationId;
    emit(
      state.copyWith(
        phase: VerificationPhase.none,
        clearQuestion: true,
        dismissedIds: {...state.dismissedIds, ?id},
      ),
    );
  }

  void _onTick(_VerificationTicked event, Emitter<VerificationState> emit) {
    final question = state.question;
    if (question == null) return _stopTimer();
    final left = _secondsLeft(question);
    if (left > 0) {
      emit(state.copyWith(secondsLeft: left));
      return;
    }
    _stopTimer();
    if (state.phase == VerificationPhase.asking || state.phase == VerificationPhase.submitting) {
      emit(
        state.copyWith(
          phase: VerificationPhase.expired,
          secondsLeft: 0,
          pending: _without(question.verificationId),
        ),
      );
    }
  }

  int _secondsLeft(VerificationQuestion q) {
    final ms = q.expiresAt.difference(_clock()).inMilliseconds;
    return ms <= 0 ? 0 : (ms / 1000).ceil();
  }

  List<VerificationQuestion> _without(String id) =>
      state.pending.where((q) => q.verificationId != id).toList();

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(_tick, (_) => add(const _VerificationTicked()));
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
