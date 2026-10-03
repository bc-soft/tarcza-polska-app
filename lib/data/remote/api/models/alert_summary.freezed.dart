// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertSummary {

 String get id; String get title; String get body; AlertSeverity get severity; DateTime get createdAt; DateTime get expiresAt; bool get active; String? get incidentId;
/// Create a copy of AlertSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertSummaryCopyWith<AlertSummary> get copyWith => _$AlertSummaryCopyWithImpl<AlertSummary>(this as AlertSummary, _$identity);

  /// Serializes this AlertSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AlertSummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertSummary&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AlertSummary;
  return Object.hash(runtimeType,_this.id,_this.title,_this.body,_this.severity,_this.createdAt,_this.expiresAt,_this.active,_this.incidentId);
}

@override
String toString() {
  final _this = this as AlertSummary;
  return 'AlertSummary(id: ${_this.id}, title: ${_this.title}, body: ${_this.body}, severity: ${_this.severity}, createdAt: ${_this.createdAt}, expiresAt: ${_this.expiresAt}, active: ${_this.active}, incidentId: ${_this.incidentId})';
}


}

/// @nodoc
abstract mixin class $AlertSummaryCopyWith<$Res>  {
  factory $AlertSummaryCopyWith(AlertSummary value, $Res Function(AlertSummary) _then) = _$AlertSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, String? incidentId
});




}
/// @nodoc
class _$AlertSummaryCopyWithImpl<$Res>
    implements $AlertSummaryCopyWith<$Res> {
  _$AlertSummaryCopyWithImpl(this._self, this._then);

  final AlertSummary _self;
  final $Res Function(AlertSummary) _then;

/// Create a copy of AlertSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? incidentId = freezed,}) {
  return _then(AlertSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertSummary].
extension AlertSummaryPatterns on AlertSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertSummary value)  $default,){
final _that = this;
switch (_that) {
case _AlertSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AlertSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  String? incidentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertSummary() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.incidentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  String? incidentId)  $default,) {final _that = this;
switch (_that) {
case _AlertSummary():
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.incidentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  AlertSeverity severity,  DateTime createdAt,  DateTime expiresAt,  bool active,  String? incidentId)?  $default,) {final _that = this;
switch (_that) {
case _AlertSummary() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.createdAt,_that.expiresAt,_that.active,_that.incidentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertSummary implements AlertSummary {
  const _AlertSummary({required this.id, required this.title, required this.body, required this.severity, required this.createdAt, required this.expiresAt, required this.active, this.incidentId});
  factory _AlertSummary.fromJson(Map<String, dynamic> json) => _$AlertSummaryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String body;
@override final  AlertSeverity severity;
@override final  DateTime createdAt;
@override final  DateTime expiresAt;
@override final  bool active;
@override final  String? incidentId;

/// Create a copy of AlertSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertSummaryCopyWith<_AlertSummary> get copyWith => __$AlertSummaryCopyWithImpl<_AlertSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,body,severity,createdAt,expiresAt,active,incidentId);
}

@override
String toString() {
    return 'AlertSummary(id: $id, title: $title, body: $body, severity: $severity, createdAt: $createdAt, expiresAt: $expiresAt, active: $active, incidentId: $incidentId)';
}


}

/// @nodoc
abstract mixin class _$AlertSummaryCopyWith<$Res> implements $AlertSummaryCopyWith<$Res> {
  factory _$AlertSummaryCopyWith(_AlertSummary value, $Res Function(_AlertSummary) _then) = __$AlertSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, DateTime createdAt, DateTime expiresAt, bool active, String? incidentId
});




}
/// @nodoc
class __$AlertSummaryCopyWithImpl<$Res>
    implements _$AlertSummaryCopyWith<$Res> {
  __$AlertSummaryCopyWithImpl(this._self, this._then);

  final _AlertSummary _self;
  final $Res Function(_AlertSummary) _then;

/// Create a copy of AlertSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? createdAt = null,Object? expiresAt = null,Object? active = null,Object? incidentId = freezed,}) {
  return _then(_AlertSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
