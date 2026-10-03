import "package:equatable/equatable.dart";
import "package:flutter/foundation.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:latlong2/latlong.dart";

import "package:tarcza_polska/core/location/location_service.dart";
import "package:tarcza_polska/data/models/models.dart";

enum AddressSearch { idle, searching, found, notFound }

class AddressPickerState extends Equatable {
  const AddressPickerState({
    this.query = "",
    this.search = AddressSearch.idle,
    this.label,
    this.position,
  });

  final String query;
  final AddressSearch search;
  final String? label;
  final LatLng? position;

  HomeAddress? get address => position == null
      ? null
      : HomeAddress(label: label ?? _coords(position!), location: position!);

  static String _coords(LatLng p) =>
      "${p.latitude.toStringAsFixed(4)}, ${p.longitude.toStringAsFixed(4)}";

  AddressPickerState copyWith({
    String? query,
    AddressSearch? search,
    String? label,
    LatLng? position,
  }) => AddressPickerState(
    query: query ?? this.query,
    search: search ?? this.search,
    label: label ?? this.label,
    position: position ?? this.position,
  );

  @override
  List<Object?> get props => [query, search, label, position];
}

/// Adres domowy: geokodowanie wpisanego tekstu + korekta pinezki na mapie.
class AddressPickerCubit extends Cubit<AddressPickerState> {
  AddressPickerCubit({required LocationService locationService, HomeAddress? initial})
    : _location = locationService,
      super(
        initial == null
            ? const AddressPickerState()
            : AddressPickerState(
                query: initial.label,
                search: AddressSearch.found,
                label: initial.label,
                position: initial.location,
              ),
      );

  final LocationService _location;

  void setQuery(String value) => emit(
    state.copyWith(
      query: value,
      search: state.search == AddressSearch.notFound ? AddressSearch.idle : null,
    ),
  );

  Future<void> search() async {
    final query = state.query.trim();
    if (query.isEmpty) return;
    emit(state.copyWith(search: AddressSearch.searching));
    try {
      final first = (await _location.geocode(query)).firstOrNull;
      if (isClosed) return;
      emit(
        first == null
            ? state.copyWith(search: AddressSearch.notFound)
            : state.copyWith(
                search: AddressSearch.found,
                label: first.label,
                position: first.location,
              ),
      );
    } on Object catch (e) {
      debugPrint("Geokodowanie: $e");
      if (!isClosed) emit(state.copyWith(search: AddressSearch.notFound));
    }
  }

  /// Ręczna korekta pinezki — etykieta z geokodowania odwrotnego, gdy się uda.
  Future<void> movePin(LatLng position) async {
    emit(state.copyWith(position: position, search: AddressSearch.found));
    final label = await _location.reverseGeocode(position);
    if (label != null && !isClosed && state.position == position) {
      emit(state.copyWith(label: label));
    }
  }

  void useAddress(HomeAddress address) => emit(
    AddressPickerState(
      query: address.label,
      search: AddressSearch.found,
      label: address.label,
      position: address.location,
    ),
  );
}
