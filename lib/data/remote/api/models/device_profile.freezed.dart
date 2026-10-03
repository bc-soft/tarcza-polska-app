// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceProfile {

 String get deviceId; bool get hasPushToken; DevicePreferences get preferences;/// ios | android | web | simulator
 String? get platform;/// Point or null until the first location update
 GeoJsonGeometry? get lastLocation; String? get h3Cell; DateTime? get locationUpdatedAt; LocationSource? get locationSource;
/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceProfileCopyWith<DeviceProfile> get copyWith => _$DeviceProfileCopyWithImpl<DeviceProfile>(this as DeviceProfile, _$identity);

  /// Serializes this DeviceProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeviceProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceProfile&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.hasPushToken, _this.hasPushToken) || other.hasPushToken == _this.hasPushToken)&&(identical(other.preferences, _this.preferences) || other.preferences == _this.preferences)&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.lastLocation, _this.lastLocation) || other.lastLocation == _this.lastLocation)&&(identical(other.h3Cell, _this.h3Cell) || other.h3Cell == _this.h3Cell)&&(identical(other.locationUpdatedAt, _this.locationUpdatedAt) || other.locationUpdatedAt == _this.locationUpdatedAt)&&(identical(other.locationSource, _this.locationSource) || other.locationSource == _this.locationSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeviceProfile;
  return Object.hash(runtimeType,_this.deviceId,_this.hasPushToken,_this.preferences,_this.platform,_this.lastLocation,_this.h3Cell,_this.locationUpdatedAt,_this.locationSource);
}

@override
String toString() {
  final _this = this as DeviceProfile;
  return 'DeviceProfile(deviceId: ${_this.deviceId}, hasPushToken: ${_this.hasPushToken}, preferences: ${_this.preferences}, platform: ${_this.platform}, lastLocation: ${_this.lastLocation}, h3Cell: ${_this.h3Cell}, locationUpdatedAt: ${_this.locationUpdatedAt}, locationSource: ${_this.locationSource})';
}


}

