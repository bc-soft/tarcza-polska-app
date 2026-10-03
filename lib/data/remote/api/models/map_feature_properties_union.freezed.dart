// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_feature_properties_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
MapFeaturePropertiesUnion _$MapFeaturePropertiesUnionFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'incident':
          return MapFeaturePropertiesUnionIncident.fromJson(
            json
          );
                case 'shelter':
          return MapFeaturePropertiesUnionShelter.fromJson(
            json
          );
                case 'fuel_station':
          return MapFeaturePropertiesUnionFuelStation.fromJson(
            json
          );
                case 'alert':
          return MapFeaturePropertiesUnionAlert.fromJson(
            json
          );
        
          default:
            return MapFeaturePropertiesUnionUnknown.fromJson(
  json
);
        }
      
}

/// @nodoc
mixin _$MapFeaturePropertiesUnion {



  /// Serializes this MapFeaturePropertiesUnion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnion);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MapFeaturePropertiesUnion()';
}


}

/// @nodoc
class $MapFeaturePropertiesUnionCopyWith<$Res>  {
$MapFeaturePropertiesUnionCopyWith(MapFeaturePropertiesUnion _, $Res Function(MapFeaturePropertiesUnion) __);
}


/// Adds pattern-matching-related methods to [MapFeaturePropertiesUnion].
extension MapFeaturePropertiesUnionPatterns on MapFeaturePropertiesUnion {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MapFeaturePropertiesUnionIncident value)?  incident,TResult Function( MapFeaturePropertiesUnionShelter value)?  shelter,TResult Function( MapFeaturePropertiesUnionFuelStation value)?  fuelStation,TResult Function( MapFeaturePropertiesUnionAlert value)?  alert,TResult Function( MapFeaturePropertiesUnionUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident() when incident != null:
return incident(_that);case MapFeaturePropertiesUnionShelter() when shelter != null:
return shelter(_that);case MapFeaturePropertiesUnionFuelStation() when fuelStation != null:
return fuelStation(_that);case MapFeaturePropertiesUnionAlert() when alert != null:
return alert(_that);case MapFeaturePropertiesUnionUnknown() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MapFeaturePropertiesUnionIncident value)  incident,required TResult Function( MapFeaturePropertiesUnionShelter value)  shelter,required TResult Function( MapFeaturePropertiesUnionFuelStation value)  fuelStation,required TResult Function( MapFeaturePropertiesUnionAlert value)  alert,required TResult Function( MapFeaturePropertiesUnionUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident():
return incident(_that);case MapFeaturePropertiesUnionShelter():
return shelter(_that);case MapFeaturePropertiesUnionFuelStation():
return fuelStation(_that);case MapFeaturePropertiesUnionAlert():
return alert(_that);case MapFeaturePropertiesUnionUnknown():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MapFeaturePropertiesUnionIncident value)?  incident,TResult? Function( MapFeaturePropertiesUnionShelter value)?  shelter,TResult? Function( MapFeaturePropertiesUnionFuelStation value)?  fuelStation,TResult? Function( MapFeaturePropertiesUnionAlert value)?  alert,TResult? Function( MapFeaturePropertiesUnionUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident() when incident != null:
return incident(_that);case MapFeaturePropertiesUnionShelter() when shelter != null:
return shelter(_that);case MapFeaturePropertiesUnionFuelStation() when fuelStation != null:
return fuelStation(_that);case MapFeaturePropertiesUnionAlert() when alert != null:
return alert(_that);case MapFeaturePropertiesUnionUnknown() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  IncidentFeaturePropertiesKind kind,  DateTime? lastConfirmedAt,  String? summary)?  incident,TResult Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  ShelterFeaturePropertiesKind kind,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)?  shelter,TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  fuelStation,TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)?  alert,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident() when incident != null:
return incident(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.kind,_that.lastConfirmedAt,_that.summary);case MapFeaturePropertiesUnionShelter() when shelter != null:
return shelter(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.kind,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionFuelStation() when fuelStation != null:
return fuelStation(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionAlert() when alert != null:
return alert(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case MapFeaturePropertiesUnionUnknown() when unknown != null:
return unknown();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  IncidentFeaturePropertiesKind kind,  DateTime? lastConfirmedAt,  String? summary)  incident,required TResult Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  ShelterFeaturePropertiesKind kind,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)  shelter,required TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)  fuelStation,required TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)  alert,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident():
return incident(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.kind,_that.lastConfirmedAt,_that.summary);case MapFeaturePropertiesUnionShelter():
return shelter(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.kind,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionFuelStation():
return fuelStation(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionAlert():
return alert(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case MapFeaturePropertiesUnionUnknown():
return unknown();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  IncidentFeaturePropertiesKind kind,  DateTime? lastConfirmedAt,  String? summary)?  incident,TResult? Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  ShelterFeaturePropertiesKind kind,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)?  shelter,TResult? Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  fuelStation,TResult? Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)?  alert,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case MapFeaturePropertiesUnionIncident() when incident != null:
return incident(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.kind,_that.lastConfirmedAt,_that.summary);case MapFeaturePropertiesUnionShelter() when shelter != null:
return shelter(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.kind,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionFuelStation() when fuelStation != null:
return fuelStation(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case MapFeaturePropertiesUnionAlert() when alert != null:
return alert(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case MapFeaturePropertiesUnionUnknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class MapFeaturePropertiesUnionIncident implements MapFeaturePropertiesUnion {
  const MapFeaturePropertiesUnionIncident({required this.id, required this.type, required this.typeLabel, required this.status, required this.statusLabel, required this.confidenceLevel, required this.confidenceLabel, required this.confidenceScore, required this.startedAt, required this.lastActivityAt, required this.community, required this.scope, required this.poi, required  List<FuelType> fuelTypes, required this.kind, this.lastConfirmedAt, this.summary}): _fuelTypes = fuelTypes;
  factory MapFeaturePropertiesUnionIncident.fromJson(Map<String, dynamic> json) => _$MapFeaturePropertiesUnionIncidentFromJson(json);

 final  String id;
 final  ReportType type;
 final  String typeLabel;
 final  IncidentStatus status;
 final  String statusLabel;
 final  ConfidenceLevel confidenceLevel;
 final  String confidenceLabel;
 final  double confidenceScore;
 final  DateTime startedAt;
 final  DateTime lastActivityAt;
 final  Community community;
 final  ReportScope scope;
/// scope=point: the station / shelter this incident is about
 final  PoiRef? poi;
/// Fuel types reported missing (fuel_shortage)
 final  List<FuelType> _fuelTypes;
/// Fuel types reported missing (fuel_shortage)
 List<FuelType> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}

 final  IncidentFeaturePropertiesKind kind;
 final  DateTime? lastConfirmedAt;
/// AI research summary, when available
 final  String? summary;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionIncidentCopyWith<MapFeaturePropertiesUnionIncident> get copyWith => _$MapFeaturePropertiesUnionIncidentCopyWithImpl<MapFeaturePropertiesUnionIncident>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeaturePropertiesUnionIncidentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnionIncident&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.confidenceLevel, confidenceLevel) || other.confidenceLevel == confidenceLevel)&&(identical(other.confidenceLabel, confidenceLabel) || other.confidenceLabel == confidenceLabel)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.community, community) || other.community == community)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.poi, poi) || other.poi == poi)&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,typeLabel,status,statusLabel,confidenceLevel,confidenceLabel,confidenceScore,startedAt,lastActivityAt,community,scope,poi,const DeepCollectionEquality().hash(_fuelTypes),kind,lastConfirmedAt,summary);
}

