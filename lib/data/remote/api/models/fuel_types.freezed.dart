// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_types.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuelTypes {

 FuelType get value; String get label;
/// Create a copy of FuelTypes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuelTypesCopyWith<FuelTypes> get copyWith => _$FuelTypesCopyWithImpl<FuelTypes>(this as FuelTypes, _$identity);

  /// Serializes this FuelTypes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FuelTypes;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuelTypes&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FuelTypes;
  return Object.hash(runtimeType,_this.value,_this.label);
}

@override
String toString() {
  final _this = this as FuelTypes;
  return 'FuelTypes(value: ${_this.value}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $FuelTypesCopyWith<$Res>  {
  factory $FuelTypesCopyWith(FuelTypes value, $Res Function(FuelTypes) _then) = _$FuelTypesCopyWithImpl;
@useResult
$Res call({
 FuelType value, String label
});




}
/// @nodoc
class _$FuelTypesCopyWithImpl<$Res>
    implements $FuelTypesCopyWith<$Res> {
  _$FuelTypesCopyWithImpl(this._self, this._then);

  final FuelTypes _self;
  final $Res Function(FuelTypes) _then;

/// Create a copy of FuelTypes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,}) {
  return _then(FuelTypes(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as FuelType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FuelTypes].
extension FuelTypesPatterns on FuelTypes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuelTypes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuelTypes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuelTypes value)  $default,){
final _that = this;
switch (_that) {
case _FuelTypes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuelTypes value)?  $default,){
final _that = this;
switch (_that) {
case _FuelTypes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FuelType value,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuelTypes() when $default != null:
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FuelType value,  String label)  $default,) {final _that = this;
switch (_that) {
case _FuelTypes():
return $default(_that.value,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FuelType value,  String label)?  $default,) {final _that = this;
switch (_that) {
case _FuelTypes() when $default != null:
return $default(_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuelTypes implements FuelTypes {
  const _FuelTypes({required this.value, required this.label});
  factory _FuelTypes.fromJson(Map<String, dynamic> json) => _$FuelTypesFromJson(json);

@override final  FuelType value;
@override final  String label;

/// Create a copy of FuelTypes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuelTypesCopyWith<_FuelTypes> get copyWith => __$FuelTypesCopyWithImpl<_FuelTypes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuelTypesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuelTypes&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,label);
}

@override
String toString() {
    return 'FuelTypes(value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$FuelTypesCopyWith<$Res> implements $FuelTypesCopyWith<$Res> {
  factory _$FuelTypesCopyWith(_FuelTypes value, $Res Function(_FuelTypes) _then) = __$FuelTypesCopyWithImpl;
@override @useResult
$Res call({
 FuelType value, String label
});




}
/// @nodoc
class __$FuelTypesCopyWithImpl<$Res>
    implements _$FuelTypesCopyWith<$Res> {
  __$FuelTypesCopyWithImpl(this._self, this._then);

  final _FuelTypes _self;
  final $Res Function(_FuelTypes) _then;

/// Create a copy of FuelTypes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,}) {
  return _then(_FuelTypes(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as FuelType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
