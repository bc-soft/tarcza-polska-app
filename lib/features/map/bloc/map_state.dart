part of "map_bloc.dart";

enum MapStatus { initial, loading, ready, failure }

/// Żądanie ruchu kamery; [id] rośnie, żeby widok zareagował także na powtórzenie.
class MapFocus extends Equatable {
  const MapFocus({required this.points, required this.id, this.zoom});

  final List<LatLng> points;
  final double? zoom;
  final int id;

  @override
  List<Object?> get props => [points, zoom, id];
}

class MapState extends Equatable {
  const MapState({
    this.status = MapStatus.initial,
    this.incidents = const [],
    this.shelters = const [],
    this.alerts = const [],
    this.bbox,
    this.refreshFailed = false,
    this.focus,
    this.selectedIncidentId,
  });

  final MapStatus status;
  final List<Incident> incidents;
  final List<Shelter> shelters;
  final List<Alert> alerts;
  final BBox? bbox;
  final bool refreshFailed;
  final MapFocus? focus;
  final String? selectedIncidentId;

  Incident? get selectedIncident => incidents.where((i) => i.id == selectedIncidentId).firstOrNull;

  /// Karty na dole mapy: najpierw wybrany incydent, potem od najbardziej wiarygodnych.
  List<Incident> get rankedIncidents => [...incidents]
    ..sort((a, b) {
      if (a.id == selectedIncidentId) return -1;
      if (b.id == selectedIncidentId) return 1;
      return b.confidenceScore.compareTo(a.confidenceScore);
    });

  MapState withFeatures(List<MapFeature> features) => copyWith(
    status: MapStatus.ready,
    refreshFailed: false,
    incidents: [
      for (final f in features)
        if (f case IncidentFeature(:final incident)) incident,
    ],
    shelters: [
      for (final f in features)
        if (f case ShelterFeature(:final shelter)) shelter,
    ],
    alerts: [
      for (final f in features)
        if (f case AlertFeature(:final alert)) alert,
    ],
  );

  MapState copyWith({
    MapStatus? status,
    List<Incident>? incidents,
    List<Shelter>? shelters,
    List<Alert>? alerts,
    BBox? bbox,
    bool? refreshFailed,
    MapFocus? focus,
    String? selectedIncidentId,
    bool clearSelection = false,
  }) => MapState(
    status: status ?? this.status,
    incidents: incidents ?? this.incidents,
    shelters: shelters ?? this.shelters,
    alerts: alerts ?? this.alerts,
    bbox: bbox ?? this.bbox,
    refreshFailed: refreshFailed ?? this.refreshFailed,
    focus: focus ?? this.focus,
    selectedIncidentId: clearSelection ? null : (selectedIncidentId ?? this.selectedIncidentId),
  );

  @override
  List<Object?> get props => [
    status,
    incidents,
    shelters,
    alerts,
    bbox,
    refreshFailed,
    focus,
    selectedIncidentId,
  ];
}
