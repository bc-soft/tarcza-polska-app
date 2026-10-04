// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'respond_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RespondRequest {

 VerificationAnswer get answer;
/// Create a copy of RespondRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RespondRequestCopyWith<RespondRequest> get copyWith => _$RespondRequestCopyWithImpl<RespondRequest>(this as RespondRequest, _$identity);

  /// Serializes this RespondRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RespondRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RespondRequest&&(identical(other.answer, _this.answer) || other.answer == _this.answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RespondRequest;
  return Object.hash(runtimeType,_this.answer);
}

@override
String toString() {
  final _this = this as RespondRequest;
  return 'RespondRequest(answer: ${_this.answer})';
}


}

/// @nodoc
abstract mixin class $RespondRequestCopyWith<$Res>  {
  factory $RespondRequestCopyWith(RespondRequest value, $Res Function(RespondRequest) _then) = _$RespondRequestCopyWithImpl;
@useResult
$Res call({
 VerificationAnswer answer
});




}
/// @nodoc
class _$RespondRequestCopyWithImpl<$Res>
    implements $RespondRequestCopyWith<$Res> {
  _$RespondRequestCopyWithImpl(this._self, this._then);

  final RespondRequest _self;
  final $Res Function(RespondRequest) _then;

/// Create a copy of RespondRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answer = null,}) {
  return _then(RespondRequest(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as VerificationAnswer,
  ));
}

}


/// Adds pattern-matching-related methods to [RespondRequest].
extension RespondRequestPatterns on RespondRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RespondRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RespondRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RespondRequest value)  $default,){
final _that = this;
switch (_that) {
case _RespondRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RespondRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RespondRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( VerificationAnswer answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RespondRequest() when $default != null:
return $default(_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( VerificationAnswer answer)  $default,) {final _that = this;
switch (_that) {
case _RespondRequest():
return $default(_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( VerificationAnswer answer)?  $default,) {final _that = this;
switch (_that) {
case _RespondRequest() when $default != null:
return $default(_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RespondRequest implements RespondRequest {
  const _RespondRequest({required this.answer});
  factory _RespondRequest.fromJson(Map<String, dynamic> json) => _$RespondRequestFromJson(json);

@override final  VerificationAnswer answer;

/// Create a copy of RespondRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RespondRequestCopyWith<_RespondRequest> get copyWith => __$RespondRequestCopyWithImpl<_RespondRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RespondRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RespondRequest&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,answer);
}

@override
String toString() {
    return 'RespondRequest(answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$RespondRequestCopyWith<$Res> implements $RespondRequestCopyWith<$Res> {
  factory _$RespondRequestCopyWith(_RespondRequest value, $Res Function(_RespondRequest) _then) = __$RespondRequestCopyWithImpl;
@override @useResult
$Res call({
 VerificationAnswer answer
});




}
/// @nodoc
class __$RespondRequestCopyWithImpl<$Res>
    implements _$RespondRequestCopyWith<$Res> {
  __$RespondRequestCopyWithImpl(this._self, this._then);

  final _RespondRequest _self;
  final $Res Function(_RespondRequest) _then;

/// Create a copy of RespondRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answer = null,}) {
  return _then(_RespondRequest(
answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as VerificationAnswer,
  ));
}


}

// dart format on
