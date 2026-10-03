// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_fuel_status_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmFuelStatusRequest {

 List<FuelType2> get fuelTypes; bool get available; String? get comment;
/// Create a copy of ConfirmFuelStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmFuelStatusRequestCopyWith<ConfirmFuelStatusRequest> get copyWith => _$ConfirmFuelStatusRequestCopyWithImpl<ConfirmFuelStatusRequest>(this as ConfirmFuelStatusRequest, _$identity);

  /// Serializes this ConfirmFuelStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfirmFuelStatusRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmFuelStatusRequest&&const DeepCollectionEquality().equals(other.fuelTypes, _this.fuelTypes)&&(identical(other.available, _this.available) || other.available == _this.available)&&(identical(other.comment, _this.comment) || other.comment == _this.comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfirmFuelStatusRequest;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.fuelTypes),_this.available,_this.comment);
}

@override
String toString() {
  final _this = this as ConfirmFuelStatusRequest;
  return 'ConfirmFuelStatusRequest(fuelTypes: ${_this.fuelTypes}, available: ${_this.available}, comment: ${_this.comment})';
}


}

/// @nodoc
abstract mixin class $ConfirmFuelStatusRequestCopyWith<$Res>  {
  factory $ConfirmFuelStatusRequestCopyWith(ConfirmFuelStatusRequest value, $Res Function(ConfirmFuelStatusRequest) _then) = _$ConfirmFuelStatusRequestCopyWithImpl;
@useResult
$Res call({
 List<FuelType2> fuelTypes, bool available, String? comment
});




}
/// @nodoc
class _$ConfirmFuelStatusRequestCopyWithImpl<$Res>
    implements $ConfirmFuelStatusRequestCopyWith<$Res> {
  _$ConfirmFuelStatusRequestCopyWithImpl(this._self, this._then);

  final ConfirmFuelStatusRequest _self;
  final $Res Function(ConfirmFuelStatusRequest) _then;

/// Create a copy of ConfirmFuelStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fuelTypes = null,Object? available = null,Object? comment = freezed,}) {
  return _then(ConfirmFuelStatusRequest(
fuelTypes: null == fuelTypes ? _self.fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType2>,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmFuelStatusRequest].
extension ConfirmFuelStatusRequestPatterns on ConfirmFuelStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmFuelStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmFuelStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmFuelStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FuelType2> fuelTypes,  bool available,  String? comment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest() when $default != null:
return $default(_that.fuelTypes,_that.available,_that.comment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FuelType2> fuelTypes,  bool available,  String? comment)  $default,) {final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest():
return $default(_that.fuelTypes,_that.available,_that.comment);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FuelType2> fuelTypes,  bool available,  String? comment)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmFuelStatusRequest() when $default != null:
return $default(_that.fuelTypes,_that.available,_that.comment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmFuelStatusRequest implements ConfirmFuelStatusRequest {
  const _ConfirmFuelStatusRequest({required  List<FuelType2> fuelTypes, required this.available, required this.comment}): _fuelTypes = fuelTypes;
  factory _ConfirmFuelStatusRequest.fromJson(Map<String, dynamic> json) => _$ConfirmFuelStatusRequestFromJson(json);

 final  List<FuelType2> _fuelTypes;
@override List<FuelType2> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}

@override final  bool available;
@override final  String? comment;

/// Create a copy of ConfirmFuelStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmFuelStatusRequestCopyWith<_ConfirmFuelStatusRequest> get copyWith => __$ConfirmFuelStatusRequestCopyWithImpl<_ConfirmFuelStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmFuelStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmFuelStatusRequest&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes)&&(identical(other.available, available) || other.available == available)&&(identical(other.comment, comment) || other.comment == comment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_fuelTypes),available,comment);
}

@override
String toString() {
    return 'ConfirmFuelStatusRequest(fuelTypes: $fuelTypes, available: $available, comment: $comment)';
}


}

/// @nodoc
abstract mixin class _$ConfirmFuelStatusRequestCopyWith<$Res> implements $ConfirmFuelStatusRequestCopyWith<$Res> {
  factory _$ConfirmFuelStatusRequestCopyWith(_ConfirmFuelStatusRequest value, $Res Function(_ConfirmFuelStatusRequest) _then) = __$ConfirmFuelStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 List<FuelType2> fuelTypes, bool available, String? comment
});




}
/// @nodoc
class __$ConfirmFuelStatusRequestCopyWithImpl<$Res>
    implements _$ConfirmFuelStatusRequestCopyWith<$Res> {
  __$ConfirmFuelStatusRequestCopyWithImpl(this._self, this._then);

  final _ConfirmFuelStatusRequest _self;
  final $Res Function(_ConfirmFuelStatusRequest) _then;

/// Create a copy of ConfirmFuelStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fuelTypes = null,Object? available = null,Object? comment = freezed,}) {
  return _then(_ConfirmFuelStatusRequest(
fuelTypes: null == fuelTypes ? _self._fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType2>,available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as bool,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
