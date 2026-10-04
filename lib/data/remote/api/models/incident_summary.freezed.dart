// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentSummary {

 String get id; ReportType get type; String get typeLabel; IncidentStatus get status; String get statusLabel; ConfidenceLevel get confidenceLevel; String get confidenceLabel; double get confidenceScore; DateTime get startedAt; DateTime get lastActivityAt; Community get community; ReportScope get scope;/// scope=point: the station / shelter this incident is about
 PoiRef? get poi;/// Fuel types reported missing (fuel_shortage)
 List<FuelType> get fuelTypes; DateTime? get lastConfirmedAt;/// AI research summary, when available
 String? get summary;
/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentSummaryCopyWith<IncidentSummary> get copyWith => _$IncidentSummaryCopyWithImpl<IncidentSummary>(this as IncidentSummary, _$identity);

  /// Serializes this IncidentSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IncidentSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.confidenceLevel, _this.confidenceLevel) || other.confidenceLevel == _this.confidenceLevel)&&(identical(other.confidenceLabel, _this.confidenceLabel) || other.confidenceLabel == _this.confidenceLabel)&&(identical(other.confidenceScore, _this.confidenceScore) || other.confidenceScore == _this.confidenceScore)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.lastActivityAt, _this.lastActivityAt) || other.lastActivityAt == _this.lastActivityAt)&&(identical(other.community, _this.community) || other.community == _this.community)&&(identical(other.scope, _this.scope) || other.scope == _this.scope)&&(identical(other.poi, _this.poi) || other.poi == _this.poi)&&const DeepCollectionEquality().equals(other.fuelTypes, _this.fuelTypes)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.summary, _this.summary) || other.summary == _this.summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IncidentSummary;
  return Object.hash(runtimeType,_this.id,_this.type,_this.typeLabel,_this.status,_this.statusLabel,_this.confidenceLevel,_this.confidenceLabel,_this.confidenceScore,_this.startedAt,_this.lastActivityAt,_this.community,_this.scope,_this.poi,const DeepCollectionEquality().hash(_this.fuelTypes),_this.lastConfirmedAt,_this.summary);
}

@override
String toString() {
  final _this = this as IncidentSummary;
  return 'IncidentSummary(id: ${_this.id}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, confidenceLevel: ${_this.confidenceLevel}, confidenceLabel: ${_this.confidenceLabel}, confidenceScore: ${_this.confidenceScore}, startedAt: ${_this.startedAt}, lastActivityAt: ${_this.lastActivityAt}, community: ${_this.community}, scope: ${_this.scope}, poi: ${_this.poi}, fuelTypes: ${_this.fuelTypes}, lastConfirmedAt: ${_this.lastConfirmedAt}, summary: ${_this.summary})';
}


}

