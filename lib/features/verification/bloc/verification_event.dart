part of "verification_bloc.dart";

sealed class VerificationEvent extends Equatable {
  const VerificationEvent();

  @override
  List<Object?> get props => const [];
}

/// Polling `GET /verifications/pending` (start, wznowienie, co 30 s).
final class VerificationCheckRequested extends VerificationEvent {
  const VerificationCheckRequested();
}

/// Push `data.type = verification` (pierwszy plan albo tapnięcie).
final class VerificationPushReceived extends VerificationEvent {
  const VerificationPushReceived(this.verificationId);

  final String verificationId;

  @override
  List<Object?> get props => [verificationId];
}

/// Użytkownik otworzył pytanie (karta na mapie, deep link `/verification/:id`).
final class VerificationOpened extends VerificationEvent {
  const VerificationOpened(this.verificationId);

  final String verificationId;

  @override
  List<Object?> get props => [verificationId];
}

final class VerificationAnswerSubmitted extends VerificationEvent {
  const VerificationAnswerSubmitted(this.answer);

  final VerificationAnswer answer;

  @override
  List<Object?> get props => [answer];
}

/// Zamknięcie ekranu pytania (po odpowiedzi albo „Odpowiem później”).
final class VerificationDismissed extends VerificationEvent {
  const VerificationDismissed();
}

final class _VerificationTicked extends VerificationEvent {
  const _VerificationTicked();
}
