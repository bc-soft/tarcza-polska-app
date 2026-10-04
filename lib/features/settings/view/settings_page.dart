import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_map/flutter_map.dart";
import "package:go_router/go_router.dart";

import "package:tarcza_polska/app/config/app_config.dart";
import "package:tarcza_polska/app/di/injection.dart";
import "package:tarcza_polska/app/router/app_router.dart";
import "package:tarcza_polska/app/theme/tarcza_colors.dart";
import "package:tarcza_polska/core/location/location_service.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/core/storage/token_storage.dart";
import "package:tarcza_polska/core/utils/formatters.dart";
import "package:tarcza_polska/core/widgets/map_widgets.dart";
import "package:tarcza_polska/core/widgets/widgets.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> _resetApp() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l10n.settingsResetConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.commonOk)),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    final location = context.read<LocationCubit>();
    await location.setBackgroundEnabled(enabled: false);
    await getIt<AppPreferences>().clear();
    await getIt<TokenStorage>().clear();
    if (mounted) context.go(AppRoutes.onboarding);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<LocationCubit>();
    return Scaffold(
      appBar: TarczaAppBar(title: Text(l10n.settingsTitle)),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          final sourceLabel = switch (state.source) {
            LocationSource.home => l10n.settingsSourceHome,
            LocationSource.gps => l10n.settingsSourceGps,
            LocationSource.background => l10n.settingsSourceBackground,
            null => null,
          };
          final lastSent = state.lastSentAt == null || sourceLabel == null
              ? l10n.settingsNeverSent
              : l10n.settingsLastSent(sourceLabel, Formatters.relative(l10n, state.lastSentAt!));
          final hexagon = cubit.neighbourhood();
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 32),
            children: [
              SectionHeader(l10n.settingsHome),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: ListTileRow(
                  icon: Icons.home_outlined,
                  title: state.homeAddress?.label ?? l10n.settingsHomeMissing,
                  subtitle: l10n.settingsHomeChange,
                  onTap: () => context.push(AppRoutes.homeAddress),
                ),
              ),
              SectionHeader(l10n.settingsNeighbourhood),
              if (state.effectivePosition != null)
                SizedBox(
                  height: 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: IgnorePointer(
                      child: FlutterMap(
                        key: ValueKey(hexagon.isEmpty ? state.cell : hexagon.first),
                        // Kamera dopasowana do heksagonu komórki H3 — to „okolica”, nie punkt.
                        options: MapOptions(
                          initialCenter: state.effectivePosition!,
                          initialZoom: 15.5,
                          initialCameraFit: hexagon.length < 3
                              ? null
                              : CameraFit.coordinates(
                                  coordinates: hexagon,
                                  padding: const EdgeInsets.all(28),
                                ),
                        ),
                        children: [
                          osmTileLayer(),
                          if (hexagon.isNotEmpty)
                            PolygonLayer(
                              polygons: [
                                Polygon(
                                  points: hexagon,
                                  color: TarczaPalette.primary.withValues(alpha: 0.22),
                                  borderColor: TarczaPalette.primaryLight,
                                  borderStrokeWidth: 2,
                                ),
                              ],
                            ),
                          mapLabelsLayer(),
                          // Skąd jest „okolica”: dom (pinezka) albo bieżąca pozycja (kropka).
                          MarkerLayer(
                            markers: [
                              if (state.position == null || state.source == LocationSource.home)
                                homeMarker(state.effectivePosition!, size: 40)
                              else
                                userLocationMarker(state.position!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              Text(
                l10n.settingsNeighbourhoodHint,
                style: const TextStyle(color: TarczaPalette.textSecondary, fontSize: 13),
              ),
              const SizedBox(height: 12),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTileRow(
                      icon: Icons.schedule_outlined,
                      title: l10n.settingsLocationSource,
                      subtitle: lastSent,
                      trailing: state.updating
                          ? const SizedBox.square(
                              dimension: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : null,
                    ),
                    const Divider(indent: 70),
                    ListTileRow(
                      icon: Icons.my_location,
                      title: l10n.settingsUpdateNow,
                      onTap: state.updating ? null : () => cubit.refreshOnOpen(userInitiated: true),
                    ),
                    if (state.homeAddress != null && state.source != LocationSource.home) ...[
                      const Divider(indent: 70),
                      ListTileRow(
                        icon: Icons.home_work_outlined,
                        title: l10n.settingsUseHomeNow,
                        onTap: cubit.useHome,
                      ),
                    ],
                  ],
                ),
              ),
              SectionHeader(l10n.settingsLocationSection),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    SwitchListTile(
                      secondary: const PanelIcon(icon: Icons.radar_outlined, size: 36),
                      title: Text(l10n.settingsWatchMode),
                      subtitle: Text(l10n.settingsWatchModeSub),
                      value: state.backgroundEnabled,
                      onChanged: (v) => cubit.setBackgroundEnabled(enabled: v),
                    ),
                    if (state.access == LocationAccess.denied) ...[
                      const Divider(indent: 16),
                      ListTileRow(
                        icon: Icons.location_disabled_outlined,
                        iconColor: TarczaPalette.high,
                        title: l10n.onbLocationAllow,
                        subtitle: l10n.settingsOpenSystemSettings,
                        onTap: () async {
                          await cubit.requestWhileInUse();
                          if (cubit.state.access == LocationAccess.denied) {
                            await cubit.openSystemSettings();
                          }
                        },
                      ),
                    ],
                    const Divider(indent: 16),
                    SwitchListTile(
                      secondary: const PanelIcon(icon: Icons.alarm_outlined, size: 36),
                      title: Text(l10n.settingsLocationReminders),
                      subtitle: Text(l10n.settingsLocationRemindersSub),
                      value: state.locationRefresh,
                      onChanged: (v) => cubit.setLocationRefresh(enabled: v),
                    ),
                  ],
                ),
              ),
              SectionHeader(l10n.settingsNotifications),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: ListTileRow(
                  icon: Icons.notifications_outlined,
                  title: l10n.settingsNotificationsSub,
                  trailing: TextButton(
                    onPressed: () => getIt<PushService>().requestPermission(),
                    child: Text(l10n.settingsNotificationsAllow),
                  ),
                ),
              ),
              SectionHeader(l10n.settingsDeveloper),
              TarczaCard(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    ListTileRow(
                      icon: Icons.dns_outlined,
                      title: l10n.settingsMode,
                      subtitle: AppConfig.useMocks
                          ? l10n.settingsModeMock
                          : l10n.settingsModeRemote(AppConfig.apiBaseUrl),
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
                    const Divider(indent: 70),
                    ListTileRow(
                      icon: Icons.preview_outlined,
                      iconColor: TarczaPalette.high,
                      title: l10n.previewTitle,
                      subtitle: l10n.previewSub,
                      onTap: () => context.push(AppRoutes.preview),
                    ),
                    const Divider(indent: 70),
                    ListTileRow(
                      icon: Icons.restart_alt,
                      iconColor: TarczaPalette.accentRed,
                      title: l10n.settingsResetApp,
                      onTap: _resetApp,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
