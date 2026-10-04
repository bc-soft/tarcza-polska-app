import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/app/theme/tarcza_typography.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";
import "package:tarcza_polska/l10n/app_localizations.dart";

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
    // `Navigator` obsługuje i strony go_router, i trasy otwarte imperatywnie (podgląd ekranów).
    final navigator = Navigator.of(context);
    if (navigator.canPop()) {
      navigator.pop();
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
        appBar: TarczaAppBar(
          showLogo: true,
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

/// Karta pytania: typ zdarzenia, kontekst z API, pytanie i odliczanie do `expiresAt`.
class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.question,
    required this.secondsLeft,
    required this.progress,
  });

  final VerificationQuestion question;
  final int secondsLeft;
  final double progress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    // Ostatnie sekundy na czerwono — widać, że trzeba się pospieszyć. W spokojnym stanie
    // kolor musi się odcinać od szarego tła paska (`surfaceAlt`) — stąd info, nie textSecondary.
    final urgent = secondsLeft <= 15;
    final timerColor = urgent ? TarczaPalette.confirmed : TarczaPalette.info;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: TarczaPalette.surfaceAlt,
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Row(
              children: [
                PanelIcon(
                  icon: question.type.icon,
                  color: TarczaPalette.primary,
                  tinted: true,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Eyebrow(l10n.verificationCardLabel),
                      const SizedBox(height: 4),
                      Text(
                        question.context,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: TarczaPalette.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: TarczaPalette.outline),
          // Pytanie o obiekt — może dotyczyć sąsiedniej stacji, nie tej zgłoszonej.
          if (question.poi case final poi?)
            Container(
              margin: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: TarczaPalette.surfaceAlt,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                border: Border.all(color: TarczaPalette.outline),
              ),
              child: Row(
                children: [
                  Icon(poi.kind.icon, size: 20, color: TarczaPalette.primaryLight),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(upper(l10n.verificationPoiLabel), style: TarczaFonts.label()),
                        const SizedBox(height: 2),
                        Text(
                          poi.name,
                          style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
            child: Text(
              question.question,
              style: TarczaFonts.heading(size: 27, height: 1.15, letterSpacing: 0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.timer_outlined, size: 18, color: timerColor),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        upper(l10n.verificationExpiresIn(secondsLeft)),
                        style: TarczaFonts.label(weight: 700, color: timerColor),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                TweenAnimationBuilder<double>(
                  tween: Tween(end: progress),
                  duration: const Duration(milliseconds: 900),
                  builder: (context, value, _) =>
                      MeterBar(value: value, color: timerColor, height: 5, animate: false),
                ),
              ],
            ),
          ),
        ],
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
          _QuestionCard(question: question, secondsLeft: state.secondsLeft, progress: progress),
          const Spacer(),
          if (state.failure != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                Formatters.failure(l10n, state.failure!),
                textAlign: TextAlign.center,
                style: const TextStyle(color: TarczaPalette.confirmed),
              ),
            ),
          // TAK i NIE obok siebie, NIE WIEM pod nimi — równorzędne, nie sugerujemy odpowiedzi.
          _AnswerGrid(question: question, state: state, enabled: !submitting),
          const SizedBox(height: 12),
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

/// Etykiety TAK / NIE zależne od typu pytania. Podstawiamy je tylko wtedy, gdy treść pytania
/// pasuje do znanego, pozytywnego sformułowania („Czy masz dostęp do prądu?”) — przy innym
/// (np. zaprzeczonym) pytaniu etykieta odwróciłaby sens odpowiedzi. Wysyłamy zawsze dosłownie
/// `yes` / `no`; interpretację robi backend.
({String yes, String no})? _semanticLabels(VerificationQuestion q, AppLocalizations l10n) {
  final text = q.question.toLowerCase();
  if (text.contains("brak") || RegExp(r"\bnie\b").hasMatch(text)) return null;
  bool has(String pattern) => RegExp(pattern).hasMatch(text);
  return switch (q.type) {
    IncidentType.powerOutage when has("(masz|jest).{0,30}(prąd|zasilani)") => (
      yes: l10n.verificationPowerYes,
      no: l10n.verificationPowerNo,
    ),
    IncidentType.waterOutage when has("(masz|jest|leci).{0,30}wod") => (
      yes: l10n.verificationWaterYes,
      no: l10n.verificationWaterNo,
    ),
    IncidentType.fuelShortage when has("(jest|dostępn|można).{0,40}paliw") => (
      yes: l10n.verificationFuelYes,
      no: l10n.verificationFuelNo,
    ),
    IncidentType.roadBlocked when has("przejezdn") => (
      yes: l10n.verificationRoadYes,
      no: l10n.verificationRoadNo,
    ),
    IncidentType.shelterIssue when has("schron.{0,30}(otwart|dostępn)") => (
      yes: l10n.verificationShelterYes,
      no: l10n.verificationShelterNo,
    ),
    _ => null,
  };
}

class _AnswerGrid extends StatelessWidget {
  const _AnswerGrid({required this.question, required this.state, required this.enabled});

  final VerificationQuestion question;
  final VerificationState state;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final labels = _semanticLabels(question, l10n);
    final options = question.options.toSet();
    bool loading(VerificationAnswer a) =>
        state.phase == VerificationPhase.submitting && state.answer == a;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            if (options.contains(VerificationAnswer.yes))
              Expanded(
                child: _AnswerButton(
                  answer: VerificationAnswer.yes,
                  title: labels?.yes ?? l10n.verificationYes,
                  caption: labels == null ? null : l10n.verificationYes,
                  icon: Icons.check_rounded,
                  loading: loading(VerificationAnswer.yes),
                  enabled: enabled,
                  height: 112,
                ),
              ),
            if (options.contains(VerificationAnswer.yes) && options.contains(VerificationAnswer.no))
              const SizedBox(width: 12),
            if (options.contains(VerificationAnswer.no))
              Expanded(
                child: _AnswerButton(
                  answer: VerificationAnswer.no,
                  title: labels?.no ?? l10n.verificationNo,
                  caption: labels == null ? null : l10n.verificationNo,
                  icon: Icons.close_rounded,
                  loading: loading(VerificationAnswer.no),
                  enabled: enabled,
                  height: 112,
                ),
              ),
          ],
        ),
        if (options.contains(VerificationAnswer.unknown)) ...[
          const SizedBox(height: 12),
          _AnswerButton(
            answer: VerificationAnswer.unknown,
            title: l10n.verificationUnknown,
            icon: Icons.help_outline_rounded,
            loading: loading(VerificationAnswer.unknown),
            enabled: enabled,
            height: 60,
            horizontal: true,
          ),
        ],
      ],
    );
  }
}

