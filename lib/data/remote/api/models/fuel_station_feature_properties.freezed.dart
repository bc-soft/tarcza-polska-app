// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel_station_feature_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FuelStationFeatureProperties {

 String get id; String get name;/// Fuel types sold (or ever reported) at this station with current availability
 List<FuelStationFuel> get fuels;/// At least one fuel type currently reported missing
 bool get shortage; List<FuelType> get missingFuelTypes; int get confirmationCount; FuelStationFeaturePropertiesKind get kind; String? get brand; String? get address; DateTime? get lastConfirmedAt;/// Only in GET /fuel-stations?lat&lng and the offline bundle
 int? get distanceMeters;
/// Create a copy of FuelStationFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FuelStationFeaturePropertiesCopyWith<FuelStationFeatureProperties> get copyWith => _$FuelStationFeaturePropertiesCopyWithImpl<FuelStationFeatureProperties>(this as FuelStationFeatureProperties, _$identity);

  /// Serializes this FuelStationFeatureProperties to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FuelStationFeatureProperties;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FuelStationFeatureProperties&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.fuels, _this.fuels)&&(identical(other.shortage, _this.shortage) || other.shortage == _this.shortage)&&const DeepCollectionEquality().equals(other.missingFuelTypes, _this.missingFuelTypes)&&(identical(other.confirmationCount, _this.confirmationCount) || other.confirmationCount == _this.confirmationCount)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FuelStationFeatureProperties;
  return Object.hash(runtimeType,_this.id,_this.name,const DeepCollectionEquality().hash(_this.fuels),_this.shortage,const DeepCollectionEquality().hash(_this.missingFuelTypes),_this.confirmationCount,_this.kind,_this.brand,_this.address,_this.lastConfirmedAt,_this.distanceMeters);
}

@override
String toString() {
  final _this = this as FuelStationFeatureProperties;
  return 'FuelStationFeatureProperties(id: ${_this.id}, name: ${_this.name}, fuels: ${_this.fuels}, shortage: ${_this.shortage}, missingFuelTypes: ${_this.missingFuelTypes}, confirmationCount: ${_this.confirmationCount}, kind: ${_this.kind}, brand: ${_this.brand}, address: ${_this.address}, lastConfirmedAt: ${_this.lastConfirmedAt}, distanceMeters: ${_this.distanceMeters})';
}


}

