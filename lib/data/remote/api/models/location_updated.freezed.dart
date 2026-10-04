// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_updated.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationUpdated {

/// H3 cell (resolution 9) of the stored position
 String get h3Cell;
/// Create a copy of LocationUpdated
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationUpdatedCopyWith<LocationUpdated> get copyWith => _$LocationUpdatedCopyWithImpl<LocationUpdated>(this as LocationUpdated, _$identity);

  /// Serializes this LocationUpdated to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LocationUpdated;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationUpdated&&(identical(other.h3Cell, _this.h3Cell) || other.h3Cell == _this.h3Cell));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LocationUpdated;
  return Object.hash(runtimeType,_this.h3Cell);
}

@override
String toString() {
  final _this = this as LocationUpdated;
  return 'LocationUpdated(h3Cell: ${_this.h3Cell})';
}


}

/// @nodoc
abstract mixin class $LocationUpdatedCopyWith<$Res>  {
  factory $LocationUpdatedCopyWith(LocationUpdated value, $Res Function(LocationUpdated) _then) = _$LocationUpdatedCopyWithImpl;
@useResult
$Res call({
 String h3Cell
});




}
/// @nodoc
class _$LocationUpdatedCopyWithImpl<$Res>
    implements $LocationUpdatedCopyWith<$Res> {
  _$LocationUpdatedCopyWithImpl(this._self, this._then);

  final LocationUpdated _self;
  final $Res Function(LocationUpdated) _then;

/// Create a copy of LocationUpdated
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? h3Cell = null,}) {
  return _then(LocationUpdated(
h3Cell: null == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationUpdated].
extension LocationUpdatedPatterns on LocationUpdated {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationUpdated value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationUpdated() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationUpdated value)  $default,){
final _that = this;
switch (_that) {
case _LocationUpdated():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationUpdated value)?  $default,){
final _that = this;
switch (_that) {
case _LocationUpdated() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String h3Cell)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationUpdated() when $default != null:
return $default(_that.h3Cell);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String h3Cell)  $default,) {final _that = this;
switch (_that) {
case _LocationUpdated():
return $default(_that.h3Cell);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String h3Cell)?  $default,) {final _that = this;
switch (_that) {
case _LocationUpdated() when $default != null:
return $default(_that.h3Cell);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocationUpdated implements LocationUpdated {
  const _LocationUpdated({required this.h3Cell});
  factory _LocationUpdated.fromJson(Map<String, dynamic> json) => _$LocationUpdatedFromJson(json);

/// H3 cell (resolution 9) of the stored position
@override final  String h3Cell;

/// Create a copy of LocationUpdated
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationUpdatedCopyWith<_LocationUpdated> get copyWith => __$LocationUpdatedCopyWithImpl<_LocationUpdated>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationUpdatedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationUpdated&&(identical(other.h3Cell, h3Cell) || other.h3Cell == h3Cell));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,h3Cell);
}

@override
String toString() {
    return 'LocationUpdated(h3Cell: $h3Cell)';
}


}

/// @nodoc
abstract mixin class _$LocationUpdatedCopyWith<$Res> implements $LocationUpdatedCopyWith<$Res> {
  factory _$LocationUpdatedCopyWith(_LocationUpdated value, $Res Function(_LocationUpdated) _then) = __$LocationUpdatedCopyWithImpl;
@override @useResult
$Res call({
 String h3Cell
});




}
/// @nodoc
class __$LocationUpdatedCopyWithImpl<$Res>
    implements _$LocationUpdatedCopyWith<$Res> {
  __$LocationUpdatedCopyWithImpl(this._self, this._then);

  final _LocationUpdated _self;
  final $Res Function(_LocationUpdated) _then;

/// Create a copy of LocationUpdated
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? h3Cell = null,}) {
  return _then(_LocationUpdated(
h3Cell: null == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
