// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_accepted.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoAccepted {

 String get photoId; String get reportId; PhotoAcceptedStatus get status;/// After server-side resize (longest edge <= 1600 px)
 int get width; int get height;/// Size of the stored JPEG
 int get bytes; DateTime get createdAt;
/// Create a copy of PhotoAccepted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoAcceptedCopyWith<PhotoAccepted> get copyWith => _$PhotoAcceptedCopyWithImpl<PhotoAccepted>(this as PhotoAccepted, _$identity);

  /// Serializes this PhotoAccepted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PhotoAccepted;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoAccepted&&(identical(other.photoId, _this.photoId) || other.photoId == _this.photoId)&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height)&&(identical(other.bytes, _this.bytes) || other.bytes == _this.bytes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PhotoAccepted;
  return Object.hash(runtimeType,_this.photoId,_this.reportId,_this.status,_this.width,_this.height,_this.bytes,_this.createdAt);
}

@override
String toString() {
  final _this = this as PhotoAccepted;
  return 'PhotoAccepted(photoId: ${_this.photoId}, reportId: ${_this.reportId}, status: ${_this.status}, width: ${_this.width}, height: ${_this.height}, bytes: ${_this.bytes}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $PhotoAcceptedCopyWith<$Res>  {
  factory $PhotoAcceptedCopyWith(PhotoAccepted value, $Res Function(PhotoAccepted) _then) = _$PhotoAcceptedCopyWithImpl;
@useResult
$Res call({
 String photoId, String reportId, PhotoAcceptedStatus status, int width, int height, int bytes, DateTime createdAt
});




}
/// @nodoc
class _$PhotoAcceptedCopyWithImpl<$Res>
    implements $PhotoAcceptedCopyWith<$Res> {
  _$PhotoAcceptedCopyWithImpl(this._self, this._then);

  final PhotoAccepted _self;
  final $Res Function(PhotoAccepted) _then;

/// Create a copy of PhotoAccepted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photoId = null,Object? reportId = null,Object? status = null,Object? width = null,Object? height = null,Object? bytes = null,Object? createdAt = null,}) {
  return _then(PhotoAccepted(
photoId: null == photoId ? _self.photoId : photoId // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoAcceptedStatus,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PhotoAccepted].
extension PhotoAcceptedPatterns on PhotoAccepted {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhotoAccepted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhotoAccepted() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhotoAccepted value)  $default,){
final _that = this;
switch (_that) {
case _PhotoAccepted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhotoAccepted value)?  $default,){
final _that = this;
switch (_that) {
case _PhotoAccepted() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String photoId,  String reportId,  PhotoAcceptedStatus status,  int width,  int height,  int bytes,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhotoAccepted() when $default != null:
return $default(_that.photoId,_that.reportId,_that.status,_that.width,_that.height,_that.bytes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String photoId,  String reportId,  PhotoAcceptedStatus status,  int width,  int height,  int bytes,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _PhotoAccepted():
return $default(_that.photoId,_that.reportId,_that.status,_that.width,_that.height,_that.bytes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String photoId,  String reportId,  PhotoAcceptedStatus status,  int width,  int height,  int bytes,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PhotoAccepted() when $default != null:
return $default(_that.photoId,_that.reportId,_that.status,_that.width,_that.height,_that.bytes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhotoAccepted implements PhotoAccepted {
  const _PhotoAccepted({required this.photoId, required this.reportId, required this.status, required this.width, required this.height, required this.bytes, required this.createdAt});
  factory _PhotoAccepted.fromJson(Map<String, dynamic> json) => _$PhotoAcceptedFromJson(json);

@override final  String photoId;
@override final  String reportId;
@override final  PhotoAcceptedStatus status;
/// After server-side resize (longest edge <= 1600 px)
@override final  int width;
@override final  int height;
/// Size of the stored JPEG
@override final  int bytes;
@override final  DateTime createdAt;

/// Create a copy of PhotoAccepted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoAcceptedCopyWith<_PhotoAccepted> get copyWith => __$PhotoAcceptedCopyWithImpl<_PhotoAccepted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoAcceptedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoAccepted&&(identical(other.photoId, photoId) || other.photoId == photoId)&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.status, status) || other.status == status)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.bytes, bytes) || other.bytes == bytes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,photoId,reportId,status,width,height,bytes,createdAt);
}

@override
String toString() {
    return 'PhotoAccepted(photoId: $photoId, reportId: $reportId, status: $status, width: $width, height: $height, bytes: $bytes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PhotoAcceptedCopyWith<$Res> implements $PhotoAcceptedCopyWith<$Res> {
  factory _$PhotoAcceptedCopyWith(_PhotoAccepted value, $Res Function(_PhotoAccepted) _then) = __$PhotoAcceptedCopyWithImpl;
@override @useResult
$Res call({
 String photoId, String reportId, PhotoAcceptedStatus status, int width, int height, int bytes, DateTime createdAt
});




}
/// @nodoc
class __$PhotoAcceptedCopyWithImpl<$Res>
    implements _$PhotoAcceptedCopyWith<$Res> {
  __$PhotoAcceptedCopyWithImpl(this._self, this._then);

  final _PhotoAccepted _self;
  final $Res Function(_PhotoAccepted) _then;

/// Create a copy of PhotoAccepted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photoId = null,Object? reportId = null,Object? status = null,Object? width = null,Object? height = null,Object? bytes = null,Object? createdAt = null,}) {
  return _then(_PhotoAccepted(
photoId: null == photoId ? _self.photoId : photoId // ignore: cast_nullable_to_non_nullable
as String,reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PhotoAcceptedStatus,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
