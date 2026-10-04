import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter/foundation.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/location/background_location_service.dart";
import "package:tarcza_polska/core/location/location_service.dart";
import "package:tarcza_polska/core/storage/app_preferences.dart";
import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/location_repository.dart";

/// Wynik ostatniej akcji użytkownika — do jednorazowego komunikatu (snackbar).
enum LocationNotice { none, updated, noGps, backgroundDenied, failed }

class LocationState extends Equatable {
  const LocationState({
    this.homeAddress,
    this.position,
    this.livePosition,
    this.source,
    this.lastSentAt,
    this.cell,
    this.access = LocationAccess.denied,
    this.backgroundEnabled = false,
    this.locationRefresh = true,
    this.updating = false,
    this.notice = LocationNotice.none,
    this.noticeId = 0,
  });

  final HomeAddress? homeAddress;

  /// Ostatnio wysłana / ustalona pozycja (GPS lub tło); `null` → adres domowy.
  final LatLng? position;

  /// Bieżąca pozycja GPS (tylko UI — znacznik „jesteś tutaj”); `null` bez zgody lub w tle.
  final LatLng? livePosition;
  final LocationSource? source;
  final DateTime? lastSentAt;
  final String? cell;
  final LocationAccess access;
  final bool backgroundEnabled;

  /// Zgoda na przypomnienia push `location_refresh` (`PUT /devices/me/preferences`).
  final bool locationRefresh;
  final bool updating;
  final LocationNotice notice;

  /// Rośnie przy każdym nowym komunikacie (żeby powtórzony komunikat też się pokazał).
  final int noticeId;

  /// Pozycja, którą zna backend: najświeższa z dostępnych (tło → GPS → dom).
  LatLng? get effectivePosition => position ?? homeAddress?.location;

  /// Najlepsza znana pozycja do centrowania mapy / domyślnej lokalizacji zgłoszenia.
  LatLng? get bestPosition => livePosition ?? position ?? homeAddress?.location;

  LocationState copyWith({
    HomeAddress? homeAddress,
    LatLng? position,
    bool clearPosition = false,
    LatLng? livePosition,
    bool clearLivePosition = false,
    LocationSource? source,
    DateTime? lastSentAt,
    String? cell,
    LocationAccess? access,
    bool? backgroundEnabled,
    bool? locationRefresh,
    bool? updating,
    LocationNotice? notice,
  }) => LocationState(
    homeAddress: homeAddress ?? this.homeAddress,
    position: clearPosition ? null : (position ?? this.position),
    livePosition: clearLivePosition ? null : (livePosition ?? this.livePosition),
    source: source ?? this.source,
    lastSentAt: lastSentAt ?? this.lastSentAt,
    cell: cell ?? this.cell,
    access: access ?? this.access,
    backgroundEnabled: backgroundEnabled ?? this.backgroundEnabled,
    locationRefresh: locationRefresh ?? this.locationRefresh,
    updating: updating ?? this.updating,
    notice: notice ?? this.notice,
    noticeId: notice == null ? noticeId : noticeId + 1,
  );

  @override
  List<Object?> get props => [
    homeAddress,
    position,
    livePosition,
    source,
    lastSentAt,
    cell,
    access,
    backgroundEnabled,
    locationRefresh,
    updating,
    notice,
    noticeId,
  ];
}

/// Pozycja urządzenia: adres domowy, odświeżenie przy otwarciu, tryb czuwania.
class LocationCubit extends Cubit<LocationState> {
  LocationCubit({
    required this._repository,
    required LocationService locationService,
    required this._background,
    required AppPreferences preferences,
  }) : _location = locationService,
       _prefs = preferences,
       super(const LocationState());

  final LocationRepository _repository;
  final LocationService _location;
  final BackgroundLocationService _background;
  final AppPreferences _prefs;
  StreamSubscription<BackgroundLocationUpdate>? _backgroundSub;
  StreamSubscription<LatLng>? _liveSub;

  Future<void> start() async {
    // Uwaga: `await` przed `emit(state.copyWith(...))` — inaczej `state` zostałby odczytany
    // przed oczekiwaniem i nadpisałby zmiany wprowadzone w międzyczasie.
    final access = await _location.access();
    emit(
      state.copyWith(
        homeAddress: _repository.homeAddress,
        source: _repository.lastSource,
        lastSentAt: _repository.lastSentAt,
        cell: _repository.lastSentCell,
        access: access,
        backgroundEnabled: _prefs.backgroundEnabled,
        locationRefresh: _repository.locationRefreshEnabled,
      ),
    );
    _backgroundSub ??= _background.updates.listen(_onBackgroundUpdate);
    if (state.backgroundEnabled && state.access == LocationAccess.always) {
      await _background.start();
    }
  }

