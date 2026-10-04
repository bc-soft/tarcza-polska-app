// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poi_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PoiRef {

 PoiKind get kind; String get id; String get name; GeoJsonGeometry? get location;
/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoiRefCopyWith<PoiRef> get copyWith => _$PoiRefCopyWithImpl<PoiRef>(this as PoiRef, _$identity);

  /// Serializes this PoiRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PoiRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoiRef&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.location, _this.location) || other.location == _this.location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PoiRef;
  return Object.hash(runtimeType,_this.kind,_this.id,_this.name,_this.location);
}

@override
String toString() {
  final _this = this as PoiRef;
  return 'PoiRef(kind: ${_this.kind}, id: ${_this.id}, name: ${_this.name}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $PoiRefCopyWith<$Res>  {
  factory $PoiRefCopyWith(PoiRef value, $Res Function(PoiRef) _then) = _$PoiRefCopyWithImpl;
@useResult
$Res call({
 PoiKind kind, String id, String name, GeoJsonGeometry? location
});


$GeoJsonGeometryCopyWith<$Res>? get location;

}
/// @nodoc
class _$PoiRefCopyWithImpl<$Res>
    implements $PoiRefCopyWith<$Res> {
  _$PoiRefCopyWithImpl(this._self, this._then);

  final PoiRef _self;
  final $Res Function(PoiRef) _then;

/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,Object? name = null,Object? location = freezed,}) {
  return _then(PoiRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PoiKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry?,
  ));
}
/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoJsonGeometryCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [PoiRef].
extension PoiRefPatterns on PoiRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoiRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoiRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoiRef value)  $default,){
final _that = this;
switch (_that) {
case _PoiRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoiRef value)?  $default,){
final _that = this;
switch (_that) {
case _PoiRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PoiKind kind,  String id,  String name,  GeoJsonGeometry? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoiRef() when $default != null:
return $default(_that.kind,_that.id,_that.name,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PoiKind kind,  String id,  String name,  GeoJsonGeometry? location)  $default,) {final _that = this;
switch (_that) {
case _PoiRef():
return $default(_that.kind,_that.id,_that.name,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PoiKind kind,  String id,  String name,  GeoJsonGeometry? location)?  $default,) {final _that = this;
switch (_that) {
case _PoiRef() when $default != null:
return $default(_that.kind,_that.id,_that.name,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PoiRef implements PoiRef {
  const _PoiRef({required this.kind, required this.id, required this.name, this.location});
  factory _PoiRef.fromJson(Map<String, dynamic> json) => _$PoiRefFromJson(json);

@override final  PoiKind kind;
@override final  String id;
@override final  String name;
@override final  GeoJsonGeometry? location;

/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoiRefCopyWith<_PoiRef> get copyWith => __$PoiRefCopyWithImpl<_PoiRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PoiRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoiRef&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,id,name,location);
}

@override
String toString() {
    return 'PoiRef(kind: $kind, id: $id, name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class _$PoiRefCopyWith<$Res> implements $PoiRefCopyWith<$Res> {
  factory _$PoiRefCopyWith(_PoiRef value, $Res Function(_PoiRef) _then) = __$PoiRefCopyWithImpl;
@override @useResult
$Res call({
 PoiKind kind, String id, String name, GeoJsonGeometry? location
});


@override $GeoJsonGeometryCopyWith<$Res>? get location;

}
/// @nodoc
class __$PoiRefCopyWithImpl<$Res>
    implements _$PoiRefCopyWith<$Res> {
  __$PoiRefCopyWithImpl(this._self, this._then);

  final _PoiRef _self;
  final $Res Function(_PoiRef) _then;

/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,Object? name = null,Object? location = freezed,}) {
  return _then(_PoiRef(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as PoiKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry?,
  ));
}

/// Create a copy of PoiRef
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $GeoJsonGeometryCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
