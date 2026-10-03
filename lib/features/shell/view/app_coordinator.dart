import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/core/push/push_event.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";

/// Cykl życia ekranu głównego (`backend-specs.md` §11): przy starcie i wznowieniu
/// aktualizuje pozycję i odpytuje `pending` + alerty, co 30 s ponawia polling,
/// obsługuje pushe (pierwszy plan, tapnięcie, start z pusha) i rotację tokena.
class AppCoordinator extends StatefulWidget {
  const AppCoordinator({super.key, required this.child});

  final Widget child;

  @override
  State<AppCoordinator> createState() => _AppCoordinatorState();
}

class _AppCoordinatorState extends State<AppCoordinator> {
  late final AppLifecycleListener _lifecycle;
  final _subscriptions = <StreamSubscription<Object?>>[];
  Timer? _pollTimer;
  int _presentedId = 0;

  PushService get _push => getIt<PushService>();

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: _onForeground, onPause: _stopPolling);
    _subscriptions
      ..add(_push.events.listen(_onPush))
      ..add(_push.onTokenRefresh.listen(_onTokenRefresh));
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    unawaited(_syncDevice());
    await _onForeground();
    final initial = await _push.initialEvent();
    if (initial != null) _onPush(initial);
  }

  /// Upewnia się, że urządzenie jest zarejestrowane i backend zna token push.
  Future<void> _syncDevice() async {
    try {
      final token = await _push.getToken();
      final device = getIt<DeviceRepository>();
      await device.ensureRegistered(pushToken: token);
      if (token != null) await device.updatePushToken(token);
    } on Object catch (e) {
      debugPrint("Synchronizacja urządzenia: $e");
    }
  }

  Future<void> _onTokenRefresh(String token) async {
    try {
      await getIt<DeviceRepository>().updatePushToken(token);
    } on Object catch (e) {
      debugPrint("Rotacja tokena push: $e");
    }
  }

  Future<void> _onForeground() async {
    if (!mounted) return;
    _poll();
    _startPolling();
    await context.read<LocationCubit>().refreshOnOpen();
    if (mounted) _poll();
  }

  void _poll() {
    if (!mounted) return;
    context.read<VerificationBloc>().add(const VerificationCheckRequested());
    unawaited(
      context.read<AlertsCubit>().refresh(context.read<LocationCubit>().state.effectivePosition),
    );
  }

  void _startPolling() {
    _pollTimer?.cancel();
    _pollTimer = Timer.periodic(AppConfig.pollInterval, (_) => _poll());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  void _onPush(PushEvent event) {
    if (!mounted) return;
    switch (event) {
      case VerificationPushEvent(:final verificationId):
        context.read<VerificationBloc>().add(VerificationPushReceived(verificationId));
      case AlertPushEvent(:final alertId):
        unawaited(
          context.read<AlertsCubit>().refresh(
            context.read<LocationCubit>().state.effectivePosition,
          ),
        );
        context.read<MapBloc>().add(const MapRefreshRequested());
        _open(AppRoutes.alert(alertId));
      case LocationRefreshPushEvent():
        unawaited(context.read<LocationCubit>().refreshOnOpen(userInitiated: true));
    }
  }

  void _open(String location) {
    final router = GoRouter.of(context);
    if (router.state.uri.toString() == location) return;
    unawaited(router.push<void>(location));
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _stopPolling();
    for (final s in _subscriptions) {
      unawaited(s.cancel());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      // Nowe pytanie (push albo polling) — od razu pełny ekran z TAK / NIE / NIE WIEM.
      BlocListener<VerificationBloc, VerificationState>(
        listenWhen: (a, b) =>
            b.presentationId != a.presentationId && b.phase == VerificationPhase.asking,
        listener: (context, state) {
          final question = state.question;
          if (question == null || state.presentationId == _presentedId) return;
          _presentedId = state.presentationId;
          _open(AppRoutes.verification(question.verificationId));
        },
      ),
      // Po odpowiedzi odświeżamy mapę — widać zmianę confidence i zasięgu.
      BlocListener<VerificationBloc, VerificationState>(
        listenWhen: (a, b) => b.answeredCount != a.answeredCount,
        listener: (context, _) {
          final map = context.read<MapBloc>()..add(const MapRefreshRequested());
          Future<void>.delayed(const Duration(seconds: 3), () {
            if (!map.isClosed) map.add(const MapRefreshRequested());
          });
        },
      ),
      BlocListener<LocationCubit, LocationState>(
        listenWhen: (a, b) => a.effectivePosition != b.effectivePosition,
        listener: (context, state) =>
            unawaited(context.read<AlertsCubit>().refresh(state.effectivePosition)),
      ),
      BlocListener<LocationCubit, LocationState>(
        listenWhen: (a, b) => a.noticeId != b.noticeId && b.notice != LocationNotice.none,
        listener: (context, state) {
          final l10n = context.l10n;
          final text = switch (state.notice) {
            LocationNotice.updated => l10n.mapLocationUpdated,
            LocationNotice.noGps => l10n.settingsLocationNoGps,
            LocationNotice.backgroundDenied => l10n.settingsWatchDenied,
            LocationNotice.failed => l10n.errorNetwork,
            LocationNotice.none => null,
          };
          if (text != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(text)));
          }
        },
      ),
    ],
    child: widget.child,
  );
}
