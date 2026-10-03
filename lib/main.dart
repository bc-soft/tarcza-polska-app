import "package:flutter/material.dart";
import "package:intl/date_symbol_data_local.dart";

import "package:tarcza_polska/app/app.dart";
import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/core/push/push_service.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("pl");
  await configureDependencies();
  try {
    await getIt<PushService>().init();
  } on Object catch (e) {
    // Brak konfiguracji Firebase nie może zablokować aplikacji — zostaje polling.
    debugPrint("Push niedostępny: $e");
  }
  runApp(const TarczaApp());
}
