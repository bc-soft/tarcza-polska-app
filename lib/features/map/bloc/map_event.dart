part of "map_bloc.dart";

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object?> get props => const [];
}

/// Koniec ruchu kamery — nowe okno mapy.
final class MapViewportChanged extends MapEvent {
  const MapViewportChanged(this.bbox);

  final BBox bbox;

  @override
  List<Object?> get props => [bbox];
}

/// Natychmiastowe odświeżenie (po zgłoszeniu, odpowiedzi, ręcznie).
final class MapRefreshRequested extends MapEvent {
  const MapRefreshRequested();
}

/// Przesunięcie kamery na obszar (np. „Pokaż na mapie” z alertu).
final class MapFocusRequested extends MapEvent {
  const MapFocusRequested(this.points, {this.zoom, this.selectIncidentId});

  final List<LatLng> points;
  final double? zoom;
  final String? selectIncidentId;

  @override
  List<Object?> get props => [points, zoom, selectIncidentId];
}

final class MapIncidentSelected extends MapEvent {
  const MapIncidentSelected(this.incidentId);

  final String? incidentId;

  @override
  List<Object?> get props => [incidentId];
}

final class _MapSubscriptionRequested extends MapEvent {
  const _MapSubscriptionRequested(this.bbox);

  final BBox bbox;

  @override
  List<Object?> get props => [bbox];
}
