// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_device_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterDeviceRequest {

 RegisterDeviceRequestPlatform? get platform; String? get appVersion; String? get pushToken;
/// Create a copy of RegisterDeviceRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDeviceRequestCopyWith<RegisterDeviceRequest> get copyWith => _$RegisterDeviceRequestCopyWithImpl<RegisterDeviceRequest>(this as RegisterDeviceRequest, _$identity);

  /// Serializes this RegisterDeviceRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RegisterDeviceRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDeviceRequest&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.appVersion, _this.appVersion) || other.appVersion == _this.appVersion)&&(identical(other.pushToken, _this.pushToken) || other.pushToken == _this.pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RegisterDeviceRequest;
  return Object.hash(runtimeType,_this.platform,_this.appVersion,_this.pushToken);
}

@override
String toString() {
  final _this = this as RegisterDeviceRequest;
  return 'RegisterDeviceRequest(platform: ${_this.platform}, appVersion: ${_this.appVersion}, pushToken: ${_this.pushToken})';
}


}

/// @nodoc
abstract mixin class $RegisterDeviceRequestCopyWith<$Res>  {
  factory $RegisterDeviceRequestCopyWith(RegisterDeviceRequest value, $Res Function(RegisterDeviceRequest) _then) = _$RegisterDeviceRequestCopyWithImpl;
@useResult
$Res call({
 RegisterDeviceRequestPlatform? platform, String? appVersion, String? pushToken
});




}
/// @nodoc
class _$RegisterDeviceRequestCopyWithImpl<$Res>
    implements $RegisterDeviceRequestCopyWith<$Res> {
  _$RegisterDeviceRequestCopyWithImpl(this._self, this._then);

  final RegisterDeviceRequest _self;
  final $Res Function(RegisterDeviceRequest) _then;

/// Create a copy of RegisterDeviceRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platform = freezed,Object? appVersion = freezed,Object? pushToken = freezed,}) {
  return _then(RegisterDeviceRequest(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RegisterDeviceRequestPlatform?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,pushToken: freezed == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterDeviceRequest].
extension RegisterDeviceRequestPatterns on RegisterDeviceRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDeviceRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDeviceRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDeviceRequest value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDeviceRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDeviceRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDeviceRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RegisterDeviceRequestPlatform? platform,  String? appVersion,  String? pushToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterDeviceRequest() when $default != null:
return $default(_that.platform,_that.appVersion,_that.pushToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RegisterDeviceRequestPlatform? platform,  String? appVersion,  String? pushToken)  $default,) {final _that = this;
switch (_that) {
case _RegisterDeviceRequest():
return $default(_that.platform,_that.appVersion,_that.pushToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RegisterDeviceRequestPlatform? platform,  String? appVersion,  String? pushToken)?  $default,) {final _that = this;
switch (_that) {
case _RegisterDeviceRequest() when $default != null:
return $default(_that.platform,_that.appVersion,_that.pushToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDeviceRequest implements RegisterDeviceRequest {
  const _RegisterDeviceRequest({required this.platform, required this.appVersion, required this.pushToken});
  factory _RegisterDeviceRequest.fromJson(Map<String, dynamic> json) => _$RegisterDeviceRequestFromJson(json);

@override final  RegisterDeviceRequestPlatform? platform;
@override final  String? appVersion;
@override final  String? pushToken;

/// Create a copy of RegisterDeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDeviceRequestCopyWith<_RegisterDeviceRequest> get copyWith => __$RegisterDeviceRequestCopyWithImpl<_RegisterDeviceRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDeviceRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDeviceRequest&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,platform,appVersion,pushToken);
}

@override
String toString() {
    return 'RegisterDeviceRequest(platform: $platform, appVersion: $appVersion, pushToken: $pushToken)';
}


}

/// @nodoc
abstract mixin class _$RegisterDeviceRequestCopyWith<$Res> implements $RegisterDeviceRequestCopyWith<$Res> {
  factory _$RegisterDeviceRequestCopyWith(_RegisterDeviceRequest value, $Res Function(_RegisterDeviceRequest) _then) = __$RegisterDeviceRequestCopyWithImpl;
@override @useResult
$Res call({
 RegisterDeviceRequestPlatform? platform, String? appVersion, String? pushToken
});




}
/// @nodoc
class __$RegisterDeviceRequestCopyWithImpl<$Res>
    implements _$RegisterDeviceRequestCopyWith<$Res> {
  __$RegisterDeviceRequestCopyWithImpl(this._self, this._then);

  final _RegisterDeviceRequest _self;
  final $Res Function(_RegisterDeviceRequest) _then;

/// Create a copy of RegisterDeviceRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platform = freezed,Object? appVersion = freezed,Object? pushToken = freezed,}) {
  return _then(_RegisterDeviceRequest(
platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as RegisterDeviceRequestPlatform?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,pushToken: freezed == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
