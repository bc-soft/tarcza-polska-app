// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_status_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportStatusView {

 String get reportId; ReportType get type; String get typeLabel; DateTime get createdAt;/// null until clustering (asynchronous, usually within seconds) attached the report to an incident
 ReportIncidentRef? get incident;
/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportStatusViewCopyWith<ReportStatusView> get copyWith => _$ReportStatusViewCopyWithImpl<ReportStatusView>(this as ReportStatusView, _$identity);

  /// Serializes this ReportStatusView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportStatusView;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportStatusView&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.incident, _this.incident) || other.incident == _this.incident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportStatusView;
  return Object.hash(runtimeType,_this.reportId,_this.type,_this.typeLabel,_this.createdAt,_this.incident);
}

@override
String toString() {
  final _this = this as ReportStatusView;
  return 'ReportStatusView(reportId: ${_this.reportId}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, createdAt: ${_this.createdAt}, incident: ${_this.incident})';
}


}

/// @nodoc
abstract mixin class $ReportStatusViewCopyWith<$Res>  {
  factory $ReportStatusViewCopyWith(ReportStatusView value, $Res Function(ReportStatusView) _then) = _$ReportStatusViewCopyWithImpl;
@useResult
$Res call({
 String reportId, ReportType type, String typeLabel, DateTime createdAt, ReportIncidentRef? incident
});


$ReportIncidentRefCopyWith<$Res>? get incident;

}
/// @nodoc
class _$ReportStatusViewCopyWithImpl<$Res>
    implements $ReportStatusViewCopyWith<$Res> {
  _$ReportStatusViewCopyWithImpl(this._self, this._then);

  final ReportStatusView _self;
  final $Res Function(ReportStatusView) _then;

/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportId = null,Object? type = null,Object? typeLabel = null,Object? createdAt = null,Object? incident = freezed,}) {
  return _then(ReportStatusView(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as ReportIncidentRef?,
  ));
}
/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportIncidentRefCopyWith<$Res>? get incident {
    if (_self.incident == null) {
    return null;
  }

  return $ReportIncidentRefCopyWith<$Res>(_self.incident!, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReportStatusView].
extension ReportStatusViewPatterns on ReportStatusView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportStatusView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportStatusView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportStatusView value)  $default,){
final _that = this;
switch (_that) {
case _ReportStatusView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportStatusView value)?  $default,){
final _that = this;
switch (_that) {
case _ReportStatusView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reportId,  ReportType type,  String typeLabel,  DateTime createdAt,  ReportIncidentRef? incident)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportStatusView() when $default != null:
return $default(_that.reportId,_that.type,_that.typeLabel,_that.createdAt,_that.incident);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reportId,  ReportType type,  String typeLabel,  DateTime createdAt,  ReportIncidentRef? incident)  $default,) {final _that = this;
switch (_that) {
case _ReportStatusView():
return $default(_that.reportId,_that.type,_that.typeLabel,_that.createdAt,_that.incident);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reportId,  ReportType type,  String typeLabel,  DateTime createdAt,  ReportIncidentRef? incident)?  $default,) {final _that = this;
switch (_that) {
case _ReportStatusView() when $default != null:
return $default(_that.reportId,_that.type,_that.typeLabel,_that.createdAt,_that.incident);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportStatusView implements ReportStatusView {
  const _ReportStatusView({required this.reportId, required this.type, required this.typeLabel, required this.createdAt, required this.incident});
  factory _ReportStatusView.fromJson(Map<String, dynamic> json) => _$ReportStatusViewFromJson(json);

@override final  String reportId;
@override final  ReportType type;
@override final  String typeLabel;
@override final  DateTime createdAt;
/// null until clustering (asynchronous, usually within seconds) attached the report to an incident
@override final  ReportIncidentRef? incident;

/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportStatusViewCopyWith<_ReportStatusView> get copyWith => __$ReportStatusViewCopyWithImpl<_ReportStatusView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportStatusViewToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportStatusView&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.incident, incident) || other.incident == incident));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reportId,type,typeLabel,createdAt,incident);
}

@override
String toString() {
    return 'ReportStatusView(reportId: $reportId, type: $type, typeLabel: $typeLabel, createdAt: $createdAt, incident: $incident)';
}


}

/// @nodoc
abstract mixin class _$ReportStatusViewCopyWith<$Res> implements $ReportStatusViewCopyWith<$Res> {
  factory _$ReportStatusViewCopyWith(_ReportStatusView value, $Res Function(_ReportStatusView) _then) = __$ReportStatusViewCopyWithImpl;
@override @useResult
$Res call({
 String reportId, ReportType type, String typeLabel, DateTime createdAt, ReportIncidentRef? incident
});


@override $ReportIncidentRefCopyWith<$Res>? get incident;

}
/// @nodoc
class __$ReportStatusViewCopyWithImpl<$Res>
    implements _$ReportStatusViewCopyWith<$Res> {
  __$ReportStatusViewCopyWithImpl(this._self, this._then);

  final _ReportStatusView _self;
  final $Res Function(_ReportStatusView) _then;

/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportId = null,Object? type = null,Object? typeLabel = null,Object? createdAt = null,Object? incident = freezed,}) {
  return _then(_ReportStatusView(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as ReportIncidentRef?,
  ));
}

/// Create a copy of ReportStatusView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReportIncidentRefCopyWith<$Res>? get incident {
    if (_self.incident == null) {
    return null;
  }

  return $ReportIncidentRefCopyWith<$Res>(_self.incident!, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}

// dart format on
