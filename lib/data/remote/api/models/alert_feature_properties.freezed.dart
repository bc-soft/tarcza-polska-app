// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_feature_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertFeatureProperties {

 String get id; String get title; String get body; AlertSeverity get severity; DateTime get createdAt; DateTime get expiresAt; bool get active; AlertFeaturePropertiesKind get kind; String? get incidentId;
/// Create a copy of AlertFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertFeaturePropertiesCopyWith<AlertFeatureProperties> get copyWith => _$AlertFeaturePropertiesCopyWithImpl<AlertFeatureProperties>(this as AlertFeatureProperties, _$identity);

  /// Serializes this AlertFeatureProperties to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AlertFeatureProperties;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertFeatureProperties&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AlertFeatureProperties;
  return Object.hash(runtimeType,_this.id,_this.title,_this.body,_this.severity,_this.createdAt,_this.expiresAt,_this.active,_this.kind,_this.incidentId);
}

@override
String toString() {
  final _this = this as AlertFeatureProperties;
  return 'AlertFeatureProperties(id: ${_this.id}, title: ${_this.title}, body: ${_this.body}, severity: ${_this.severity}, createdAt: ${_this.createdAt}, expiresAt: ${_this.expiresAt}, active: ${_this.active}, kind: ${_this.kind}, incidentId: ${_this.incidentId})';
}


}

/// @nodoc
abstract mixin class $AlertFeaturePropertiesCopyWith<$Res>  {
  factory $AlertFeaturePropertiesCopyWith(AlertFeatureProperties value, $Res Function(AlertFeatureProperties) _then) = _$AlertFeaturePropertiesCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, AlertFeaturePropertiesKind kind, String? incidentId
});




}
/// @nodoc
class _$AlertFeaturePropertiesCopyWithImpl<$Res>
    implements $AlertFeaturePropertiesCopyWith<$Res> {
  _$AlertFeaturePropertiesCopyWithImpl(this._self, this._then);

  final AlertFeatureProperties _self;
  final $Res Function(AlertFeatureProperties) _then;

/// Create a copy of AlertFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? kind = null,Object? incidentId = freezed,}) {
  return _then(AlertFeatureProperties(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AlertFeaturePropertiesKind,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertFeatureProperties].
extension AlertFeaturePropertiesPatterns on AlertFeatureProperties {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertFeatureProperties value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertFeatureProperties() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertFeatureProperties value)  $default,){
final _that = this;
switch (_that) {
case _AlertFeatureProperties():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertFeatureProperties value)?  $default,){
final _that = this;
switch (_that) {
case _AlertFeatureProperties() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertFeatureProperties() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)  $default,) {final _that = this;
switch (_that) {
case _AlertFeatureProperties():
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  AlertFeaturePropertiesKind kind,  String? incidentId)?  $default,) {final _that = this;
switch (_that) {
case _AlertFeatureProperties() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.kind,_that.incidentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertFeatureProperties implements AlertFeatureProperties {
  const _AlertFeatureProperties({required this.id, required this.title, required this.body, required this.severity, required this.createdAt, required this.expiresAt, required this.active, required this.kind, this.incidentId});
  factory _AlertFeatureProperties.fromJson(Map<String, dynamic> json) => _$AlertFeaturePropertiesFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override final  AlertSeverity severity;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  bool active;
@override final  AlertFeaturePropertiesKind kind;
@override final  String? incidentId;

/// Create a copy of AlertFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertFeaturePropertiesCopyWith<_AlertFeatureProperties> get copyWith => __$AlertFeaturePropertiesCopyWithImpl<_AlertFeatureProperties>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertFeaturePropertiesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertFeatureProperties&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,body,severity,createdAt,expiresAt,active,kind,incidentId);
}

@override
String toString() {
    return 'AlertFeatureProperties(id: $id, title: $title, body: $body, severity: $severity, createdAt: $createdAt, expiresAt: $expiresAt, active: $active, kind: $kind, incidentId: $incidentId)';
}


}

/// @nodoc
abstract mixin class _$AlertFeaturePropertiesCopyWith<$Res> implements $AlertFeaturePropertiesCopyWith<$Res> {
  factory _$AlertFeaturePropertiesCopyWith(_AlertFeatureProperties value, $Res Function(_AlertFeatureProperties) _then) = __$AlertFeaturePropertiesCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, AlertFeaturePropertiesKind kind, String? incidentId
});




}
/// @nodoc
class __$AlertFeaturePropertiesCopyWithImpl<$Res>
    implements _$AlertFeaturePropertiesCopyWith<$Res> {
  __$AlertFeaturePropertiesCopyWithImpl(this._self, this._then);

  final _AlertFeatureProperties _self;
  final $Res Function(_AlertFeatureProperties) _then;

/// Create a copy of AlertFeatureProperties
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? kind = null,Object? incidentId = freezed,}) {
  return _then(_AlertFeatureProperties(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AlertFeaturePropertiesKind,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
