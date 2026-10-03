// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shelter_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShelterSummary {

 String get id; String get name; ShelterStatus get status; String get statusLabel; ShelterOccupancy get occupancy; String get occupancyLabel; int get confirmationCount; String? get address; int? get capacity; ShelterAvailability? get availability; String? get availabilityLabel; DateTime? get lastConfirmedAt;/// Only in GET /shelters?lat&lng
 int? get distanceMeters;
/// Create a copy of ShelterSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelterSummaryCopyWith<ShelterSummary> get copyWith => _$ShelterSummaryCopyWithImpl<ShelterSummary>(this as ShelterSummary, _$identity);

  /// Serializes this ShelterSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShelterSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelterSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.occupancy, _this.occupancy) || other.occupancy == _this.occupancy)&&(identical(other.occupancyLabel, _this.occupancyLabel) || other.occupancyLabel == _this.occupancyLabel)&&(identical(other.confirmationCount, _this.confirmationCount) || other.confirmationCount == _this.confirmationCount)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.availability, _this.availability) || other.availability == _this.availability)&&(identical(other.availabilityLabel, _this.availabilityLabel) || other.availabilityLabel == _this.availabilityLabel)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShelterSummary;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.statusLabel,_this.occupancy,_this.occupancyLabel,_this.confirmationCount,_this.address,_this.capacity,_this.availability,_this.availabilityLabel,_this.lastConfirmedAt,_this.distanceMeters);
}

@override
String toString() {
  final _this = this as ShelterSummary;
  return 'ShelterSummary(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, occupancy: ${_this.occupancy}, occupancyLabel: ${_this.occupancyLabel}, confirmationCount: ${_this.confirmationCount}, address: ${_this.address}, capacity: ${_this.capacity}, availability: ${_this.availability}, availabilityLabel: ${_this.availabilityLabel}, lastConfirmedAt: ${_this.lastConfirmedAt}, distanceMeters: ${_this.distanceMeters})';
}


}

