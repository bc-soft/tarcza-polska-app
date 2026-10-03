// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_api_v1_devices_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostApiV1DevicesResponse {

 String? get deviceId;/// Bearer token for /api/v1/*
 String? get token;
/// Create a copy of PostApiV1DevicesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostApiV1DevicesResponseCopyWith<PostApiV1DevicesResponse> get copyWith => _$PostApiV1DevicesResponseCopyWithImpl<PostApiV1DevicesResponse>(this as PostApiV1DevicesResponse, _$identity);

  /// Serializes this PostApiV1DevicesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PostApiV1DevicesResponse;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostApiV1DevicesResponse&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.token, _this.token) || other.token == _this.token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PostApiV1DevicesResponse;
  return Object.hash(runtimeType,_this.deviceId,_this.token);
}

@override
String toString() {
  final _this = this as PostApiV1DevicesResponse;
  return 'PostApiV1DevicesResponse(deviceId: ${_this.deviceId}, token: ${_this.token})';
}


}

/// @nodoc
abstract mixin class $PostApiV1DevicesResponseCopyWith<$Res>  {
  factory $PostApiV1DevicesResponseCopyWith(PostApiV1DevicesResponse value, $Res Function(PostApiV1DevicesResponse) _then) = _$PostApiV1DevicesResponseCopyWithImpl;
@useResult
$Res call({
 String? deviceId, String? token
});




}
/// @nodoc
class _$PostApiV1DevicesResponseCopyWithImpl<$Res>
    implements $PostApiV1DevicesResponseCopyWith<$Res> {
  _$PostApiV1DevicesResponseCopyWithImpl(this._self, this._then);

  final PostApiV1DevicesResponse _self;
  final $Res Function(PostApiV1DevicesResponse) _then;

/// Create a copy of PostApiV1DevicesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = freezed,Object? token = freezed,}) {
  return _then(PostApiV1DevicesResponse(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostApiV1DevicesResponse].
extension PostApiV1DevicesResponsePatterns on PostApiV1DevicesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostApiV1DevicesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostApiV1DevicesResponse value)  $default,){
final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostApiV1DevicesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? deviceId,  String? token)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse() when $default != null:
return $default(_that.deviceId,_that.token);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? deviceId,  String? token)  $default,) {final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse():
return $default(_that.deviceId,_that.token);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? deviceId,  String? token)?  $default,) {final _that = this;
switch (_that) {
case _PostApiV1DevicesResponse() when $default != null:
return $default(_that.deviceId,_that.token);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostApiV1DevicesResponse implements PostApiV1DevicesResponse {
  const _PostApiV1DevicesResponse({this.deviceId, this.token});
  factory _PostApiV1DevicesResponse.fromJson(Map<String, dynamic> json) => _$PostApiV1DevicesResponseFromJson(json);

@override final  String? deviceId;
/// Bearer token for /api/v1/*
@override final  String? token;

/// Create a copy of PostApiV1DevicesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostApiV1DevicesResponseCopyWith<_PostApiV1DevicesResponse> get copyWith => __$PostApiV1DevicesResponseCopyWithImpl<_PostApiV1DevicesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostApiV1DevicesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostApiV1DevicesResponse&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.token, token) || other.token == token));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,deviceId,token);
}

@override
String toString() {
    return 'PostApiV1DevicesResponse(deviceId: $deviceId, token: $token)';
}


}

/// @nodoc
abstract mixin class _$PostApiV1DevicesResponseCopyWith<$Res> implements $PostApiV1DevicesResponseCopyWith<$Res> {
  factory _$PostApiV1DevicesResponseCopyWith(_PostApiV1DevicesResponse value, $Res Function(_PostApiV1DevicesResponse) _then) = __$PostApiV1DevicesResponseCopyWithImpl;
@override @useResult
$Res call({
 String? deviceId, String? token
});




}
/// @nodoc
class __$PostApiV1DevicesResponseCopyWithImpl<$Res>
    implements _$PostApiV1DevicesResponseCopyWith<$Res> {
  __$PostApiV1DevicesResponseCopyWithImpl(this._self, this._then);

  final _PostApiV1DevicesResponse _self;
  final $Res Function(_PostApiV1DevicesResponse) _then;

/// Create a copy of PostApiV1DevicesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = freezed,Object? token = freezed,}) {
  return _then(_PostApiV1DevicesResponse(
deviceId: freezed == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
