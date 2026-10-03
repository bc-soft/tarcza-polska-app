// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateReportRequest {

 ReportType get type; double get lat; double get lng; String? get description;
/// Create a copy of CreateReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateReportRequestCopyWith<CreateReportRequest> get copyWith => _$CreateReportRequestCopyWithImpl<CreateReportRequest>(this as CreateReportRequest, _$identity);

  /// Serializes this CreateReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CreateReportRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateReportRequest&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.description, _this.description) || other.description == _this.description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CreateReportRequest;
  return Object.hash(runtimeType,_this.type,_this.lat,_this.lng,_this.description);
}

@override
String toString() {
  final _this = this as CreateReportRequest;
  return 'CreateReportRequest(type: ${_this.type}, lat: ${_this.lat}, lng: ${_this.lng}, description: ${_this.description})';
}


}

/// @nodoc
abstract mixin class $CreateReportRequestCopyWith<$Res>  {
  factory $CreateReportRequestCopyWith(CreateReportRequest value, $Res Function(CreateReportRequest) _then) = _$CreateReportRequestCopyWithImpl;
@useResult
$Res call({
 ReportType type, double lat, double lng, String? description
});




}
/// @nodoc
class _$CreateReportRequestCopyWithImpl<$Res>
    implements $CreateReportRequestCopyWith<$Res> {
  _$CreateReportRequestCopyWithImpl(this._self, this._then);

  final CreateReportRequest _self;
  final $Res Function(CreateReportRequest) _then;

/// Create a copy of CreateReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? lat = null,Object? lng = null,Object? description = freezed,}) {
  return _then(CreateReportRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateReportRequest].
extension CreateReportRequestPatterns on CreateReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReportType type,  double lat,  double lng,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateReportRequest() when $default != null:
return $default(_that.type,_that.lat,_that.lng,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReportType type,  double lat,  double lng,  String? description)  $default,) {final _that = this;
switch (_that) {
case _CreateReportRequest():
return $default(_that.type,_that.lat,_that.lng,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReportType type,  double lat,  double lng,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _CreateReportRequest() when $default != null:
return $default(_that.type,_that.lat,_that.lng,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateReportRequest implements CreateReportRequest {
  const _CreateReportRequest({required this.type, required this.lat, required this.lng, required this.description});
  factory _CreateReportRequest.fromJson(Map<String, dynamic> json) => _$CreateReportRequestFromJson(json);

@override final  ReportType type;
@override final  double lat;
@override final  double lng;
@override final  String? description;

/// Create a copy of CreateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateReportRequestCopyWith<_CreateReportRequest> get copyWith => __$CreateReportRequestCopyWithImpl<_CreateReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateReportRequest&&(identical(other.type, type) || other.type == type)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,lat,lng,description);
}

@override
String toString() {
    return 'CreateReportRequest(type: $type, lat: $lat, lng: $lng, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CreateReportRequestCopyWith<$Res> implements $CreateReportRequestCopyWith<$Res> {
  factory _$CreateReportRequestCopyWith(_CreateReportRequest value, $Res Function(_CreateReportRequest) _then) = __$CreateReportRequestCopyWithImpl;
@override @useResult
$Res call({
 ReportType type, double lat, double lng, String? description
});




}
/// @nodoc
class __$CreateReportRequestCopyWithImpl<$Res>
    implements _$CreateReportRequestCopyWith<$Res> {
  __$CreateReportRequestCopyWithImpl(this._self, this._then);

  final _CreateReportRequest _self;
  final $Res Function(_CreateReportRequest) _then;

/// Create a copy of CreateReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? lat = null,Object? lng = null,Object? description = freezed,}) {
  return _then(_CreateReportRequest(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
