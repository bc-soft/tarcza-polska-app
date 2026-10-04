// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationResult {

 String get verificationId; String get incidentId;/// Polish thank-you line to show the user
 String get thanks;
/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationResultCopyWith<VerificationResult> get copyWith => _$VerificationResultCopyWithImpl<VerificationResult>(this as VerificationResult, _$identity);

  /// Serializes this VerificationResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VerificationResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationResult&&(identical(other.verificationId, _this.verificationId) || other.verificationId == _this.verificationId)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId)&&(identical(other.thanks, _this.thanks) || other.thanks == _this.thanks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VerificationResult;
  return Object.hash(runtimeType,_this.verificationId,_this.incidentId,_this.thanks);
}

@override
String toString() {
  final _this = this as VerificationResult;
  return 'VerificationResult(verificationId: ${_this.verificationId}, incidentId: ${_this.incidentId}, thanks: ${_this.thanks})';
}


}

/// @nodoc
abstract mixin class $VerificationResultCopyWith<$Res>  {
  factory $VerificationResultCopyWith(VerificationResult value, $Res Function(VerificationResult) _then) = _$VerificationResultCopyWithImpl;
@useResult
$Res call({
 String verificationId, String incidentId, String thanks
});




}
/// @nodoc
class _$VerificationResultCopyWithImpl<$Res>
    implements $VerificationResultCopyWith<$Res> {
  _$VerificationResultCopyWithImpl(this._self, this._then);

  final VerificationResult _self;
  final $Res Function(VerificationResult) _then;

/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,Object? incidentId = null,Object? thanks = null,}) {
  return _then(VerificationResult(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,thanks: null == thanks ? _self.thanks : thanks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationResult].
extension VerificationResultPatterns on VerificationResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationResult value)  $default,){
final _that = this;
switch (_that) {
case _VerificationResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationResult value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  String thanks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationResult() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.thanks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  String thanks)  $default,) {final _that = this;
switch (_that) {
case _VerificationResult():
return $default(_that.verificationId,_that.incidentId,_that.thanks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId,  String incidentId,  String thanks)?  $default,) {final _that = this;
switch (_that) {
case _VerificationResult() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.thanks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationResult implements VerificationResult {
  const _VerificationResult({required this.verificationId, required this.incidentId, required this.thanks});
  factory _VerificationResult.fromJson(Map<String, dynamic> json) => _$VerificationResultFromJson(json);

@override final  String verificationId;
@override final  String incidentId;
/// Polish thank-you line to show the user
@override final  String thanks;

/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationResultCopyWith<_VerificationResult> get copyWith => __$VerificationResultCopyWithImpl<_VerificationResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationResultToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationResult&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.thanks, thanks) || other.thanks == thanks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,verificationId,incidentId,thanks);
}

@override
String toString() {
    return 'VerificationResult(verificationId: $verificationId, incidentId: $incidentId, thanks: $thanks)';
}


}

/// @nodoc
abstract mixin class _$VerificationResultCopyWith<$Res> implements $VerificationResultCopyWith<$Res> {
  factory _$VerificationResultCopyWith(_VerificationResult value, $Res Function(_VerificationResult) _then) = __$VerificationResultCopyWithImpl;
@override @useResult
$Res call({
 String verificationId, String incidentId, String thanks
});




}
/// @nodoc
class __$VerificationResultCopyWithImpl<$Res>
    implements _$VerificationResultCopyWith<$Res> {
  __$VerificationResultCopyWithImpl(this._self, this._then);

  final _VerificationResult _self;
  final $Res Function(_VerificationResult) _then;

/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? incidentId = null,Object? thanks = null,}) {
  return _then(_VerificationResult(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,thanks: null == thanks ? _self.thanks : thanks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