/// @nodoc
abstract mixin class $FuelStationFeaturePropertiesCopyWith<$Res>  {
  factory $FuelStationFeaturePropertiesCopyWith(FuelStationFeatureProperties value, $Res Function(FuelStationFeatureProperties) _then) = _$FuelStationFeaturePropertiesCopyWithImpl;
@useResult
$Res call({
 String id, String name, List<FuelStationFuel> fuels, bool shortage, List<FuelType> missingFuelTypes, int confirmationCount, FuelStationFeaturePropertiesKind kind, String? brand, String? address, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class _$FuelStationFeaturePropertiesCopyWithImpl<$Res>
    implements $FuelStationFeaturePropertiesCopyWith<$Res> {
  _$FuelStationFeaturePropertiesCopyWithImpl(this._self, this._then);

  final FuelStationFeatureProperties _self;
  final $Res Function(FuelStationFeatureProperties) _then;

/// Create a copy of FuelStationFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? fuels = null,Object? shortage = null,Object? missingFuelTypes = null,Object? confirmationCount = null,Object? kind = null,Object? brand = freezed,Object? address = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(FuelStationFeatureProperties(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fuels: null == fuels ? _self.fuels : fuels // ignore: cast_nullable_to_non_nullable
as List<FuelStationFuel>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as bool,missingFuelTypes: null == missingFuelTypes ? _self.missingFuelTypes : missingFuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as FuelStationFeaturePropertiesKind,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FuelStationFeatureProperties].
extension FuelStationFeaturePropertiesPatterns on FuelStationFeatureProperties {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FuelStationFeatureProperties value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FuelStationFeatureProperties() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FuelStationFeatureProperties value)  $default,){
final _that = this;
switch (_that) {
case _FuelStationFeatureProperties():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FuelStationFeatureProperties value)?  $default,){
final _that = this;
switch (_that) {
case _FuelStationFeatureProperties() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FuelStationFeatureProperties() when $default != null:
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _FuelStationFeatureProperties():
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  List<FuelStationFuel> fuels,  bool shortage,  List<FuelType> missingFuelTypes,  int confirmationCount,  FuelStationFeaturePropertiesKind kind,  String? brand,  String? address,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _FuelStationFeatureProperties() when $default != null:
return $default(_that.id,_that.name,_that.fuels,_that.shortage,_that.missingFuelTypes,_that.confirmationCount,_that.kind,_that.brand,_that.address,_that.lastConfirmedAt,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FuelStationFeatureProperties implements FuelStationFeatureProperties {
  const _FuelStationFeatureProperties({required this.id, required this.name, required  List<FuelStationFuel> fuels, required this.shortage, required  List<FuelType> missingFuelTypes, required this.confirmationCount, required this.kind, this.brand, this.address, this.lastConfirmedAt, this.distanceMeters}): _fuels = fuels,_missingFuelTypes = missingFuelTypes;
  factory _FuelStationFeatureProperties.fromJson(Map<String, dynamic> json) => _$FuelStationFeaturePropertiesFromJson(json);

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
@override final  FuelStationFeaturePropertiesKind kind;
@override final  String? brand;
@override final  String? address;
@override final  DateTime? lastConfirmedAt;
/// Only in GET /fuel-stations?lat&lng and the offline bundle
@override final  int? distanceMeters;

/// Create a copy of FuelStationFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FuelStationFeaturePropertiesCopyWith<_FuelStationFeatureProperties> get copyWith => __$FuelStationFeaturePropertiesCopyWithImpl<_FuelStationFeatureProperties>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FuelStationFeaturePropertiesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FuelStationFeatureProperties&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.fuels, _fuels)&&(identical(other.shortage, shortage) || other.shortage == shortage)&&const DeepCollectionEquality().equals(other.missingFuelTypes, _missingFuelTypes)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.address, address) || other.address == address)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_fuels),shortage,const DeepCollectionEquality().hash(_missingFuelTypes),confirmationCount,kind,brand,address,lastConfirmedAt,distanceMeters);
}

@override
String toString() {
    return 'FuelStationFeatureProperties(id: $id, name: $name, fuels: $fuels, shortage: $shortage, missingFuelTypes: $missingFuelTypes, confirmationCount: $confirmationCount, kind: $kind, brand: $brand, address: $address, lastConfirmedAt: $lastConfirmedAt, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$FuelStationFeaturePropertiesCopyWith<$Res> implements $FuelStationFeaturePropertiesCopyWith<$Res> {
  factory _$FuelStationFeaturePropertiesCopyWith(_FuelStationFeatureProperties value, $Res Function(_FuelStationFeatureProperties) _then) = __$FuelStationFeaturePropertiesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, List<FuelStationFuel> fuels, bool shortage, List<FuelType> missingFuelTypes, int confirmationCount, FuelStationFeaturePropertiesKind kind, String? brand, String? address, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class __$FuelStationFeaturePropertiesCopyWithImpl<$Res>
    implements _$FuelStationFeaturePropertiesCopyWith<$Res> {
  __$FuelStationFeaturePropertiesCopyWithImpl(this._self, this._then);

  final _FuelStationFeatureProperties _self;
  final $Res Function(_FuelStationFeatureProperties) _then;

/// Create a copy of FuelStationFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? fuels = null,Object? shortage = null,Object? missingFuelTypes = null,Object? confirmationCount = null,Object? kind = null,Object? brand = freezed,Object? address = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(_FuelStationFeatureProperties(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fuels: null == fuels ? _self._fuels : fuels // ignore: cast_nullable_to_non_nullable
as List<FuelStationFuel>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as bool,missingFuelTypes: null == missingFuelTypes ? _self._missingFuelTypes : missingFuelTypes // ignore: cast_nullable_to_non_nullable
as List<FuelType>,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as FuelStationFeaturePropertiesKind,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
