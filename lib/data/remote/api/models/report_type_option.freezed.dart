// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_type_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportTypeOption {

 ReportType get value; String get label; ReportScope get scope;/// For point types: which object picker to show
 PoiKind? get poiKind;/// Non-empty only for fuel_shortage: the fuel-type choices to show
 List<FuelTypes> get fuelTypes;
/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportTypeOptionCopyWith<ReportTypeOption> get copyWith => _$ReportTypeOptionCopyWithImpl<ReportTypeOption>(this as ReportTypeOption, _$identity);

  /// Serializes this ReportTypeOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportTypeOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportTypeOption&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.scope, _this.scope) || other.scope == _this.scope)&&(identical(other.poiKind, _this.poiKind) || other.poiKind == _this.poiKind)&&const DeepCollectionEquality().equals(other.fuelTypes, _this.fuelTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportTypeOption;
  return Object.hash(runtimeType,_this.value,_this.label,_this.scope,_this.poiKind,const DeepCollectionEquality().hash(_this.fuelTypes));
}

@override
String toString() {
  final _this = this as ReportTypeOption;
  return 'ReportTypeOption(value: ${_this.value}, label: ${_this.label}, scope: ${_this.scope}, poiKind: ${_this.poiKind}, fuelTypes: ${_this.fuelTypes})';
}


}

/// @nodoc
abstract mixin class $ReportTypeOptionCopyWith<$Res>  {
  factory $ReportTypeOptionCopyWith(ReportTypeOption value, $Res Function(ReportTypeOption) _then) = _$ReportTypeOptionCopyWithImpl;
@useResult
$Res call({
 ReportType value, String label, ReportScope scope, PoiKind? poiKind, List<FuelTypes> fuelTypes
});




}
/// @nodoc
class _$ReportTypeOptionCopyWithImpl<$Res>
    implements $ReportTypeOptionCopyWith<$Res> {
  _$ReportTypeOptionCopyWithImpl(this._self, this._then);

  final ReportTypeOption _self;
  final $Res Function(ReportTypeOption) _then;

/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? scope = null,Object? poiKind = freezed,Object? fuelTypes = null,}) {
  return _then(ReportTypeOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ReportType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ReportScope,poiKind: freezed == poiKind ? _self.poiKind : poiKind // ignore: cast_nullable_to_non_nullable
as PoiKind?,fuelTypes: null == fuelTypes ? _self.fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelTypes>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportTypeOption].
extension ReportTypeOptionPatterns on ReportTypeOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportTypeOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportTypeOption value)  $default,){
final _that = this;
switch (_that) {
case _ReportTypeOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportTypeOption value)?  $default,){
final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportType value,  String label,  ReportScope scope,  PoiKind? poiKind,  List<FuelTypes> fuelTypes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
return $default(_that.value,_that.label,_that.scope,_that.poiKind,_that.fuelTypes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportType value,  String label,  ReportScope scope,  PoiKind? poiKind,  List<FuelTypes> fuelTypes)  $default,) {final _that = this;
switch (_that) {
case _ReportTypeOption():
return $default(_that.value,_that.label,_that.scope,_that.poiKind,_that.fuelTypes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportType value,  String label,  ReportScope scope,  PoiKind? poiKind,  List<FuelTypes> fuelTypes)?  $default,) {final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
return $default(_that.value,_that.label,_that.scope,_that.poiKind,_that.fuelTypes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportTypeOption implements ReportTypeOption {
  const _ReportTypeOption({required this.value, required this.label, required this.scope, required this.poiKind, required  List<FuelTypes> fuelTypes}): _fuelTypes = fuelTypes;
  factory _ReportTypeOption.fromJson(Map<String, dynamic> json) => _$ReportTypeOptionFromJson(json);

@override final  ReportType value;
@override final  String label;
@override final  ReportScope scope;
/// For point types: which object picker to show
@override final  PoiKind? poiKind;
/// Non-empty only for fuel_shortage: the fuel-type choices to show
 final  List<FuelTypes> _fuelTypes;
/// Non-empty only for fuel_shortage: the fuel-type choices to show
@override List<FuelTypes> get fuelTypes {
  if (_fuelTypes is EqualUnmodifiableListView) return _fuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuelTypes);
}


/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportTypeOptionCopyWith<_ReportTypeOption> get copyWith => __$ReportTypeOptionCopyWithImpl<_ReportTypeOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportTypeOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportTypeOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.scope, scope) || other.scope == scope)&&(identical(other.poiKind, poiKind) || other.poiKind == poiKind)&&const DeepCollectionEquality().equals(other.fuelTypes, _fuelTypes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,value,label,scope,poiKind,const DeepCollectionEquality().hash(_fuelTypes));
}

@override
String toString() {
    return 'ReportTypeOption(value: $value, label: $label, scope: $scope, poiKind: $poiKind, fuelTypes: $fuelTypes)';
}


}

/// @nodoc
abstract mixin class _$ReportTypeOptionCopyWith<$Res> implements $ReportTypeOptionCopyWith<$Res> {
  factory _$ReportTypeOptionCopyWith(_ReportTypeOption value, $Res Function(_ReportTypeOption) _then) = __$ReportTypeOptionCopyWithImpl;
@override @useResult
$Res call({
 ReportType value, String label, ReportScope scope, PoiKind? poiKind, List<FuelTypes> fuelTypes
});




}
/// @nodoc
class __$ReportTypeOptionCopyWithImpl<$Res>
    implements _$ReportTypeOptionCopyWith<$Res> {
  __$ReportTypeOptionCopyWithImpl(this._self, this._then);

  final _ReportTypeOption _self;
  final $Res Function(_ReportTypeOption) _then;

/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? scope = null,Object? poiKind = freezed,Object? fuelTypes = null,}) {
  return _then(_ReportTypeOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as ReportType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,scope: null == scope ? _self.scope : scope // ignore: cast_nullable_to_non_nullable
as ReportScope,poiKind: freezed == poiKind ? _self.poiKind : poiKind // ignore: cast_nullable_to_non_nullable
as PoiKind?,fuelTypes: null == fuelTypes ? _self._fuelTypes : fuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelTypes>,
  ));
}


}

// dart format on
