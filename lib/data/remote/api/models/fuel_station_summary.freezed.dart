// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_station_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuelStationSummary {

 String get id; String get name;/// Fuel types sold (or ever reported) at this station with current availability
 List<FuelStationFuel> get fuels;/// At least one fuel type currently reported missing
 bool get shortage; List<FuelType> get missingFuelTypes; int get confirmationCount; String? get brand; String? get address; DateTime? get lastConfirmedAt;/// Only in GET /fuel-stations?lat&lng and the offline bundle
 int? get distanceMeters;
/// Create a copy of FuelStationSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuelStationSummaryCopyWith<FuelStationSummary> get copyWith => _$FuelStationSummaryCopyWithImpl<FuelStationSummary>(this as FuelStationSummary, _$identity);

  /// Serializes this FuelStationSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FuelStationSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuelStationSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.fuels, _this.fuels)&&(identical(other.shortage, _this.shortage) || other.shortage == _this.shortage)&&const DeepCollectionEquality().equals(other.missingFuelTypes, _this.missingFuelTypes)&&(identical(other.confirmationCount, _this.confirmationCount) || other.confirmationCount == _this.confirmationCount)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FuelStationSummary;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.fuels),_this.shortage,const DeepCollectionEquality().hash(_this.missingFuelTypes),_this.confirmationCount,_this.brand,_this.address,_this.lastConfirmedAt,_this.distanceMeters);
}

@override
String toString() {
  final _this = this as FuelStationSummary;
  return 'FuelStationSummary(id: ${_this.id}, name: ${_this.name}, fuels: ${_this.fuels}, shortage: ${_this.shortage}, missingFuelTypes: ${_this.missingFuelTypes}, confirmationCount: ${_this.confirmationCount}, brand: ${_this.brand}, address: ${_this.address}, lastConfirmedAt: ${_this.lastConfirmedAt}, distanceMeters: ${_this.distanceMeters})';
}


}

/// @nodoc
abstract mixin class $FuelStationSummaryCopyWith<$Res>  {
  factory $FuelStationSummaryCopyWith(FuelStationSummary value, $Res Function(FuelStationSummary) _then) = _$FuelStationSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<FuelStationFuel> fuels, bool shortage, List<FuelType> missingFuelTypes, int confirmationCount, String? brand, String? address, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class _$FuelStationSummaryCopyWithImpl<$Res>
    implements $FuelStationSummaryCopyWith<$Res> {
  _$FuelStationSummaryCopyWithImpl(this._self, this._then);

  final FuelStationSummary _self;
  final $Res Function(FuelStationSummary) _then;

/// Create a copy of FuelStationSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? fuels = null,Object? shortage = null,Object? missingFuelTypes = null,Object? confirmationCount = null,Object? brand = freezed,Object? address = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(FuelStationSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fuels: null == fuels ? _self.fuels : fuels // ignore: cast_nullable_to_non_nullable
as List<FuelStationFuel>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as bool,missingFuelTypes: null == missingFuelTypes ? _self.missingFuelTypes : missingFuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FuelStationSummary].
extension FuelStationSummaryPatterns on FuelStationSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuelStationSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuelStationSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuelStationSummary value)  $default,){
final _that = this;
switch (_that) {
case _FuelStationSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuelStationSummary value)?  $default,){
final _that = this;
switch (_that) {
case _FuelStationSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuelStationSummary() when $default != null:
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _FuelStationSummary():
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _FuelStationSummary() when $default != null:
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuelStationSummary implements FuelStationSummary {
  const _FuelStationSummary({required this.id, required this.name, required  List<FuelStationFuel> fuels, required this.shortage, required  List<FuelType> missingFuelTypes, required this.confirmationCount, this.brand, this.address, this.lastConfirmedAt, this.distanceMeters}): _fuels = fuels,_missingFuelTypes = missingFuelTypes;
  factory _FuelStationSummary.fromJson(Map<String, dynamic> json) => _$FuelStationSummaryFromJson(json);

@override final  String id;
@override final  String name;
/// Fuel types sold (or ever reported) at this station with current availability
 final  List<FuelStationFuel> _fuels;
/// Fuel types sold (or ever reported) at this station with current availability
@override List<FuelStationFuel> get fuels {
  if (_fuels is EqualUnmodifiableListView) return _fuels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fuels);
}

/// At least one fuel type currently reported missing
@override final  bool shortage;
 final  List<FuelType> _missingFuelTypes;
@override List<FuelType> get missingFuelTypes {
  if (_missingFuelTypes is EqualUnmodifiableListView) return _missingFuelTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_missingFuelTypes);
}

@override final  int confirmationCount;
@override final  String? brand;
@override final  String? address;
@override final  DateTime? lastConfirmedAt;
/// Only in GET /fuel-stations?lat&lng and the offline bundle
@override final  int? distanceMeters;

/// Create a copy of FuelStationSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuelStationSummaryCopyWith<_FuelStationSummary> get copyWith => __$FuelStationSummaryCopyWithImpl<_FuelStationSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuelStationSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuelStationSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.fuels, _fuels)&&(identical(other.shortage, shortage) || other.shortage == shortage)&&const DeepCollectionEquality().equals(other.missingFuelTypes, _missingFuelTypes)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.address, address) || other.address == address)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_fuels),shortage,const DeepCollectionEquality().hash(_missingFuelTypes),confirmationCount,brand,address,lastConfirmedAt,distanceMeters);
}

@override
String toString() {
    return 'FuelStationSummary(id: $id, name: $name, fuels: $fuels, shortage: $shortage, missingFuelTypes: $missingFuelTypes, confirmationCount: $confirmationCount, brand: $brand, address: $address, lastConfirmedAt: $lastConfirmedAt, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$FuelStationSummaryCopyWith<$Res> implements $FuelStationSummaryCopyWith<$Res> {
  factory _$FuelStationSummaryCopyWith(_FuelStationSummary value, $Res Function(_FuelStationSummary) _then) = __$FuelStationSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<FuelStationFuel> fuels, bool shortage, List<FuelType> missingFuelTypes, int confirmationCount, String? brand, String? address, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class __$FuelStationSummaryCopyWithImpl<$Res>
    implements _$FuelStationSummaryCopyWith<$Res> {
  __$FuelStationSummaryCopyWithImpl(this._self, this._then);

  final _FuelStationSummary _self;
  final $Res Function(_FuelStationSummary) _then;

/// Create a copy of FuelStationSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? fuels = null,Object? shortage = null,Object? missingFuelTypes = null,Object? confirmationCount = null,Object? brand = freezed,Object? address = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(_FuelStationSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fuels: null == fuels ? _self._fuels : fuels // ignore: cast_nullable_to_non_nullable
as List<FuelStationFuel>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as bool,missingFuelTypes: null == missingFuelTypes ? _self._missingFuelTypes : missingFuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
