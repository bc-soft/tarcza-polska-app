// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_station_fuel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuelStationFuel {

 FuelType get type; String get label; FuelAvailability get status; String get statusLabel; DateTime? get confirmedAt;
/// Create a copy of FuelStationFuel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuelStationFuelCopyWith<FuelStationFuel> get copyWith => _$FuelStationFuelCopyWithImpl<FuelStationFuel>(this as FuelStationFuel, _$identity);

  /// Serializes this FuelStationFuel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FuelStationFuel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuelStationFuel&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.confirmedAt, _this.confirmedAt) || other.confirmedAt == _this.confirmedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FuelStationFuel;
  return Object.hash(runtimeType,_this.type,_this.label,_this.status,_this.statusLabel,_this.confirmedAt);
}

@override
String toString() {
  final _this = this as FuelStationFuel;
  return 'FuelStationFuel(type: ${_this.type}, label: ${_this.label}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, confirmedAt: ${_this.confirmedAt})';
}


}

/// @nodoc
abstract mixin class $FuelStationFuelCopyWith<$Res>  {
  factory $FuelStationFuelCopyWith(FuelStationFuel value, $Res Function(FuelStationFuel) _then) = _$FuelStationFuelCopyWithImpl;
@useResult
$Res call({
 FuelType type, String label, FuelAvailability status, String statusLabel, DateTime? confirmedAt
});




}
/// @nodoc
class _$FuelStationFuelCopyWithImpl<$Res>
    implements $FuelStationFuelCopyWith<$Res> {
  _$FuelStationFuelCopyWithImpl(this._self, this._then);

  final FuelStationFuel _self;
  final $Res Function(FuelStationFuel) _then;

/// Create a copy of FuelStationFuel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? label = null,Object? status = null,Object? statusLabel = null,Object? confirmedAt = freezed,}) {
  return _then(FuelStationFuel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FuelType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FuelAvailability,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FuelStationFuel].
extension FuelStationFuelPatterns on FuelStationFuel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuelStationFuel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuelStationFuel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuelStationFuel value)  $default,){
final _that = this;
switch (_that) {
case _FuelStationFuel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuelStationFuel value)?  $default,){
final _that = this;
switch (_that) {
case _FuelStationFuel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FuelType type,  String label,  FuelAvailability status,  String statusLabel,  DateTime? confirmedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuelStationFuel() when $default != null:
return $default(_that.type,_that.label,_that.status,_that.statusLabel,_that.confirmedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FuelType type,  String label,  FuelAvailability status,  String statusLabel,  DateTime? confirmedAt)  $default,) {final _that = this;
switch (_that) {
case _FuelStationFuel():
return $default(_that.type,_that.label,_that.status,_that.statusLabel,_that.confirmedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FuelType type,  String label,  FuelAvailability status,  String statusLabel,  DateTime? confirmedAt)?  $default,) {final _that = this;
switch (_that) {
case _FuelStationFuel() when $default != null:
return $default(_that.type,_that.label,_that.status,_that.statusLabel,_that.confirmedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuelStationFuel implements FuelStationFuel {
  const _FuelStationFuel({required this.type, required this.label, required this.status, required this.statusLabel, this.confirmedAt});
  factory _FuelStationFuel.fromJson(Map<String, dynamic> json) => _$FuelStationFuelFromJson(json);

@override final  FuelType type;
@override final  String label;
@override final  FuelAvailability status;
@override final  String statusLabel;
@override final  DateTime? confirmedAt;

/// Create a copy of FuelStationFuel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuelStationFuelCopyWith<_FuelStationFuel> get copyWith => __$FuelStationFuelCopyWithImpl<_FuelStationFuel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuelStationFuelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuelStationFuel&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,label,status,statusLabel,confirmedAt);
}

@override
String toString() {
    return 'FuelStationFuel(type: $type, label: $label, status: $status, statusLabel: $statusLabel, confirmedAt: $confirmedAt)';
}


}

/// @nodoc
abstract mixin class _$FuelStationFuelCopyWith<$Res> implements $FuelStationFuelCopyWith<$Res> {
  factory _$FuelStationFuelCopyWith(_FuelStationFuel value, $Res Function(_FuelStationFuel) _then) = __$FuelStationFuelCopyWithImpl;
@override @useResult
$Res call({
 FuelType type, String label, FuelAvailability status, String statusLabel, DateTime? confirmedAt
});




}
/// @nodoc
class __$FuelStationFuelCopyWithImpl<$Res>
    implements _$FuelStationFuelCopyWith<$Res> {
  __$FuelStationFuelCopyWithImpl(this._self, this._then);

  final _FuelStationFuel _self;
  final $Res Function(_FuelStationFuel) _then;

/// Create a copy of FuelStationFuel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? label = null,Object? status = null,Object? statusLabel = null,Object? confirmedAt = freezed,}) {
  return _then(_FuelStationFuel(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FuelType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FuelAvailability,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
