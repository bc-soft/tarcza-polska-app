// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_push_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdatePushTokenRequest {

 String get pushToken;
/// Create a copy of UpdatePushTokenRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePushTokenRequestCopyWith<UpdatePushTokenRequest> get copyWith => _$UpdatePushTokenRequestCopyWithImpl<UpdatePushTokenRequest>(this as UpdatePushTokenRequest, _$identity);

  /// Serializes this UpdatePushTokenRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UpdatePushTokenRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePushTokenRequest&&(identical(other.pushToken, _this.pushToken) || other.pushToken == _this.pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UpdatePushTokenRequest;
  return Object.hash(runtimeType,_this.pushToken);
}

@override
String toString() {
  final _this = this as UpdatePushTokenRequest;
  return 'UpdatePushTokenRequest(pushToken: ${_this.pushToken})';
}


}

/// @nodoc
abstract mixin class $UpdatePushTokenRequestCopyWith<$Res>  {
  factory $UpdatePushTokenRequestCopyWith(UpdatePushTokenRequest value, $Res Function(UpdatePushTokenRequest) _then) = _$UpdatePushTokenRequestCopyWithImpl;
@useResult
$Res call({
 String pushToken
});




}
/// @nodoc
class _$UpdatePushTokenRequestCopyWithImpl<$Res>
    implements $UpdatePushTokenRequestCopyWith<$Res> {
  _$UpdatePushTokenRequestCopyWithImpl(this._self, this._then);

  final UpdatePushTokenRequest _self;
  final $Res Function(UpdatePushTokenRequest) _then;

/// Create a copy of UpdatePushTokenRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushToken = null,}) {
  return _then(UpdatePushTokenRequest(
pushToken: null == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePushTokenRequest].
extension UpdatePushTokenRequestPatterns on UpdatePushTokenRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePushTokenRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePushTokenRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePushTokenRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePushTokenRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePushTokenRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePushTokenRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pushToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePushTokenRequest() when $default != null:
return $default(_that.pushToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pushToken)  $default,) {final _that = this;
switch (_that) {
case _UpdatePushTokenRequest():
return $default(_that.pushToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pushToken)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePushTokenRequest() when $default != null:
return $default(_that.pushToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePushTokenRequest implements UpdatePushTokenRequest {
  const _UpdatePushTokenRequest({required this.pushToken});
  factory _UpdatePushTokenRequest.fromJson(Map<String, dynamic> json) => _$UpdatePushTokenRequestFromJson(json);

@override final  String pushToken;

/// Create a copy of UpdatePushTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePushTokenRequestCopyWith<_UpdatePushTokenRequest> get copyWith => __$UpdatePushTokenRequestCopyWithImpl<_UpdatePushTokenRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePushTokenRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePushTokenRequest&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,pushToken);
}

@override
String toString() {
    return 'UpdatePushTokenRequest(pushToken: $pushToken)';
}


}

/// @nodoc
abstract mixin class _$UpdatePushTokenRequestCopyWith<$Res> implements $UpdatePushTokenRequestCopyWith<$Res> {
  factory _$UpdatePushTokenRequestCopyWith(_UpdatePushTokenRequest value, $Res Function(_UpdatePushTokenRequest) _then) = __$UpdatePushTokenRequestCopyWithImpl;
@override @useResult
$Res call({
 String pushToken
});




}
/// @nodoc
class __$UpdatePushTokenRequestCopyWithImpl<$Res>
    implements _$UpdatePushTokenRequestCopyWith<$Res> {
  __$UpdatePushTokenRequestCopyWithImpl(this._self, this._then);

  final _UpdatePushTokenRequest _self;
  final $Res Function(_UpdatePushTokenRequest) _then;

/// Create a copy of UpdatePushTokenRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pushToken = null,}) {
  return _then(_UpdatePushTokenRequest(
pushToken: null == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
