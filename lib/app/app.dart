import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/app_theme.dart";
import "package:tarcza_polska/features/alerts/bloc/alerts_cubit.dart";
import "package:tarcza_polska/features/map/bloc/map_bloc.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";
import "package:tarcza_polska/features/verification/bloc/verification_bloc.dart";
import "package:tarcza_polska/l10n/app_localizations.dart";

/// Korzeń aplikacji. Globalne BLoC-i (pozycja, weryfikacja, alerty, mapa) żyją
/// nad routerem — pytanie i alert mogą przyjść na dowolnym ekranie.
class TarczaApp extends StatefulWidget {
  const TarczaApp({super.key});

  @override
  State<TarczaApp> createState() => _TarczaAppState();
}

class _TarczaAppState extends State<TarczaApp> {
  late final GoRouter _router = createRouter(getIt());

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        lazy: false,
        create: (_) => LocationCubit(
          repository: getIt(),
          locationService: getIt(),
          background: getIt(),
          preferences: getIt(),
        )..start(),
      ),
      BlocProvider(create: (_) => VerificationBloc(repository: getIt())),
      BlocProvider(create: (_) => AlertsCubit(repository: getIt())),
      BlocProvider(create: (_) => MapBloc(repository: getIt())),
    ],
    child: MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: _router,
      locale: const Locale("pl"),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}
