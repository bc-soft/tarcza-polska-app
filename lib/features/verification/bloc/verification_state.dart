part of "verification_bloc.dart";

enum VerificationPhase {
  /// Brak aktywnego pytania na ekranie.
  none,
  loading,
  asking,
  submitting,
  answered,

  /// 409 — traktujemy jak sukces.
  alreadyAnswered,

  /// 410 lub koniec odliczania.
  expired,
  failed,
}

class VerificationState extends Equatable {
  const VerificationState({
    this.phase = VerificationPhase.none,
    this.question,
    this.pending = const [],
    this.secondsLeft = 0,
    this.answer,
    this.thanks,
    this.failure,
    this.dismissedIds = const {},
    this.presentationId = 0,
    this.answeredCount = 0,
  });

  final VerificationPhase phase;
  final VerificationQuestion? question;

  /// Oczekujące pytania (karta na mapie).
  final List<VerificationQuestion> pending;
  final int secondsLeft;
  final VerificationAnswer? answer;

  /// Tekst `thanks` z API.
  final String? thanks;
  final TarczaFailure? failure;

  /// Pytania odłożone przez użytkownika — polling nie otwiera ich ponownie automatycznie.
  final Set<String> dismissedIds;

  /// Rośnie przy każdym nowym wyświetleniu pytania (sygnał dla nawigacji).
  final int presentationId;

  /// Rośnie po każdej zapisanej odpowiedzi (sygnał do odświeżenia mapy).
  final int answeredCount;

  bool get isBusy =>
      phase == VerificationPhase.asking ||
      phase == VerificationPhase.submitting ||
      phase == VerificationPhase.loading;

  bool get isFinished =>
      phase == VerificationPhase.answered ||
      phase == VerificationPhase.alreadyAnswered ||
      phase == VerificationPhase.expired;

  VerificationState copyWith({
    VerificationPhase? phase,
    VerificationQuestion? question,
    bool clearQuestion = false,
    List<VerificationQuestion>? pending,
    int? secondsLeft,
    VerificationAnswer? answer,
    String? thanks,
    TarczaFailure? failure,
    Set<String>? dismissedIds,
    int? presentationId,
    int? answeredCount,
  }) => VerificationState(
    phase: phase ?? this.phase,
    question: clearQuestion ? null : (question ?? this.question),
    pending: pending ?? this.pending,
    secondsLeft: secondsLeft ?? this.secondsLeft,
    // Odpowiedź, podziękowanie i błąd dotyczą bieżącej fazy — nie przenosimy ich dalej.
    answer: answer ?? (phase == null ? this.answer : null),
    thanks: thanks ?? (phase == null ? this.thanks : null),
    failure: failure,
    dismissedIds: dismissedIds ?? this.dismissedIds,
    presentationId: presentationId ?? this.presentationId,
    answeredCount: answeredCount ?? this.answeredCount,
  );

  @override
  List<Object?> get props => [
    phase,
    question,
    pending,
    secondsLeft,
    answer,
    thanks,
    failure,
    dismissedIds,
    presentationId,
    answeredCount,
  ];
}