  /// Otwarcie aplikacji / powrót na pierwszy plan / push `location_refresh`.
  Future<void> refreshOnOpen({bool userInitiated = false}) async {
    if (state.updating) return;
    emit(state.copyWith(updating: true));
    final access = await _location.access();
    emit(state.copyWith(access: access));
    try {
      final gps = await _location.currentPosition();
      if (gps != null) {
        final position = LatLng(gps.latitude, gps.longitude);
        final result = await _repository.send(
          position,
          source: LocationSource.gps,
          accuracyMeters: gps.accuracy,
          force: userInitiated,
        );
        emit(
          state.copyWith(
            updating: false,
            position: position,
            source: LocationSource.gps,
            lastSentAt: result.sentAt,
            cell: result.cell,
            notice: userInitiated ? LocationNotice.updated : null,
          ),
        );
        return;
      }
      // Bez GPS zostaje adres domowy — wysyłamy go, jeśli backend jeszcze go nie zna.
      final home = state.homeAddress;
      if (home != null && (_repository.lastSentAt == null || userInitiated)) {
        await _sendHome(home, notice: userInitiated ? LocationNotice.noGps : null);
      } else {
        emit(state.copyWith(updating: false, notice: userInitiated ? LocationNotice.noGps : null));
      }
    } on Object catch (e) {
      debugPrint("Aktualizacja lokalizacji: $e");
      emit(state.copyWith(updating: false, notice: userInitiated ? LocationNotice.failed : null));
    }
  }

  Future<void> setHomeAddress(HomeAddress address) async {
    await _repository.saveHomeAddress(address);
    emit(state.copyWith(homeAddress: address));
    try {
      await _sendHome(address);
    } on Object catch (e) {
      debugPrint("Wysyłka adresu domowego: $e");
      emit(state.copyWith(updating: false, notice: LocationNotice.failed));
    }
  }

  /// „Wróć” do adresu domowego jednym tapnięciem.
  Future<void> useHome() async {
    final home = state.homeAddress;
    if (home == null) return;
    try {
      await _sendHome(home, notice: LocationNotice.updated);
    } on Object {
      emit(state.copyWith(updating: false, notice: LocationNotice.failed));
    }
  }

  Future<void> _sendHome(HomeAddress home, {LocationNotice? notice}) async {
    emit(state.copyWith(updating: true));
    final result = await _repository.send(
      home.location,
      source: LocationSource.home,
      force: true,
    );
    emit(
      state.copyWith(
        updating: false,
        clearPosition: true,
        source: LocationSource.home,
        lastSentAt: result.sentAt,
        cell: result.cell,
        notice: notice,
      ),
    );
  }

  Future<void> requestWhileInUse() async {
    final access = await _location.requestWhileInUse();
    emit(state.copyWith(access: access));
    if (access != LocationAccess.denied) await startLiveTracking();
  }

  Future<void> setBackgroundEnabled({required bool enabled}) async {
    if (!enabled) {
      await _background.stop();
      await _prefs.setBackgroundEnabled(value: false);
      emit(state.copyWith(backgroundEnabled: false));
      return;
    }
    // Najpierw „podczas używania”, potem „zawsze” — dwa kroki wymagane przez iOS i Android 11+.
    if (await _location.requestWhileInUse() == LocationAccess.denied ||
        !await _background.requestAlwaysPermission()) {
      final access = await _location.access();
      emit(state.copyWith(access: access, notice: LocationNotice.backgroundDenied));
      return;
    }
    final access = await _location.access();
    final started = await _background.start();
    await _prefs.setBackgroundEnabled(value: started);
    emit(
      state.copyWith(
        access: access,
        backgroundEnabled: started,
        notice: started ? null : LocationNotice.backgroundDenied,
      ),
    );
  }

  Future<bool> openSystemSettings() => _location.openSettings();

  Future<void> setLocationRefresh({required bool enabled}) async {
    emit(state.copyWith(locationRefresh: enabled));
    try {
      await _repository.setLocationRefresh(enabled: enabled);
    } on Object catch (e) {
      // Wartość lokalna zostaje — wyślemy ją przy następnej synchronizacji urządzenia.
      debugPrint("Preferencje urządzenia: $e");
    }
  }

  Future<void> _onBackgroundUpdate(BackgroundLocationUpdate update) async {
    try {
      final result = update.sentNatively
          ? LocationSendResult(sent: true, sentAt: DateTime.now())
          : await _repository.send(update.position, source: LocationSource.background);
      if (isClosed) return;
      emit(
        state.copyWith(
          position: update.position,
          source: LocationSource.background,
          lastSentAt: result.sentAt,
          cell: result.cell,
        ),
      );
    } on Object catch (e) {
      debugPrint("Tryb czuwania — wysyłka: $e");
    }
  }

  /// Znacznik „jesteś tutaj” — wywoływane przy wejściu aplikacji na pierwszy plan.
  Future<void> startLiveTracking() async {
    if (_liveSub != null || await _location.access() == LocationAccess.denied) return;
    _liveSub = _location.watchPosition().listen(
      (p) {
        if (!isClosed) emit(state.copyWith(livePosition: p));
      },
      onError: (Object e) {
        debugPrint("Pozycja na żywo: $e");
        stopLiveTracking();
      },
    );
  }

  /// Przy przejściu w tło — iOS i tak wstrzymałby aktualizacje, a nie chcemy GPS w tle
  /// poza świadomie włączonym trybem czuwania.
  void stopLiveTracking() {
    unawaited(_liveSub?.cancel());
    _liveSub = null;
  }

  List<LatLng> neighbourhood() {
    final p = state.effectivePosition;
    return p == null ? const [] : _repository.neighbourhoodBoundary(p);
  }

  @override
  Future<void> close() async {
    await _backgroundSub?.cancel();
    await _liveSub?.cancel();
    await super.close();
  }
}