class _AnswerButton extends StatelessWidget {
  const _AnswerButton({
    required this.answer,
    required this.title,
    required this.icon,
    required this.loading,
    required this.enabled,
    required this.height,
    this.caption,
    this.horizontal = false,
  });

  final VerificationAnswer answer;
  final String title;

  /// Dosłowna odpowiedź („TAK” / „NIE”) pod etykietą zależną od typu.
  final String? caption;
  final IconData icon;
  final bool loading;
  final bool enabled;
  final double height;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      Icon(icon, size: horizontal ? 22 : 30),
      SizedBox(width: horizontal ? 8 : 0, height: horizontal ? 0 : 6),
      Flexible(
        child: Text(
          upper(title),
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TarczaFonts.heading(size: 21, height: 1.1, letterSpacing: 0.7),
        ),
      ),
      if (caption != null && !horizontal) ...[
        const SizedBox(height: 4),
        Text(upper(caption!), style: TarczaFonts.label(size: 10.5, weight: 700)),
      ],
    ];
    return SizedBox(
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: TarczaPalette.surface,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        ),
        onPressed: enabled
            ? () => context.read<VerificationBloc>().add(VerificationAnswerSubmitted(answer))
            : null,
        child: loading
            ? const SizedBox.square(
                dimension: 26,
                child: CircularProgressIndicator(strokeWidth: 2.5),
              )
            : horizontal
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: children)
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: children),
      ),
    );
  }
}