/// @nodoc
abstract mixin class $DeviceProfileCopyWith<$Res>  {
  factory $DeviceProfileCopyWith(DeviceProfile value, $Res Function(DeviceProfile) _then) = _$DeviceProfileCopyWithImpl;
@useResult
$Res call({
 String deviceId, bool hasPushToken, DevicePreferences preferences, String? platform, GeoJsonGeometry? lastLocation, String? h3Cell, DateTime? locationUpdatedAt, LocationSource? locationSource
});


$DevicePreferencesCopyWith<$Res> get preferences;$GeoJsonGeometryCopyWith<$Res>? get lastLocation;

}
/// @nodoc
class _$DeviceProfileCopyWithImpl<$Res>
    implements $DeviceProfileCopyWith<$Res> {
  _$DeviceProfileCopyWithImpl(this._self, this._then);

  final DeviceProfile _self;
  final $Res Function(DeviceProfile) _then;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? hasPushToken = null,Object? preferences = null,Object? platform = freezed,Object? lastLocation = freezed,Object? h3Cell = freezed,Object? locationUpdatedAt = freezed,Object? locationSource = freezed,}) {
  return _then(DeviceProfile(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,hasPushToken: null == hasPushToken ? _self.hasPushToken : hasPushToken // ignore: cast_nullable_to_non_nullable
as bool,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as DevicePreferences,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry?,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationSource: freezed == locationSource ? _self.locationSource : locationSource // ignore: cast_nullable_to_non_nullable
as LocationSource?,
  ));
}
/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevicePreferencesCopyWith<$Res> get preferences {
  
  return $DevicePreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res>? get lastLocation {
    if (_self.lastLocation == null) {
    return null;
  }

  return $GeoJsonGeometryCopyWith<$Res>(_self.lastLocation!, (value) {
    return _then(_self.copyWith(lastLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [DeviceProfile].
extension DeviceProfilePatterns on DeviceProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceProfile value)  $default,){
final _that = this;
switch (_that) {
case _DeviceProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceProfile value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  bool hasPushToken,  DevicePreferences preferences,  String? platform,  GeoJsonGeometry? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt,  LocationSource? locationSource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
return $default(_that.deviceId,_that.hasPushToken,_that.preferences,_that.platform,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt,_that.locationSource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  bool hasPushToken,  DevicePreferences preferences,  String? platform,  GeoJsonGeometry? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt,  LocationSource? locationSource)  $default,) {final _that = this;
switch (_that) {
case _DeviceProfile():
return $default(_that.deviceId,_that.hasPushToken,_that.preferences,_that.platform,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt,_that.locationSource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  bool hasPushToken,  DevicePreferences preferences,  String? platform,  GeoJsonGeometry? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt,  LocationSource? locationSource)?  $default,) {final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
return $default(_that.deviceId,_that.hasPushToken,_that.preferences,_that.platform,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt,_that.locationSource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceProfile implements DeviceProfile {
  const _DeviceProfile({required this.deviceId, required this.hasPushToken, required this.preferences, this.platform, this.lastLocation, this.h3Cell, this.locationUpdatedAt, this.locationSource});
  factory _DeviceProfile.fromJson(Map<String, dynamic> json) => _$DeviceProfileFromJson(json);

@override final  String deviceId;
@override final  bool hasPushToken;
@override final  DevicePreferences preferences;
/// ios | android | web | simulator
@override final  String? platform;
/// Point or null until the first location update
@override final  GeoJsonGeometry? lastLocation;
@override final  String? h3Cell;
@override final  DateTime? locationUpdatedAt;
@override final  LocationSource? locationSource;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceProfileCopyWith<_DeviceProfile> get copyWith => __$DeviceProfileCopyWithImpl<_DeviceProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceProfile&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.hasPushToken, hasPushToken) || other.hasPushToken == hasPushToken)&&(identical(other.preferences, preferences) || other.preferences == preferences)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.lastLocation, lastLocation) || other.lastLocation == lastLocation)&&(identical(other.h3Cell, h3Cell) || other.h3Cell == h3Cell)&&(identical(other.locationUpdatedAt, locationUpdatedAt) || other.locationUpdatedAt == locationUpdatedAt)&&(identical(other.locationSource, locationSource) || other.locationSource == locationSource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,deviceId,hasPushToken,preferences,platform,lastLocation,h3Cell,locationUpdatedAt,locationSource);
}

@override
String toString() {
    return 'DeviceProfile(deviceId: $deviceId, hasPushToken: $hasPushToken, preferences: $preferences, platform: $platform, lastLocation: $lastLocation, h3Cell: $h3Cell, locationUpdatedAt: $locationUpdatedAt, locationSource: $locationSource)';
}


}

/// @nodoc
abstract mixin class _$DeviceProfileCopyWith<$Res> implements $DeviceProfileCopyWith<$Res> {
  factory _$DeviceProfileCopyWith(_DeviceProfile value, $Res Function(_DeviceProfile) _then) = __$DeviceProfileCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, bool hasPushToken, DevicePreferences preferences, String? platform, GeoJsonGeometry? lastLocation, String? h3Cell, DateTime? locationUpdatedAt, LocationSource? locationSource
});


@override $DevicePreferencesCopyWith<$Res> get preferences;@override $GeoJsonGeometryCopyWith<$Res>? get lastLocation;

}
/// @nodoc
class __$DeviceProfileCopyWithImpl<$Res>
    implements _$DeviceProfileCopyWith<$Res> {
  __$DeviceProfileCopyWithImpl(this._self, this._then);

  final _DeviceProfile _self;
  final $Res Function(_DeviceProfile) _then;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? hasPushToken = null,Object? preferences = null,Object? platform = freezed,Object? lastLocation = freezed,Object? h3Cell = freezed,Object? locationUpdatedAt = freezed,Object? locationSource = freezed,}) {
  return _then(_DeviceProfile(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,hasPushToken: null == hasPushToken ? _self.hasPushToken : hasPushToken // ignore: cast_nullable_to_non_nullable
as bool,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as DevicePreferences,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry?,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,locationSource: freezed == locationSource ? _self.locationSource : locationSource // ignore: cast_nullable_to_non_nullable
as LocationSource?,
  ));
}

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DevicePreferencesCopyWith<$Res> get preferences {
  
  return $DevicePreferencesCopyWith<$Res>(_self.preferences, (value) {
    return _then(_self.copyWith(preferences: value));
  });
}/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res>? get lastLocation {
    if (_self.lastLocation == null) {
    return null;
  }

  return $GeoJsonGeometryCopyWith<$Res>(_self.lastLocation!, (value) {
    return _then(_self.copyWith(lastLocation: value));
  });
}
}

// dart format on
