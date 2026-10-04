import "dart:async";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";
import "package:rxdart/rxdart.dart";

import "package:tarcza_polska/data/models/models.dart";
import "package:tarcza_polska/data/repositories/repositories.dart";

part "map_event.dart";
part "map_state.dart";

/// Mapa: subskrypcja `watchMap(bbox)` (polling / zmiany mocka). Zmiana okna mapy
/// restartuje subskrypcję (debounce + switchMap), błąd odświeżenia zostawia ostatni stan.
class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({required this._repository}) : super(const MapState()) {
    on<MapViewportChanged>(_onViewport, transformer: _debounce());
    on<MapRefreshRequested>(_onRefresh);
    // Jedna subskrypcja naraz — nowe okno lub odświeżenie anuluje poprzednią.
    on<_MapSubscriptionRequested>(_onSubscribe, transformer: _restartable());
    on<MapFocusRequested>(_onFocus);
    on<MapIncidentSelected>(_onSelected);
  }

  final MapRepository _repository;

  static EventTransformer<E> _debounce<E>() =>
      (events, mapper) =>
          events.debounceTime(const Duration(milliseconds: 350)).asyncExpand(mapper);

  static EventTransformer<E> _restartable<E>() =>
      (events, mapper) => events.switchMap(mapper);

  void _onViewport(MapViewportChanged event, Emitter<MapState> emit) {
    if (event.bbox == state.bbox) return;
    emit(state.copyWith(bbox: event.bbox));
    add(_MapSubscriptionRequested(event.bbox));
  }

  void _onRefresh(MapRefreshRequested event, Emitter<MapState> emit) {
    final bbox = state.bbox;
    if (bbox != null) add(_MapSubscriptionRequested(bbox));
  }

  Future<void> _onSubscribe(_MapSubscriptionRequested event, Emitter<MapState> emit) async {
    if (state.status == MapStatus.initial) emit(state.copyWith(status: MapStatus.loading));
    await emit.forEach<List<MapFeature>>(
      _repository.watchMap(event.bbox),
      onData: (features) => state.withFeatures(features),
      onError: (_, _) => state.copyWith(
        status: state.status == MapStatus.ready ? MapStatus.ready : MapStatus.failure,
        refreshFailed: true,
      ),
    );
  }

  void _onFocus(MapFocusRequested event, Emitter<MapState> emit) {
    emit(
      state.copyWith(
        focus: MapFocus(points: event.points, zoom: event.zoom, id: (state.focus?.id ?? 0) + 1),
        selectedIncidentId: event.selectIncidentId,
      ),
    );
  }

  void _onSelected(MapIncidentSelected event, Emitter<MapState> emit) {
    emit(
      state.copyWith(
        selectedIncidentId: event.incidentId,
        clearSelection: event.incidentId == null,
      ),
    );
  }
}
