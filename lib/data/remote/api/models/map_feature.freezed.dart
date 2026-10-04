// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_feature.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapFeature {

 MapFeatureType get type;/// Same value as properties.id
 String get id;/// incident (scope=area): polygon, centroid Point while the area is empty; incident (scope=point): Point at the object; shelter / fuel_station: Point; alert: polygon
 GeoJsonGeometry get geometry; MapFeaturePropertiesUnion get properties;
/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeatureCopyWith<MapFeature> get copyWith => _$MapFeatureCopyWithImpl<MapFeature>(this as MapFeature, _$identity);

  /// Serializes this MapFeature to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapFeature;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeature&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.geometry, _this.geometry) || other.geometry == _this.geometry)&&(identical(other.properties, _this.properties) || other.properties == _this.properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapFeature;
  return Object.hash(runtimeType,_this.type,_this.id,_this.geometry,_this.properties);
}

@override
String toString() {
  final _this = this as MapFeature;
  return 'MapFeature(type: ${_this.type}, id: ${_this.id}, geometry: ${_this.geometry}, properties: ${_this.properties})';
}


}

/// @nodoc
abstract mixin class $MapFeatureCopyWith<$Res>  {
  factory $MapFeatureCopyWith(MapFeature value, $Res Function(MapFeature) _then) = _$MapFeatureCopyWithImpl;
@useResult
$Res call({
 MapFeatureType type, String id, GeoJsonGeometry geometry, MapFeaturePropertiesUnion properties
});


$GeoJsonGeometryCopyWith<$Res> get geometry;$MapFeaturePropertiesUnionCopyWith<$Res> get properties;

}
/// @nodoc
class _$MapFeatureCopyWithImpl<$Res>
    implements $MapFeatureCopyWith<$Res> {
  _$MapFeatureCopyWithImpl(this._self, this._then);

  final MapFeature _self;
  final $Res Function(MapFeature) _then;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? id = null,Object? geometry = null,Object? properties = null,}) {
  return _then(MapFeature(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapFeatureType,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as MapFeaturePropertiesUnion,
  ));
}
/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get geometry {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionCopyWith<$Res> get properties {
  
  return $MapFeaturePropertiesUnionCopyWith<$Res>(_self.properties, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}


/// Adds pattern-matching-related methods to [MapFeature].
extension MapFeaturePatterns on MapFeature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapFeature value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapFeature() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapFeature value)  $default,){
final _that = this;
switch (_that) {
case _MapFeature():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapFeature value)?  $default,){
final _that = this;
switch (_that) {
case _MapFeature() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapFeatureType type,  String id,  GeoJsonGeometry geometry,  MapFeaturePropertiesUnion properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapFeature() when $default != null:
return $default(_that.type,_that.id,_that.geometry,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapFeatureType type,  String id,  GeoJsonGeometry geometry,  MapFeaturePropertiesUnion properties)  $default,) {final _that = this;
switch (_that) {
case _MapFeature():
return $default(_that.type,_that.id,_that.geometry,_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapFeatureType type,  String id,  GeoJsonGeometry geometry,  MapFeaturePropertiesUnion properties)?  $default,) {final _that = this;
switch (_that) {
case _MapFeature() when $default != null:
return $default(_that.type,_that.id,_that.geometry,_that.properties);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapFeature implements MapFeature {
  const _MapFeature({required this.type, required this.id, required this.geometry, required this.properties});
  factory _MapFeature.fromJson(Map<String, dynamic> json) => _$MapFeatureFromJson(json);

@override final  MapFeatureType type;
/// Same value as properties.id
@override final  String id;
/// incident (scope=area): polygon, centroid Point while the area is empty; incident (scope=point): Point at the object; shelter / fuel_station: Point; alert: polygon
@override final  GeoJsonGeometry geometry;
@override final  MapFeaturePropertiesUnion properties;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapFeatureCopyWith<_MapFeature> get copyWith => __$MapFeatureCopyWithImpl<_MapFeature>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeatureToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapFeature&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.properties, properties) || other.properties == properties));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,id,geometry,properties);
}

@override
String toString() {
    return 'MapFeature(type: $type, id: $id, geometry: $geometry, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$MapFeatureCopyWith<$Res> implements $MapFeatureCopyWith<$Res> {
  factory _$MapFeatureCopyWith(_MapFeature value, $Res Function(_MapFeature) _then) = __$MapFeatureCopyWithImpl;
@override @useResult
$Res call({
 MapFeatureType type, String id, GeoJsonGeometry geometry, MapFeaturePropertiesUnion properties
});


@override $GeoJsonGeometryCopyWith<$Res> get geometry;@override $MapFeaturePropertiesUnionCopyWith<$Res> get properties;

}
/// @nodoc
class __$MapFeatureCopyWithImpl<$Res>
    implements _$MapFeatureCopyWith<$Res> {
  __$MapFeatureCopyWithImpl(this._self, this._then);

  final _MapFeature _self;
  final $Res Function(_MapFeature) _then;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? id = null,Object? geometry = null,Object? properties = null,}) {
  return _then(_MapFeature(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapFeatureType,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as MapFeaturePropertiesUnion,
  ));
}

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get geometry {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MapFeaturePropertiesUnionCopyWith<$Res> get properties {
  
  return $MapFeaturePropertiesUnionCopyWith<$Res>(_self.properties, (value) {
    return _then(_self.copyWith(properties: value));
  });
}
}

// dart format on