/// @nodoc
abstract mixin class $IncidentSummaryCopyWith<$Res>  {
  factory $IncidentSummaryCopyWith(IncidentSummary value, $Res Function(IncidentSummary) _then) = _$IncidentSummaryCopyWithImpl;
@useResult
$Res call({
 String id, ReportType type, String typeLabel, IncidentStatus status, String statusLabel, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore, DateTime startedAt, DateTime lastActivityAt, Community community, ReportScope scope, PoiRef? poi, List<FuelType> fuelTypes, DateTime? lastConfirmedAt, String? summary
});


$CommunityCopyWith<$Res> get community;$PoiRefCopyWith<$Res>? get poi;

}
/// @nodoc
class _$IncidentSummaryCopyWithImpl<$Res>
    implements $IncidentSummaryCopyWith<$Res> {
  _$IncidentSummaryCopyWithImpl(this._self, this._then);

  final IncidentSummary _self;
  final $Res Function(IncidentSummary) _then;

/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? statusLabel = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,Object? startedAt = null,Object? lastActivityAt = null,Object? community = null,Object? scope = null,Object? poi = freezed,Object? fuelTypes = null,Object? lastConfirmedAt = freezed,Object? summary = freezed,}) {
  return _then(IncidentSummary(
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
as PoiRef?,fuelTypes: null == fuelTypes ? _self.fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}/// Create a copy of IncidentSummary
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


/// Adds pattern-matching-related methods to [IncidentSummary].
extension IncidentSummaryPatterns on IncidentSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentSummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentSummary value)  $default,){
final _that = this;
switch (_that) {
case _IncidentSummary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentSummary value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentSummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  DateTime? lastConfirmedAt,  String? summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentSummary() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.lastConfirmedAt,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  DateTime? lastConfirmedAt,  String? summary)  $default,) {final _that = this;
switch (_that) {
case _IncidentSummary():
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.lastConfirmedAt,_that.summary);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  Community community,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes,  DateTime? lastConfirmedAt,  String? summary)?  $default,) {final _that = this;
switch (_that) {
case _IncidentSummary() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.community,_that.scope,_that.poi,_that.fuelTypes,_that.lastConfirmedAt,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentSummary implements IncidentSummary {
  const _IncidentSummary({required this.id, required this.type, required this.typeLabel, required this.status, required this.statusLabel, required this.confidenceLevel, required this.confidenceLabel, required this.confidenceScore, required this.startedAt, required this.lastActivityAt, required this.community, required this.scope, required this.poi, required  List<FuelType> fuelTypes, this.lastConfirmedAt, this.summary}): _fuelTypes = fuelTypes;
  factory _IncidentSummary.fromJson(Map<String, dynamic> json) => _$IncidentSummaryFromJson(json);

@override final  String id;
@override final  ReportType type;
@override final  String typeLabel;
@override final  IncidentStatus status;
@override final  String statusLabel;
@override final  ConfidenceLevel confidenceLevel;
@override final  String confidenceLabel;
@override final  double confidenceScore;
@override final  DateTime startedAt;
@override final  DateTime lastActivityAt;
@override final  Community community;
@override final  ReportScope scope;
/// scope=point: the station / shelter this incident is about
@override final  PoiRef? poi;
/// Fuel types reported missing (fuel_shortage)
 final  List<FuelType> _fuelTypes;
/// Fuel types reported missing (fuel_shortage)
@override List<FuelType> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}

@override final  DateTime? lastConfirmedAt;
/// AI research summary, when available
@override final  String? summary;

/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentSummaryCopyWith<_IncidentSummary> get copyWith => __$IncidentSummaryCopyWithImpl<_IncidentSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.confidenceLevel, confidenceLevel) || other.confidenceLevel == confidenceLevel)&&(identical(other.confidenceLabel, confidenceLabel) || other.confidenceLabel == confidenceLabel)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.community, community) || other.community == community)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.poi, poi) || other.poi == poi)&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,typeLabel,status,statusLabel,confidenceLevel,confidenceLabel,confidenceScore,startedAt,lastActivityAt,community,scope,poi,const DeepCollectionEquality().hash(_fuelTypes),lastConfirmedAt,summary);
}

@override
String toString() {
    return 'IncidentSummary(id: $id, type: $type, typeLabel: $typeLabel, status: $status, statusLabel: $statusLabel, confidenceLevel: $confidenceLevel, confidenceLabel: $confidenceLabel, confidenceScore: $confidenceScore, startedAt: $startedAt, lastActivityAt: $lastActivityAt, community: $community, scope: $scope, poi: $poi, fuelTypes: $fuelTypes, lastConfirmedAt: $lastConfirmedAt, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$IncidentSummaryCopyWith<$Res> implements $IncidentSummaryCopyWith<$Res> {
  factory _$IncidentSummaryCopyWith(_IncidentSummary value, $Res Function(_IncidentSummary) _then) = __$IncidentSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportType type, String typeLabel, IncidentStatus status, String statusLabel, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore, DateTime startedAt, DateTime lastActivityAt, Community community, ReportScope scope, PoiRef? poi, List<FuelType> fuelTypes, DateTime? lastConfirmedAt, String? summary
});


@override $CommunityCopyWith<$Res> get community;@override $PoiRefCopyWith<$Res>? get poi;

}
/// @nodoc
class __$IncidentSummaryCopyWithImpl<$Res>
    implements _$IncidentSummaryCopyWith<$Res> {
  __$IncidentSummaryCopyWithImpl(this._self, this._then);

  final _IncidentSummary _self;
  final $Res Function(_IncidentSummary) _then;

/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? statusLabel = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,Object? startedAt = null,Object? lastActivityAt = null,Object? community = null,Object? scope = null,Object? poi = freezed,Object? fuelTypes = null,Object? lastConfirmedAt = freezed,Object? summary = freezed,}) {
  return _then(_IncidentSummary(
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
as List<FuelType>,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of IncidentSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}/// Create a copy of IncidentSummary
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

// dart format on
