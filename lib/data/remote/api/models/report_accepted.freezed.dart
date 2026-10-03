// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_accepted.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportAccepted {

 String get reportId; String get h3Cell; DateTime get createdAt; ReportScope get scope;/// The station / shelter the report was bound to (point types)
 PoiRef? get poi; List<FuelType> get fuelTypes;
/// Create a copy of ReportAccepted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportAcceptedCopyWith<ReportAccepted> get copyWith => _$ReportAcceptedCopyWithImpl<ReportAccepted>(this as ReportAccepted, _$identity);

  /// Serializes this ReportAccepted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportAccepted;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportAccepted&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.h3Cell, _this.h3Cell) || other.h3Cell == _this.h3Cell)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.scope, _this.scope) || other.scope == _this.scope)&&(identical(other.poi, _this.poi) || other.poi == _this.poi)&&const DeepCollectionEquality().equals(other.fuelTypes, _this.fuelTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportAccepted;
  return Object.hash(runtimeType,_this.reportId,_this.h3Cell,_this.createdAt,_this.scope,_this.poi,const DeepCollectionEquality().hash(_this.fuelTypes));
}

@override
String toString() {
  final _this = this as ReportAccepted;
  return 'ReportAccepted(reportId: ${_this.reportId}, h3Cell: ${_this.h3Cell}, createdAt: ${_this.createdAt}, scope: ${_this.scope}, poi: ${_this.poi}, fuelTypes: ${_this.fuelTypes})';
}


}

/// @nodoc
abstract mixin class $ReportAcceptedCopyWith<$Res>  {
  factory $ReportAcceptedCopyWith(ReportAccepted value, $Res Function(ReportAccepted) _then) = _$ReportAcceptedCopyWithImpl;
@useResult
$Res call({
 String reportId, String h3Cell, DateTime createdAt, ReportScope scope, PoiRef? poi, List<FuelType> fuelTypes
});


$PoiRefCopyWith<$Res>? get poi;

}
/// @nodoc
class _$ReportAcceptedCopyWithImpl<$Res>
    implements $ReportAcceptedCopyWith<$Res> {
  _$ReportAcceptedCopyWithImpl(this._self, this._then);

  final ReportAccepted _self;
  final $Res Function(ReportAccepted) _then;

/// Create a copy of ReportAccepted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportId = null,Object? h3Cell = null,Object? createdAt = null,Object? scope = null,Object? poi = freezed,Object? fuelTypes = null,}) {
  return _then(ReportAccepted(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,h3Cell: null == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ReportScope,poi: freezed == poi ? _self.poi : poi // ignore: cast_nullable_to_non_nullable
as PoiRef?,fuelTypes: null == fuelTypes ? _self.fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,
  ));
}
/// Create a copy of ReportAccepted
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


/// Adds pattern-matching-related methods to [ReportAccepted].
extension ReportAcceptedPatterns on ReportAccepted {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportAccepted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportAccepted() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportAccepted value)  $default,){
final _that = this;
switch (_that) {
case _ReportAccepted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportAccepted value)?  $default,){
final _that = this;
switch (_that) {
case _ReportAccepted() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reportId,  String h3Cell,  DateTime createdAt,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportAccepted() when $default != null:
return $default(_that.reportId,_that.h3Cell,_that.createdAt,_that.scope,_that.poi,_that.fuelTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reportId,  String h3Cell,  DateTime createdAt,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes)  $default,) {final _that = this;
switch (_that) {
case _ReportAccepted():
return $default(_that.reportId,_that.h3Cell,_that.createdAt,_that.scope,_that.poi,_that.fuelTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reportId,  String h3Cell,  DateTime createdAt,  ReportScope scope,  PoiRef? poi,  List<FuelType> fuelTypes)?  $default,) {final _that = this;
switch (_that) {
case _ReportAccepted() when $default != null:
return $default(_that.reportId,_that.h3Cell,_that.createdAt,_that.scope,_that.poi,_that.fuelTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportAccepted implements ReportAccepted {
  const _ReportAccepted({required this.reportId, required this.h3Cell, required this.createdAt, required this.scope, required this.poi, required  List<FuelType> fuelTypes}): _fuelTypes = fuelTypes;
  factory _ReportAccepted.fromJson(Map<String, dynamic> json) => _$ReportAcceptedFromJson(json);

@override final  String reportId;
@override final  String h3Cell;
@override final  DateTime createdAt;
@override final  ReportScope scope;
/// The station / shelter the report was bound to (point types)
@override final  PoiRef? poi;
 final  List<FuelType> _fuelTypes;
@override List<FuelType> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}


/// Create a copy of ReportAccepted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportAcceptedCopyWith<_ReportAccepted> get copyWith => __$ReportAcceptedCopyWithImpl<_ReportAccepted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportAcceptedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportAccepted&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.h3Cell, h3Cell) || other.h3Cell == h3Cell)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.poi, poi) || other.poi == poi)&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reportId,h3Cell,createdAt,scope,poi,const DeepCollectionEquality().hash(_fuelTypes));
}

@override
String toString() {
    return 'ReportAccepted(reportId: $reportId, h3Cell: $h3Cell, createdAt: $createdAt, scope: $scope, poi: $poi, fuelTypes: $fuelTypes)';
}


}

/// @nodoc
abstract mixin class _$ReportAcceptedCopyWith<$Res> implements $ReportAcceptedCopyWith<$Res> {
  factory _$ReportAcceptedCopyWith(_ReportAccepted value, $Res Function(_ReportAccepted) _then) = __$ReportAcceptedCopyWithImpl;
@override @useResult
$Res call({
 String reportId, String h3Cell, DateTime createdAt, ReportScope scope, PoiRef? poi, List<FuelType> fuelTypes
});


@override $PoiRefCopyWith<$Res>? get poi;

}
/// @nodoc
class __$ReportAcceptedCopyWithImpl<$Res>
    implements _$ReportAcceptedCopyWith<$Res> {
  __$ReportAcceptedCopyWithImpl(this._self, this._then);

  final _ReportAccepted _self;
  final $Res Function(_ReportAccepted) _then;

/// Create a copy of ReportAccepted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportId = null,Object? h3Cell = null,Object? createdAt = null,Object? scope = null,Object? poi = freezed,Object? fuelTypes = null,}) {
  return _then(_ReportAccepted(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,h3Cell: null == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ReportScope,poi: freezed == poi ? _self.poi : poi // ignore: cast_nullable_to_non_nullable
as PoiRef?,fuelTypes: null == fuelTypes ? _self._fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,
  ));
}

/// Create a copy of ReportAccepted
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
