// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_json_geometry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeoJsonGeometry {

 GeoJsonGeometryType get type;/// Point: [lng, lat]; Polygon: [[[lng, lat], ...]]; MultiPolygon: [[[[lng, lat], ...]]]
 List<dynamic> get coordinates;
/// Create a copy of GeoJsonGeometry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<GeoJsonGeometry> get copyWith => _$GeoJsonGeometryCopyWithImpl<GeoJsonGeometry>(this as GeoJsonGeometry, _$identity);

  /// Serializes this GeoJsonGeometry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as GeoJsonGeometry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoJsonGeometry&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.coordinates, _this.coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as GeoJsonGeometry;
  return Object.hash(runtimeType,_this.type,const DeepCollectionEquality().hash(_this.coordinates));
}

@override
String toString() {
  final _this = this as GeoJsonGeometry;
  return 'GeoJsonGeometry(type: ${_this.type}, coordinates: ${_this.coordinates})';
}


}

/// @nodoc
abstract mixin class $GeoJsonGeometryCopyWith<$Res>  {
  factory $GeoJsonGeometryCopyWith(GeoJsonGeometry value, $Res Function(GeoJsonGeometry) _then) = _$GeoJsonGeometryCopyWithImpl;
@useResult
$Res call({
 GeoJsonGeometryType type, List<dynamic> coordinates
});




}
/// @nodoc
class _$GeoJsonGeometryCopyWithImpl<$Res>
    implements $GeoJsonGeometryCopyWith<$Res> {
  _$GeoJsonGeometryCopyWithImpl(this._self, this._then);

  final GeoJsonGeometry _self;
  final $Res Function(GeoJsonGeometry) _then;

/// Create a copy of GeoJsonGeometry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(GeoJsonGeometry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometryType,coordinates: null == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoJsonGeometry].
extension GeoJsonGeometryPatterns on GeoJsonGeometry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoJsonGeometry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoJsonGeometry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoJsonGeometry value)  $default,){
final _that = this;
switch (_that) {
case _GeoJsonGeometry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoJsonGeometry value)?  $default,){
final _that = this;
switch (_that) {
case _GeoJsonGeometry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( GeoJsonGeometryType type,  List<dynamic> coordinates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoJsonGeometry() when $default != null:
return $default(_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( GeoJsonGeometryType type,  List<dynamic> coordinates)  $default,) {final _that = this;
switch (_that) {
case _GeoJsonGeometry():
return $default(_that.type,_that.coordinates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( GeoJsonGeometryType type,  List<dynamic> coordinates)?  $default,) {final _that = this;
switch (_that) {
case _GeoJsonGeometry() when $default != null:
return $default(_that.type,_that.coordinates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeoJsonGeometry implements GeoJsonGeometry {
  const _GeoJsonGeometry({required this.type, required  List<dynamic> coordinates}): _coordinates = coordinates;
  factory _GeoJsonGeometry.fromJson(Map<String, dynamic> json) => _$GeoJsonGeometryFromJson(json);

@override final  GeoJsonGeometryType type;
/// Point: [lng, lat]; Polygon: [[[lng, lat], ...]]; MultiPolygon: [[[[lng, lat], ...]]]
 final  List<dynamic> _coordinates;
/// Point: [lng, lat]; Polygon: [[[lng, lat], ...]]; MultiPolygon: [[[[lng, lat], ...]]]
@override List<dynamic> get coordinates {
  if (_coordinates is EqualUnmodifiableListView) return _coordinates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coordinates);
}


/// Create a copy of GeoJsonGeometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoJsonGeometryCopyWith<_GeoJsonGeometry> get copyWith => __$GeoJsonGeometryCopyWithImpl<_GeoJsonGeometry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeoJsonGeometryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoJsonGeometry&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.coordinates, _coordinates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_coordinates));
}

@override
String toString() {
    return 'GeoJsonGeometry(type: $type, coordinates: $coordinates)';
}


}

/// @nodoc
abstract mixin class _$GeoJsonGeometryCopyWith<$Res> implements $GeoJsonGeometryCopyWith<$Res> {
  factory _$GeoJsonGeometryCopyWith(_GeoJsonGeometry value, $Res Function(_GeoJsonGeometry) _then) = __$GeoJsonGeometryCopyWithImpl;
@override @useResult
$Res call({
 GeoJsonGeometryType type, List<dynamic> coordinates
});




}
/// @nodoc
class __$GeoJsonGeometryCopyWithImpl<$Res>
    implements _$GeoJsonGeometryCopyWith<$Res> {
  __$GeoJsonGeometryCopyWithImpl(this._self, this._then);

  final _GeoJsonGeometry _self;
  final $Res Function(_GeoJsonGeometry) _then;

/// Create a copy of GeoJsonGeometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? coordinates = null,}) {
  return _then(_GeoJsonGeometry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometryType,coordinates: null == coordinates ? _self._coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

// dart format on
