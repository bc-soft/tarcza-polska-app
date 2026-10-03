import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";

/// Pełnoekranowe pytanie weryfikacyjne. `VerificationBloc` jest globalny —
/// pytanie może przyjść w dowolnym momencie (push / polling).
class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key, required this.verificationId});

  final String verificationId;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  void initState() {
    super.initState();
    // Deep link z pusha: pytania może jeszcze nie być w stanie.
    context.read<VerificationBloc>().add(VerificationOpened(widget.verificationId));
  }

  void _close() {
    context.read<VerificationBloc>().add(const VerificationDismissed());
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.map);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) context.read<VerificationBloc>().add(const VerificationDismissed());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.verificationTitle),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(tooltip: l10n.commonClose, icon: const Icon(Icons.close), onPressed: _close),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<VerificationBloc, VerificationState>(
            builder: (context, state) {
              final question = state.question;
              final forThisQuestion =
                  question == null || question.verificationId == widget.verificationId;
              if (!forThisQuestion) return const Center(child: CircularProgressIndicator());

              return switch (state.phase) {
                VerificationPhase.none || VerificationPhase.loading => const Center(
                  child: CircularProgressIndicator(),
                ),
                VerificationPhase.failed => ErrorView(
                  message: l10n.verificationLoadError,
                  onRetry: () => context.read<VerificationBloc>().add(
                    VerificationOpened(widget.verificationId),
                  ),
                ),
                VerificationPhase.asking || VerificationPhase.submitting => _QuestionView(
                  state: state,
                  onLater: _close,
                ),
                VerificationPhase.answered => MessageView(
                  icon: Icons.check_circle_outline,
                  title: l10n.reportSuccessTitle,
                  body: state.thanks,
                  actions: [PrimaryButton(label: l10n.verificationDone, onPressed: _close)],
                ),
                VerificationPhase.alreadyAnswered => MessageView(
                  icon: Icons.check_circle_outline,
                  title: l10n.verificationAlreadyAnswered,
                  actions: [PrimaryButton(label: l10n.verificationDone, onPressed: _close)],
                ),
                VerificationPhase.expired => MessageView(
                  icon: Icons.timer_off_outlined,
                  color: TarczaPalette.unverified,
                  title: l10n.verificationExpired,
                  actions: [PrimaryButton(label: l10n.commonClose, onPressed: _close)],
                ),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView({required this.state, required this.onLater});

  final VerificationState state;
  final VoidCallback onLater;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final question = state.question!;
    final total = question.expiresAt.difference(question.sentAt).inSeconds.clamp(1, 3600);
    final progress = (state.secondsLeft / total).clamp(0.0, 1.0);
    final submitting = state.phase == VerificationPhase.submitting;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TarczaCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(question.type.icon, color: TarczaPalette.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        question.context,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: TarczaPalette.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  question.question,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.timer_outlined, size: 18, color: TarczaPalette.textSecondary),
              const SizedBox(width: 6),
              Text(
                l10n.verificationExpiresIn(state.secondsLeft),
                style: const TextStyle(color: TarczaPalette.textSecondary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: TarczaPalette.outline,
            ),
          ),
          const Spacer(),
          if (state.failure != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                Formatters.failure(l10n, state.failure!),
                textAlign: TextAlign.center,
                style: const TextStyle(color: TarczaPalette.accentRed),
              ),
            ),
          // Trzy równorzędne przyciski — nie sugerujemy „właściwej” odpowiedzi.
          for (final answer in question.options) ...[
            _AnswerButton(
              answer: answer,
              loading: submitting && state.answer == answer,
              enabled: !submitting,
            ),
            const SizedBox(height: 12),
          ],
          Text(
            l10n.verificationWhy,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: TarczaPalette.textSecondary),
          ),
          TextButton(onPressed: submitting ? null : onLater, child: Text(l10n.verificationLater)),
        ],
      ),
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({required this.answer, required this.loading, required this.enabled});

  final VerificationAnswer answer;
  final bool loading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final label = switch (answer) {
      VerificationAnswer.yes => l10n.verificationYes,
      VerificationAnswer.no => l10n.verificationNo,
      VerificationAnswer.unknown => l10n.verificationUnknown,
    };
    return SizedBox(
      height: 64,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, letterSpacing: 1),
        ),
        onPressed: enabled
            ? () => context.read<VerificationBloc>().add(VerificationAnswerSubmitted(answer))
            : null,
        child: loading
            ? const SizedBox.square(
                dimension: 24,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : Text(label),
      ),
    );
  }
}
