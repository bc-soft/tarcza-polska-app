// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_shelter_status_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConfirmShelterStatusRequest {

 ShelterStatus get status; String? get comment; ShelterOccupancy2? get occupancy;
/// Create a copy of ConfirmShelterStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmShelterStatusRequestCopyWith<ConfirmShelterStatusRequest> get copyWith => _$ConfirmShelterStatusRequestCopyWithImpl<ConfirmShelterStatusRequest>(this as ConfirmShelterStatusRequest, _$identity);

  /// Serializes this ConfirmShelterStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConfirmShelterStatusRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmShelterStatusRequest&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.comment, _this.comment) || other.comment == _this.comment)&&(identical(other.occupancy, _this.occupancy) || other.occupancy == _this.occupancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConfirmShelterStatusRequest;
  return Object.hash(runtimeType,_this.status,_this.comment,_this.occupancy);
}

@override
String toString() {
  final _this = this as ConfirmShelterStatusRequest;
  return 'ConfirmShelterStatusRequest(status: ${_this.status}, comment: ${_this.comment}, occupancy: ${_this.occupancy})';
}


}

/// @nodoc
abstract mixin class $ConfirmShelterStatusRequestCopyWith<$Res>  {
  factory $ConfirmShelterStatusRequestCopyWith(ConfirmShelterStatusRequest value, $Res Function(ConfirmShelterStatusRequest) _then) = _$ConfirmShelterStatusRequestCopyWithImpl;
@useResult
$Res call({
 ShelterStatus status, String? comment, ShelterOccupancy2? occupancy
});




}
/// @nodoc
class _$ConfirmShelterStatusRequestCopyWithImpl<$Res>
    implements $ConfirmShelterStatusRequestCopyWith<$Res> {
  _$ConfirmShelterStatusRequestCopyWithImpl(this._self, this._then);

  final ConfirmShelterStatusRequest _self;
  final $Res Function(ConfirmShelterStatusRequest) _then;

/// Create a copy of ConfirmShelterStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? comment = freezed,Object? occupancy = freezed,}) {
  return _then(ConfirmShelterStatusRequest(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,occupancy: freezed == occupancy ? _self.occupancy : occupancy // ignore: cast_nullable_to_non_nullable
as ShelterOccupancy2?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmShelterStatusRequest].
extension ConfirmShelterStatusRequestPatterns on ConfirmShelterStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmShelterStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmShelterStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmShelterStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ShelterStatus status,  String? comment,  ShelterOccupancy2? occupancy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest() when $default != null:
return $default(_that.status,_that.comment,_that.occupancy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ShelterStatus status,  String? comment,  ShelterOccupancy2? occupancy)  $default,) {final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest():
return $default(_that.status,_that.comment,_that.occupancy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ShelterStatus status,  String? comment,  ShelterOccupancy2? occupancy)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmShelterStatusRequest() when $default != null:
return $default(_that.status,_that.comment,_that.occupancy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmShelterStatusRequest implements ConfirmShelterStatusRequest {
  const _ConfirmShelterStatusRequest({required this.status, required this.comment, required this.occupancy});
  factory _ConfirmShelterStatusRequest.fromJson(Map<String, dynamic> json) => _$ConfirmShelterStatusRequestFromJson(json);

@override final  ShelterStatus status;
@override final  String? comment;
@override final  ShelterOccupancy2? occupancy;

/// Create a copy of ConfirmShelterStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmShelterStatusRequestCopyWith<_ConfirmShelterStatusRequest> get copyWith => __$ConfirmShelterStatusRequestCopyWithImpl<_ConfirmShelterStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmShelterStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmShelterStatusRequest&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.occupancy, occupancy) || other.occupancy == occupancy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,comment,occupancy);
}

@override
String toString() {
    return 'ConfirmShelterStatusRequest(status: $status, comment: $comment, occupancy: $occupancy)';
}


}

/// @nodoc
abstract mixin class _$ConfirmShelterStatusRequestCopyWith<$Res> implements $ConfirmShelterStatusRequestCopyWith<$Res> {
  factory _$ConfirmShelterStatusRequestCopyWith(_ConfirmShelterStatusRequest value, $Res Function(_ConfirmShelterStatusRequest) _then) = __$ConfirmShelterStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 ShelterStatus status, String? comment, ShelterOccupancy2? occupancy
});




}
/// @nodoc
class __$ConfirmShelterStatusRequestCopyWithImpl<$Res>
    implements _$ConfirmShelterStatusRequestCopyWith<$Res> {
  __$ConfirmShelterStatusRequestCopyWithImpl(this._self, this._then);

  final _ConfirmShelterStatusRequest _self;
  final $Res Function(_ConfirmShelterStatusRequest) _then;

/// Create a copy of ConfirmShelterStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? comment = freezed,Object? occupancy = freezed,}) {
  return _then(_ConfirmShelterStatusRequest(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,occupancy: freezed == occupancy ? _self.occupancy : occupancy // ignore: cast_nullable_to_non_nullable
as ShelterOccupancy2?,
  ));
}


}

// dart format on
