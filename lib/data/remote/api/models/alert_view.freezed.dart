// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertView {

 String get id; String get title; String get body; AlertSeverity get severity; DateTime get createdAt; DateTime get expiresAt; bool get active;/// Only in GET /alerts/{id}
 GeoJsonGeometry get area; String? get incidentId;
/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertViewCopyWith<AlertView> get copyWith => _$AlertViewCopyWithImpl<AlertView>(this as AlertView, _$identity);

  /// Serializes this AlertView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AlertView;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertView&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AlertView;
  return Object.hash(runtimeType,_this.id,_this.title,_this.body,_this.severity,_this.createdAt,_this.expiresAt,_this.active,_this.area,_this.incidentId);
}

@override
String toString() {
  final _this = this as AlertView;
  return 'AlertView(id: ${_this.id}, title: ${_this.title}, body: ${_this.body}, severity: ${_this.severity}, createdAt: ${_this.createdAt}, expiresAt: ${_this.expiresAt}, active: ${_this.active}, area: ${_this.area}, incidentId: ${_this.incidentId})';
}


}

/// @nodoc
abstract mixin class $AlertViewCopyWith<$Res>  {
  factory $AlertViewCopyWith(AlertView value, $Res Function(AlertView) _then) = _$AlertViewCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, GeoJsonGeometry area, String? incidentId
});


$GeoJsonGeometryCopyWith<$Res> get area;

}
/// @nodoc
class _$AlertViewCopyWithImpl<$Res>
    implements $AlertViewCopyWith<$Res> {
  _$AlertViewCopyWithImpl(this._self, this._then);

  final AlertView _self;
  final $Res Function(AlertView) _then;

/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? area = null,Object? incidentId = freezed,}) {
  return _then(AlertView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get area {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.area, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}


/// Adds pattern-matching-related methods to [AlertView].
extension AlertViewPatterns on AlertView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertView value)  $default,){
final _that = this;
switch (_that) {
case _AlertView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertView value)?  $default,){
final _that = this;
switch (_that) {
case _AlertView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  GeoJsonGeometry area,  String? incidentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertView() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.area,_that.incidentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  GeoJsonGeometry area,  String? incidentId)  $default,) {final _that = this;
switch (_that) {
case _AlertView():
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.area,_that.incidentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  GeoJsonGeometry area,  String? incidentId)?  $default,) {final _that = this;
switch (_that) {
case _AlertView() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.area,_that.incidentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertView implements AlertView {
  const _AlertView({required this.id, required this.title, required this.body, required this.severity, required this.createdAt, required this.expiresAt, required this.active, required this.area, this.incidentId});
  factory _AlertView.fromJson(Map<String, dynamic> json) => _$AlertViewFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override final  AlertSeverity severity;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  bool active;
/// Only in GET /alerts/{id}
@override final  GeoJsonGeometry area;
@override final  String? incidentId;

/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertViewCopyWith<_AlertView> get copyWith => __$AlertViewCopyWithImpl<_AlertView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertViewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertView&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.area, area) || other.area == area)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,body,severity,createdAt,expiresAt,active,area,incidentId);
}

@override
String toString() {
    return 'AlertView(id: $id, title: $title, body: $body, severity: $severity, createdAt: $createdAt, expiresAt: $expiresAt, active: $active, area: $area, incidentId: $incidentId)';
}


}

/// @nodoc
abstract mixin class _$AlertViewCopyWith<$Res> implements $AlertViewCopyWith<$Res> {
  factory _$AlertViewCopyWith(_AlertView value, $Res Function(_AlertView) _then) = __$AlertViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, GeoJsonGeometry area, String? incidentId
});


@override $GeoJsonGeometryCopyWith<$Res> get area;

}
/// @nodoc
class __$AlertViewCopyWithImpl<$Res>
    implements _$AlertViewCopyWith<$Res> {
  __$AlertViewCopyWithImpl(this._self, this._then);

  final _AlertView _self;
  final $Res Function(_AlertView) _then;

/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? area = null,Object? incidentId = freezed,}) {
  return _then(_AlertView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AlertView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get area {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.area, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}

// dart format on