@override
String toString() {
    return 'MapFeaturePropertiesUnion.incident(id: $id, type: $type, typeLabel: $typeLabel, status: $status, statusLabel: $statusLabel, confidenceLevel: $confidenceLevel, confidenceLabel: $confidenceLabel, confidenceScore: $confidenceScore, startedAt: $startedAt, lastActivityAt: $lastActivityAt, community: $community, scope: $scope, poi: $poi, fuelTypes: $fuelTypes, kind: $kind, lastConfirmedAt: $lastConfirmedAt, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $MapFeaturePropertiesUnionIncidentCopyWith<$Res> implements $MapFeaturePropertiesUnionCopyWith<$Res> {
  factory $MapFeaturePropertiesUnionIncidentCopyWith(MapFeaturePropertiesUnionIncident value, $Res Function(MapFeaturePropertiesUnionIncident) _then) = _$MapFeaturePropertiesUnionIncidentCopyWithImpl;
@useResult
$Res call({
 String id, ReportType type, String typeLabel, IncidentStatus status, String statusLabel, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore, DateTime startedAt, DateTime lastActivityAt, Community community, ReportScope scope, PoiRef? poi, List<FuelType> fuelTypes, IncidentFeaturePropertiesKind kind, DateTime? lastConfirmedAt, String? summary
});


$CommunityCopyWith<$Res> get community;$PoiRefCopyWith<$Res>? get poi;

}
/// @nodoc
class _$MapFeaturePropertiesUnionIncidentCopyWithImpl<$Res>
    implements $MapFeaturePropertiesUnionIncidentCopyWith<$Res> {
  _$MapFeaturePropertiesUnionIncidentCopyWithImpl(this._self, this._then);

  final MapFeaturePropertiesUnionIncident _self;
  final $Res Function(MapFeaturePropertiesUnionIncident) _then;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? statusLabel = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,Object? startedAt = null,Object? lastActivityAt = null,Object? community = null,Object? scope = null,Object? poi = freezed,Object? fuelTypes = null,Object? kind = null,Object? lastConfirmedAt = freezed,Object? summary = freezed,}) {
  return _then(MapFeaturePropertiesUnionIncident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceLabel: null == confidenceLabel ? _self.confidenceLabel : confidenceLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ReportScope,poi: freezed == poi ? _self.poi : poi // ignore: cast_nullable_to_non_nullable
as PoiRef?,fuelTypes: null == fuelTypes ? _self._fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as IncidentFeaturePropertiesKind,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PoiRefCopyWith<$Res>? get poi {
    if (_self.poi == null) {
    return null;
  }

  return $PoiRefCopyWith<$Res>(_self.poi!, (value) {
    return _then(_self.copyWith(poi: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class MapFeaturePropertiesUnionShelter implements MapFeaturePropertiesUnion {
  const MapFeaturePropertiesUnionShelter({required this.id, required this.name, required this.status, required this.statusLabel, required this.occupancy, required this.occupancyLabel, required this.confirmationCount, required this.kind, this.address, this.capacity, this.availability, this.availabilityLabel, this.lastConfirmedAt, this.distanceMeters});
  factory MapFeaturePropertiesUnionShelter.fromJson(Map<String, dynamic> json) => _$MapFeaturePropertiesUnionShelterFromJson(json);

 final  String id;
 final  String name;
 final  ShelterStatus status;
 final  String statusLabel;
 final  ShelterOccupancy occupancy;
 final  String occupancyLabel;
 final  int confirmationCount;
 final  ShelterFeaturePropertiesKind kind;
 final  String? address;
 final  int? capacity;
 final  ShelterAvailability? availability;
 final  String? availabilityLabel;
 final  DateTime? lastConfirmedAt;
/// Only in GET /shelters?lat&lng
 final  int? distanceMeters;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionShelterCopyWith<MapFeaturePropertiesUnionShelter> get copyWith => _$MapFeaturePropertiesUnionShelterCopyWithImpl<MapFeaturePropertiesUnionShelter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeaturePropertiesUnionShelterToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnionShelter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.occupancy, occupancy) || other.occupancy == occupancy)&&(identical(other.occupancyLabel, occupancyLabel) || other.occupancyLabel == occupancyLabel)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.availabilityLabel, availabilityLabel) || other.availabilityLabel == availabilityLabel)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,statusLabel,occupancy,occupancyLabel,confirmationCount,kind,address,capacity,availability,availabilityLabel,lastConfirmedAt,distanceMeters);
}

@override
String toString() {
    return 'MapFeaturePropertiesUnion.shelter(id: $id, name: $name, status: $status, statusLabel: $statusLabel, occupancy: $occupancy, occupancyLabel: $occupancyLabel, confirmationCount: $confirmationCount, kind: $kind, address: $address, capacity: $capacity, availability: $availability, availabilityLabel: $availabilityLabel, lastConfirmedAt: $lastConfirmedAt, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class $MapFeaturePropertiesUnionShelterCopyWith<$Res> implements $MapFeaturePropertiesUnionCopyWith<$Res> {
  factory $MapFeaturePropertiesUnionShelterCopyWith(MapFeaturePropertiesUnionShelter value, $Res Function(MapFeaturePropertiesUnionShelter) _then) = _$MapFeaturePropertiesUnionShelterCopyWithImpl;
@useResult
$Res call({
 String id, String name, ShelterStatus status, String statusLabel, ShelterOccupancy occupancy, String occupancyLabel, int confirmationCount, ShelterFeaturePropertiesKind kind, String? address, int? capacity, ShelterAvailability? availability, String? availabilityLabel, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class _$MapFeaturePropertiesUnionShelterCopyWithImpl<$Res>
    implements $MapFeaturePropertiesUnionShelterCopyWith<$Res> {
  _$MapFeaturePropertiesUnionShelterCopyWithImpl(this._self, this._then);

  final MapFeaturePropertiesUnionShelter _self;
  final $Res Function(MapFeaturePropertiesUnionShelter) _then;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? statusLabel = null,Object? occupancy = null,Object? occupancyLabel = null,Object? confirmationCount = null,Object? kind = null,Object? address = freezed,Object? capacity = freezed,Object? availability = freezed,Object? availabilityLabel = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(MapFeaturePropertiesUnionShelter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,occupancy: null == occupancy ? _self.occupancy : occupancy // ignore: cast_nullable_to_non_nullable
as ShelterOccupancy,occupancyLabel: null == occupancyLabel ? _self.occupancyLabel : occupancyLabel // ignore: cast_nullable_to_non_nullable
as String,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ShelterFeaturePropertiesKind,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ShelterAvailability?,availabilityLabel: freezed == availabilityLabel ? _self.availabilityLabel : availabilityLabel // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MapFeaturePropertiesUnionFuelStation implements MapFeaturePropertiesUnion {
  const MapFeaturePropertiesUnionFuelStation({required this.id, required this.name, required  List<FuelStationFuel> fuels, required this.shortage, required  List<FuelType> missingFuelTypes, required this.confirmationCount, required this.kind, this.brand, this.address, this.lastConfirmedAt, this.distanceMeters}): _fuels = fuels,_missingFuelTypes = missingFuelTypes;
  factory MapFeaturePropertiesUnionFuelStation.fromJson(Map<String, dynamic> json) => _$MapFeaturePropertiesUnionFuelStationFromJson(json);

 final  String id;
 final  String name;
/// Fuel types sold (or ever reported) at this station with current availability
 final  List<FuelStationFuel> _fuels;
/// Fuel types sold (or ever reported) at this station with current availability
 List<FuelStationFuel> get fuels {
  if (_fuels is EqualUnmodifiableListView) return _fuels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuels);
}

/// At least one fuel type currently reported missing
 final  bool shortage;
 final  List<FuelType> _missingFuelTypes;
 List<FuelType> get missingFuelTypes {
  if (_missingFuelTypes is EqualUnmodifiableListView) return _missingFuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingFuelTypes);
}

 final  int confirmationCount;
 final  FuelStationFeaturePropertiesKind kind;
 final  String? brand;
 final  String? address;
 final  DateTime? lastConfirmedAt;
/// Only in GET /fuel-stations?lat&lng and the offline bundle
 final  int? distanceMeters;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionFuelStationCopyWith<MapFeaturePropertiesUnionFuelStation> get copyWith => _$MapFeaturePropertiesUnionFuelStationCopyWithImpl<MapFeaturePropertiesUnionFuelStation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeaturePropertiesUnionFuelStationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnionFuelStation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.fuels, _fuels)&&(identical(other.shortage, shortage) || other.shortage == shortage)&&const DeepCollectionEquality().equals(other.missingFuelTypes, _missingFuelTypes)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.address, address) || other.address == address)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_fuels),shortage,const DeepCollectionEquality().hash(_missingFuelTypes),confirmationCount,kind,brand,address,lastConfirmedAt,distanceMeters);
}

