// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:freezed_annotation/freezed_annotation.dart';

import 'poi_kind.dart';

part 'poi.freezed.dart';
part 'poi.g.dart';

@Freezed()
abstract class Poi with _$Poi {
  const factory Poi({
    required PoiKind kind,
    required String id,
    required String name,
  }) = _Poi;
  
  factory Poi.fromJson(Map<String, Object?> json) => _$PoiFromJson(json);
}
