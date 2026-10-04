// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PoiRef _$PoiRefFromJson(Map<String, dynamic> json) => _PoiRef(
  kind: PoiKind.fromJson(json['kind'] as String),
  id: json['id'] as String,
  name: json['name'] as String,
  location: json['location'] == null
      ? null
      : GeoJsonGeometry.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PoiRefToJson(_PoiRef instance) => <String, dynamic>{
  'kind': _$PoiKindEnumMap[instance.kind]!,
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
};

const _$PoiKindEnumMap = {
  PoiKind.fuelStation: 'fuel_station',
  PoiKind.shelter: 'shelter',
  PoiKind.$unknown: r'$unknown',
};