@override
String toString() {
    return 'MapFeaturePropertiesUnion.fuelStation(id: $id, name: $name, fuels: $fuels, shortage: $shortage, missingFuelTypes: $missingFuelTypes, confirmationCount: $confirmationCount, kind: $kind, brand: $brand, address: $address, lastConfirmedAt: $lastConfirmedAt, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class $MapFeaturePropertiesUnionFuelStationCopyWith<$Res> implements $MapFeaturePropertiesUnionCopyWith<$Res> {
  factory $MapFeaturePropertiesUnionFuelStationCopyWith(MapFeaturePropertiesUnionFuelStation value, $Res Function(MapFeaturePropertiesUnionFuelStation) _then) = _$MapFeaturePropertiesUnionFuelStationCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<FuelStationFuel> fuels, bool shortage, List<FuelType> missingFuelTypes, int confirmationCount, FuelStationFeaturePropertiesKind kind, String? brand, String? address, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class _$MapFeaturePropertiesUnionFuelStationCopyWithImpl<$Res>
    implements $MapFeaturePropertiesUnionFuelStationCopyWith<$Res> {
  _$MapFeaturePropertiesUnionFuelStationCopyWithImpl(this._self, this._then);

  final MapFeaturePropertiesUnionFuelStation _self;
  final $Res Function(MapFeaturePropertiesUnionFuelStation) _then;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? fuels = null,Object? shortage = null,Object? missingFuelTypes = null,Object? confirmationCount = null,Object? kind = null,Object? brand = freezed,Object? address = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(MapFeaturePropertiesUnionFuelStation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fuels: null == fuels ? _self._fuels : fuels // ignore: cast_nullable_to_non_nullable
as List<FuelStationFuel>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as bool,missingFuelTypes: null == missingFuelTypes ? _self._missingFuelTypes : missingFuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as FuelStationFeaturePropertiesKind,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MapFeaturePropertiesUnionAlert implements MapFeaturePropertiesUnion {
  const MapFeaturePropertiesUnionAlert({required this.id, required this.title, required this.body, required this.severity, required this.createdAt, required this.expiresAt, required this.active, required this.kind, this.incidentId});
  factory MapFeaturePropertiesUnionAlert.fromJson(Map<String, dynamic> json) => _$MapFeaturePropertiesUnionAlertFromJson(json);

 final  String id;
 final  String title;
 final  String body;
 final  AlertSeverity severity;
 final  DateTime createdAt;
 final  DateTime expiresAt;
 final  bool active;
 final  AlertFeaturePropertiesKind kind;
 final  String? incidentId;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionAlertCopyWith<MapFeaturePropertiesUnionAlert> get copyWith => _$MapFeaturePropertiesUnionAlertCopyWithImpl<MapFeaturePropertiesUnionAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeaturePropertiesUnionAlertToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnionAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,body,severity,createdAt,expiresAt,active,kind,incidentId);
}

@override
String toString() {
    return 'MapFeaturePropertiesUnion.alert(id: $id, title: $title, body: $body, severity: $severity, createdAt: $createdAt, expiresAt: $expiresAt, active: $active, kind: $kind, incidentId: $incidentId)';
}


}

/// @nodoc
abstract mixin class $MapFeaturePropertiesUnionAlertCopyWith<$Res> implements $MapFeaturePropertiesUnionCopyWith<$Res> {
  factory $MapFeaturePropertiesUnionAlertCopyWith(MapFeaturePropertiesUnionAlert value, $Res Function(MapFeaturePropertiesUnionAlert) _then) = _$MapFeaturePropertiesUnionAlertCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, AlertFeaturePropertiesKind kind, String? incidentId
});




}
/// @nodoc
class _$MapFeaturePropertiesUnionAlertCopyWithImpl<$Res>
    implements $MapFeaturePropertiesUnionAlertCopyWith<$Res> {
  _$MapFeaturePropertiesUnionAlertCopyWithImpl(this._self, this._then);

  final MapFeaturePropertiesUnionAlert _self;
  final $Res Function(MapFeaturePropertiesUnionAlert) _then;

/// Create a copy of MapFeaturePropertiesUnion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? kind = null,Object? incidentId = freezed,}) {
  return _then(MapFeaturePropertiesUnionAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AlertFeaturePropertiesKind,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MapFeaturePropertiesUnionUnknown implements MapFeaturePropertiesUnion {
  const MapFeaturePropertiesUnionUnknown({ String? $type}): $type = $type ?? 'unknown';
  factory MapFeaturePropertiesUnionUnknown.fromJson(Map<String, dynamic> json) => _$MapFeaturePropertiesUnionUnknownFromJson(json);



@JsonKey(name: 'kind')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$MapFeaturePropertiesUnionUnknownToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeaturePropertiesUnionUnknown);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MapFeaturePropertiesUnion.unknown()';
}


}




// dart format on