/// @nodoc
abstract mixin class $ShelterSummaryCopyWith<$Res>  {
  factory $ShelterSummaryCopyWith(ShelterSummary value, $Res Function(ShelterSummary) _then) = _$ShelterSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String name, ShelterStatus status, String statusLabel, ShelterOccupancy occupancy, String occupancyLabel, int confirmationCount, String? address, int? capacity, ShelterAvailability? availability, String? availabilityLabel, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class _$ShelterSummaryCopyWithImpl<$Res>
    implements $ShelterSummaryCopyWith<$Res> {
  _$ShelterSummaryCopyWithImpl(this._self, this._then);

  final ShelterSummary _self;
  final $Res Function(ShelterSummary) _then;

/// Create a copy of ShelterSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? statusLabel = null,Object? occupancy = null,Object? occupancyLabel = null,Object? confirmationCount = null,Object? address = freezed,Object? capacity = freezed,Object? availability = freezed,Object? availabilityLabel = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(ShelterSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,occupancy: null == occupancy ? _self.occupancy : occupancy // ignore: cast_nullable_to_non_nullable
as ShelterOccupancy,occupancyLabel: null == occupancyLabel ? _self.occupancyLabel : occupancyLabel // ignore: cast_nullable_to_non_nullable
as String,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ShelterAvailability?,availabilityLabel: freezed == availabilityLabel ? _self.availabilityLabel : availabilityLabel // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShelterSummary].
extension ShelterSummaryPatterns on ShelterSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShelterSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShelterSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShelterSummary value)  $default,){
final _that = this;
switch (_that) {
case _ShelterSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShelterSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ShelterSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShelterSummary() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _ShelterSummary():
return $default(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ShelterStatus status,  String statusLabel,  ShelterOccupancy occupancy,  String occupancyLabel,  int confirmationCount,  String? address,  int? capacity,  ShelterAvailability? availability,  String? availabilityLabel,  DateTime? lastConfirmedAt,  int? distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _ShelterSummary() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.statusLabel,_that.occupancy,_that.occupancyLabel,_that.confirmationCount,_that.address,_that.capacity,_that.availability,_that.availabilityLabel,_that.lastConfirmedAt,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShelterSummary implements ShelterSummary {
  const _ShelterSummary({required this.id, required this.name, required this.status, required this.statusLabel, required this.occupancy, required this.occupancyLabel, required this.confirmationCount, this.address, this.capacity, this.availability, this.availabilityLabel, this.lastConfirmedAt, this.distanceMeters});
  factory _ShelterSummary.fromJson(Map<String, dynamic> json) => _$ShelterSummaryFromJson(json);

@override final  String id;
@override final  String name;
@override final  ShelterStatus status;
@override final  String statusLabel;
@override final  ShelterOccupancy occupancy;
@override final  String occupancyLabel;
@override final  int confirmationCount;
@override final  String? address;
@override final  int? capacity;
@override final  ShelterAvailability? availability;
@override final  String? availabilityLabel;
@override final  DateTime? lastConfirmedAt;
/// Only in GET /shelters?lat&lng
@override final  int? distanceMeters;

/// Create a copy of ShelterSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelterSummaryCopyWith<_ShelterSummary> get copyWith => __$ShelterSummaryCopyWithImpl<_ShelterSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShelterSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShelterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.occupancy, occupancy) || other.occupancy == occupancy)&&(identical(other.occupancyLabel, occupancyLabel) || other.occupancyLabel == occupancyLabel)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.address, address) || other.address == address)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.availabilityLabel, availabilityLabel) || other.availabilityLabel == availabilityLabel)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,statusLabel,occupancy,occupancyLabel,confirmationCount,address,capacity,availability,availabilityLabel,lastConfirmedAt,distanceMeters);
}

@override
String toString() {
    return 'ShelterSummary(id: $id, name: $name, status: $status, statusLabel: $statusLabel, occupancy: $occupancy, occupancyLabel: $occupancyLabel, confirmationCount: $confirmationCount, address: $address, capacity: $capacity, availability: $availability, availabilityLabel: $availabilityLabel, lastConfirmedAt: $lastConfirmedAt, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$ShelterSummaryCopyWith<$Res> implements $ShelterSummaryCopyWith<$Res> {
  factory _$ShelterSummaryCopyWith(_ShelterSummary value, $Res Function(_ShelterSummary) _then) = __$ShelterSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ShelterStatus status, String statusLabel, ShelterOccupancy occupancy, String occupancyLabel, int confirmationCount, String? address, int? capacity, ShelterAvailability? availability, String? availabilityLabel, DateTime? lastConfirmedAt, int? distanceMeters
});




}
/// @nodoc
class __$ShelterSummaryCopyWithImpl<$Res>
    implements _$ShelterSummaryCopyWith<$Res> {
  __$ShelterSummaryCopyWithImpl(this._self, this._then);

  final _ShelterSummary _self;
  final $Res Function(_ShelterSummary) _then;

/// Create a copy of ShelterSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? statusLabel = null,Object? occupancy = null,Object? occupancyLabel = null,Object? confirmationCount = null,Object? address = freezed,Object? capacity = freezed,Object? availability = freezed,Object? availabilityLabel = freezed,Object? lastConfirmedAt = freezed,Object? distanceMeters = freezed,}) {
  return _then(_ShelterSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,occupancy: null == occupancy ? _self.occupancy : occupancy // ignore: cast_nullable_to_non_nullable
as ShelterOccupancy,occupancyLabel: null == occupancyLabel ? _self.occupancyLabel : occupancyLabel // ignore: cast_nullable_to_non_nullable
as String,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as ShelterAvailability?,availabilityLabel: freezed == availabilityLabel ? _self.availabilityLabel : availabilityLabel // ignore: cast_nullable_to_non_nullable
as String?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
