// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_location_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateLocationRequest {

 double get lat; double get lng; double? get accuracyMeters; LocationSource? get source;
/// Create a copy of UpdateLocationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateLocationRequestCopyWith<UpdateLocationRequest> get copyWith => _$UpdateLocationRequestCopyWithImpl<UpdateLocationRequest>(this as UpdateLocationRequest, _$identity);

  /// Serializes this UpdateLocationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdateLocationRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateLocationRequest&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.accuracyMeters, _this.accuracyMeters) || other.accuracyMeters == _this.accuracyMeters)&&(identical(other.source, _this.source) || other.source == _this.source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdateLocationRequest;
  return Object.hash(runtimeType,_this.lat,_this.lng,_this.accuracyMeters,_this.source);
}

@override
String toString() {
  final _this = this as UpdateLocationRequest;
  return 'UpdateLocationRequest(lat: ${_this.lat}, lng: ${_this.lng}, accuracyMeters: ${_this.accuracyMeters}, source: ${_this.source})';
}


}

/// @nodoc
abstract mixin class $UpdateLocationRequestCopyWith<$Res>  {
  factory $UpdateLocationRequestCopyWith(UpdateLocationRequest value, $Res Function(UpdateLocationRequest) _then) = _$UpdateLocationRequestCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, double? accuracyMeters, LocationSource? source
});




}
/// @nodoc
class _$UpdateLocationRequestCopyWithImpl<$Res>
    implements $UpdateLocationRequestCopyWith<$Res> {
  _$UpdateLocationRequestCopyWithImpl(this._self, this._then);

  final UpdateLocationRequest _self;
  final $Res Function(UpdateLocationRequest) _then;

/// Create a copy of UpdateLocationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? accuracyMeters = freezed,Object? source = freezed,}) {
  return _then(UpdateLocationRequest(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as LocationSource?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateLocationRequest].
extension UpdateLocationRequestPatterns on UpdateLocationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateLocationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateLocationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateLocationRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateLocationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateLocationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateLocationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  double? accuracyMeters,  LocationSource? source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateLocationRequest() when $default != null:
return $default(_that.lat,_that.lng,_that.accuracyMeters,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  double? accuracyMeters,  LocationSource? source)  $default,) {final _that = this;
switch (_that) {
case _UpdateLocationRequest():
return $default(_that.lat,_that.lng,_that.accuracyMeters,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  double? accuracyMeters,  LocationSource? source)?  $default,) {final _that = this;
switch (_that) {
case _UpdateLocationRequest() when $default != null:
return $default(_that.lat,_that.lng,_that.accuracyMeters,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateLocationRequest implements UpdateLocationRequest {
  const _UpdateLocationRequest({required this.lat, required this.lng, required this.accuracyMeters, required this.source});
  factory _UpdateLocationRequest.fromJson(Map<String, dynamic> json) => _$UpdateLocationRequestFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  double? accuracyMeters;
@override final  LocationSource? source;

/// Create a copy of UpdateLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateLocationRequestCopyWith<_UpdateLocationRequest> get copyWith => __$UpdateLocationRequestCopyWithImpl<_UpdateLocationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateLocationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateLocationRequest&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.accuracyMeters, accuracyMeters) || other.accuracyMeters == accuracyMeters)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lat,lng,accuracyMeters,source);
}

@override
String toString() {
    return 'UpdateLocationRequest(lat: $lat, lng: $lng, accuracyMeters: $accuracyMeters, source: $source)';
}


}

/// @nodoc
abstract mixin class _$UpdateLocationRequestCopyWith<$Res> implements $UpdateLocationRequestCopyWith<$Res> {
  factory _$UpdateLocationRequestCopyWith(_UpdateLocationRequest value, $Res Function(_UpdateLocationRequest) _then) = __$UpdateLocationRequestCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, double? accuracyMeters, LocationSource? source
});




}
/// @nodoc
class __$UpdateLocationRequestCopyWithImpl<$Res>
    implements _$UpdateLocationRequestCopyWith<$Res> {
  __$UpdateLocationRequestCopyWithImpl(this._self, this._then);

  final _UpdateLocationRequest _self;
  final $Res Function(_UpdateLocationRequest) _then;

/// Create a copy of UpdateLocationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? accuracyMeters = freezed,Object? source = freezed,}) {
  return _then(_UpdateLocationRequest(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,accuracyMeters: freezed == accuracyMeters ? _self.accuracyMeters : accuracyMeters // ignore: cast_nullable_to_non_nullable
as double?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as LocationSource?,
  ));
}


}

// dart format on
