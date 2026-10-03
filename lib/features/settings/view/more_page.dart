import "dart:async";

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";

/// Zakładka „Więcej”: schrony, ustawienia, (dev) scenariusz demo.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.moreTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TarczaCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                ListTileRow(
                  icon: Icons.night_shelter_outlined,
                  title: l10n.moreShelters,
                  subtitle: l10n.moreSheltersSub,
                  onTap: () => context.push(AppRoutes.shelters),
                ),
                const Divider(indent: 70),
                ListTileRow(
                  icon: Icons.settings_outlined,
                  title: l10n.moreSettings,
                  subtitle: l10n.moreSettingsSub,
                  onTap: () => context.push(AppRoutes.settings),
                ),
                if (AppConfig.useMocks) ...[
                  const Divider(indent: 70),
                  ListTileRow(
                    icon: Icons.science_outlined,
                    iconColor: TarczaPalette.high,
                    title: l10n.moreDemo,
                    subtitle: l10n.moreDemoSub,
                    onTap: () => context.push(AppRoutes.demo),
                  ),
                ],
              ],
            ),
          ),
          SectionHeader(l10n.moreAbout),
          TarczaCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.shield_outlined, color: TarczaPalette.primary),
                const SizedBox(width: 12),
                Expanded(child: Text(l10n.moreAboutBody)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: GestureDetector(
              // Ukryte wejście do scenariusza demo (także poza listą).
              onLongPress: () => unawaited(context.push(AppRoutes.demo)),
              child: const Text(
                "Tarcza Citizen ${AppConfig.appVersion}",
                style: TextStyle(color: TarczaPalette.textSecondary, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
