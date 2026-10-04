// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_feature_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapFeatureCollection {

 MapFeatureCollectionType get type; List<MapFeature> get features;
/// Create a copy of MapFeatureCollection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapFeatureCollectionCopyWith<MapFeatureCollection> get copyWith => _$MapFeatureCollectionCopyWithImpl<MapFeatureCollection>(this as MapFeatureCollection, _$identity);

  /// Serializes this MapFeatureCollection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MapFeatureCollection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeatureCollection&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.features, _this.features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MapFeatureCollection;
  return Object.hash(runtimeType,_this.type,const DeepCollectionEquality().hash(_this.features));
}

@override
String toString() {
  final _this = this as MapFeatureCollection;
  return 'MapFeatureCollection(type: ${_this.type}, features: ${_this.features})';
}


}

/// @nodoc
abstract mixin class $MapFeatureCollectionCopyWith<$Res>  {
  factory $MapFeatureCollectionCopyWith(MapFeatureCollection value, $Res Function(MapFeatureCollection) _then) = _$MapFeatureCollectionCopyWithImpl;
@useResult
$Res call({
 MapFeatureCollectionType type, List<MapFeature> features
});




}
/// @nodoc
class _$MapFeatureCollectionCopyWithImpl<$Res>
    implements $MapFeatureCollectionCopyWith<$Res> {
  _$MapFeatureCollectionCopyWithImpl(this._self, this._then);

  final MapFeatureCollection _self;
  final $Res Function(MapFeatureCollection) _then;

/// Create a copy of MapFeatureCollection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? features = null,}) {
  return _then(MapFeatureCollection(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapFeatureCollectionType,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<MapFeature>,
  ));
}

}


/// Adds pattern-matching-related methods to [MapFeatureCollection].
extension MapFeatureCollectionPatterns on MapFeatureCollection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapFeatureCollection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapFeatureCollection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapFeatureCollection value)  $default,){
final _that = this;
switch (_that) {
case _MapFeatureCollection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapFeatureCollection value)?  $default,){
final _that = this;
switch (_that) {
case _MapFeatureCollection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MapFeatureCollectionType type,  List<MapFeature> features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapFeatureCollection() when $default != null:
return $default(_that.type,_that.features);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MapFeatureCollectionType type,  List<MapFeature> features)  $default,) {final _that = this;
switch (_that) {
case _MapFeatureCollection():
return $default(_that.type,_that.features);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MapFeatureCollectionType type,  List<MapFeature> features)?  $default,) {final _that = this;
switch (_that) {
case _MapFeatureCollection() when $default != null:
return $default(_that.type,_that.features);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapFeatureCollection implements MapFeatureCollection {
  const _MapFeatureCollection({required this.type, required  List<MapFeature> features}): _features = features;
  factory _MapFeatureCollection.fromJson(Map<String, dynamic> json) => _$MapFeatureCollectionFromJson(json);

@override final  MapFeatureCollectionType type;
 final  List<MapFeature> _features;
@override List<MapFeature> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}


/// Create a copy of MapFeatureCollection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapFeatureCollectionCopyWith<_MapFeatureCollection> get copyWith => __$MapFeatureCollectionCopyWithImpl<_MapFeatureCollection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapFeatureCollectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapFeatureCollection&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.features, _features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_features));
}

@override
String toString() {
    return 'MapFeatureCollection(type: $type, features: $features)';
}


}

/// @nodoc
abstract mixin class _$MapFeatureCollectionCopyWith<$Res> implements $MapFeatureCollectionCopyWith<$Res> {
  factory _$MapFeatureCollectionCopyWith(_MapFeatureCollection value, $Res Function(_MapFeatureCollection) _then) = __$MapFeatureCollectionCopyWithImpl;
@override @useResult
$Res call({
 MapFeatureCollectionType type, List<MapFeature> features
});




}
/// @nodoc
class __$MapFeatureCollectionCopyWithImpl<$Res>
    implements _$MapFeatureCollectionCopyWith<$Res> {
  __$MapFeatureCollectionCopyWithImpl(this._self, this._then);

  final _MapFeatureCollection _self;
  final $Res Function(_MapFeatureCollection) _then;

/// Create a copy of MapFeatureCollection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? features = null,}) {
  return _then(_MapFeatureCollection(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MapFeatureCollectionType,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<MapFeature>,
  ));
}


}

// dart format on
