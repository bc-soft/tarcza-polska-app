// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Poi _$PoiFromJson(Map<String, dynamic> json) => _Poi(
  kind: PoiKind.fromJson(json['kind'] as String),
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$PoiToJson(_Poi instance) => <String, dynamic>{
  'kind': _$PoiKindEnumMap[instance.kind]!,
  'id': instance.id,
  'name': instance.name,
};

const _$PoiKindEnumMap = {
  PoiKind.fuelStation: 'fuel_station',
  PoiKind.shelter: 'shelter',
  PoiKind.$unknown: r'$unknown',
};
