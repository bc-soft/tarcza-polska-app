import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:tarcza_polska/core/error/failures.dart";
import "package:tarcza_polska/core/location/location_service.dart";
import "package:tarcza_polska/core/push/push_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";
import "package:tarcza_polska/features/settings/bloc/location_cubit.dart";

enum OnboardingStep { welcome, notifications, home, location, watchMode, finishing }

class OnboardingState extends Equatable {
  const OnboardingState({
    this.step = OnboardingStep.welcome,
    this.home,
    this.locationAccess = LocationAccess.denied,
    this.finishing = false,
    this.done = false,
    this.failure,
  });

  final OnboardingStep step;
  final HomeAddress? home;
  final LocationAccess locationAccess;
  final bool finishing;
  final bool done;
  final TarczaFailure? failure;

  /// Kroki widoczne w pasku postępu (bez ekranu powitalnego i końcowego).
  static const progressSteps = [
    OnboardingStep.notifications,
    OnboardingStep.home,
    OnboardingStep.location,
    OnboardingStep.watchMode,
  ];

  OnboardingState copyWith({
    OnboardingStep? step,
    HomeAddress? home,
    LocationAccess? locationAccess,
    bool? finishing,
    bool? done,
    TarczaFailure? failure,
  }) => OnboardingState(
    step: step ?? this.step,
    home: home ?? this.home,
    locationAccess: locationAccess ?? this.locationAccess,
    finishing: finishing ?? this.finishing,
    done: done ?? this.done,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    step,
    home,
    locationAccess,
    finishing,
    done,
    failure,
  ];
}

/// Zgody (powiadomienia, lokalizacja), adres domowy, rejestracja urządzenia,
/// propozycja trybu czuwania.
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required this._push,
    required LocationService locationService,
    required this._device,
    required this._locationCubit,
    required AppPreferences preferences,
  }) : _location = locationService,
       _prefs = preferences,
       super(const OnboardingState());

  final PushService _push;
  final LocationService _location;
  final DeviceRepository _device;
  final LocationCubit _locationCubit;
  final AppPreferences _prefs;

  void start() => emit(state.copyWith(step: OnboardingStep.notifications));

  Future<void> requestNotifications() async {
    await _push.requestPermission();
    await _prefs.setNotificationsAsked();
    emit(state.copyWith(step: OnboardingStep.home));
  }

  void skipNotifications() => emit(state.copyWith(step: OnboardingStep.home));

  void confirmHome(HomeAddress address) =>
      emit(state.copyWith(home: address, step: OnboardingStep.location));

  Future<void> requestLocation() async {
    final access = await _location.requestWhileInUse();
    emit(
      state.copyWith(
        locationAccess: access,
        step: access == LocationAccess.denied ? OnboardingStep.finishing : OnboardingStep.watchMode,
      ),
    );
    if (access == LocationAccess.denied) await finish();
  }

  Future<void> skipLocation() async {
    emit(state.copyWith(step: OnboardingStep.finishing));
    await finish();
  }

  Future<void> enableWatchMode() async {
    await _locationCubit.setBackgroundEnabled(enabled: true);
    emit(state.copyWith(step: OnboardingStep.finishing));
    await finish();
  }

  Future<void> skipWatchMode() async {
    emit(state.copyWith(step: OnboardingStep.finishing));
    await finish();
  }

  void back() {
    final previous = switch (state.step) {
      OnboardingStep.notifications => OnboardingStep.welcome,
      OnboardingStep.home => OnboardingStep.notifications,
      OnboardingStep.location => OnboardingStep.home,
      OnboardingStep.watchMode => OnboardingStep.location,
      _ => state.step,
    };
    emit(state.copyWith(step: previous));
  }

  /// Rejestracja urządzenia (`POST /devices`) i wysłanie pozycji bazowej.
  Future<void> finish() async {
    final home = state.home;
    if (home == null) return;
    emit(state.copyWith(finishing: true, step: OnboardingStep.finishing));
    try {
      await _device.ensureRegistered(pushToken: await _push.getToken());
      await _locationCubit.setHomeAddress(home);
      // Zgoda na GPS: od razu najświeższa pozycja zamiast samego adresu.
      if (state.locationAccess != LocationAccess.denied) {
        await _locationCubit.refreshOnOpen();
      }
      await _prefs.setOnboardingDone(value: true);
      emit(state.copyWith(finishing: false, done: true));
    } on TarczaFailure catch (e) {
      emit(state.copyWith(finishing: false, failure: e));
    }
  }
}
