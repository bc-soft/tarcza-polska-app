// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_incident_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportIncidentRef {

 String get id; ReportType get type; String get typeLabel; IncidentStatus get status; String get statusLabel; ConfidenceLevel get confidenceLevel; String get confidenceLabel; double get confidenceScore;
/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportIncidentRefCopyWith<ReportIncidentRef> get copyWith => _$ReportIncidentRefCopyWithImpl<ReportIncidentRef>(this as ReportIncidentRef, _$identity);

  /// Serializes this ReportIncidentRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportIncidentRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportIncidentRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.confidenceLevel, _this.confidenceLevel) || other.confidenceLevel == _this.confidenceLevel)&&(identical(other.confidenceLabel, _this.confidenceLabel) || other.confidenceLabel == _this.confidenceLabel)&&(identical(other.confidenceScore, _this.confidenceScore) || other.confidenceScore == _this.confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportIncidentRef;
  return Object.hash(runtimeType,_this.id,_this.type,_this.typeLabel,_this.status,_this.statusLabel,_this.confidenceLevel,_this.confidenceLabel,_this.confidenceScore);
}

@override
String toString() {
  final _this = this as ReportIncidentRef;
  return 'ReportIncidentRef(id: ${_this.id}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, confidenceLevel: ${_this.confidenceLevel}, confidenceLabel: ${_this.confidenceLabel}, confidenceScore: ${_this.confidenceScore})';
}


}

/// @nodoc
abstract mixin class $ReportIncidentRefCopyWith<$Res>  {
  factory $ReportIncidentRefCopyWith(ReportIncidentRef value, $Res Function(ReportIncidentRef) _then) = _$ReportIncidentRefCopyWithImpl;
@useResult
$Res call({
 String id, ReportType type, String typeLabel, IncidentStatus status, String statusLabel, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore
});




}
/// @nodoc
class _$ReportIncidentRefCopyWithImpl<$Res>
    implements $ReportIncidentRefCopyWith<$Res> {
  _$ReportIncidentRefCopyWithImpl(this._self, this._then);

  final ReportIncidentRef _self;
  final $Res Function(ReportIncidentRef) _then;

/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? statusLabel = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,}) {
  return _then(ReportIncidentRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceLabel: null == confidenceLabel ? _self.confidenceLabel : confidenceLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportIncidentRef].
extension ReportIncidentRefPatterns on ReportIncidentRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportIncidentRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportIncidentRef value)  $default,){
final _that = this;
switch (_that) {
case _ReportIncidentRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportIncidentRef value)?  $default,){
final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentRef():
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ReportType type,  String typeLabel,  IncidentStatus status,  String statusLabel,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.statusLabel,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportIncidentRef implements ReportIncidentRef {
  const _ReportIncidentRef({required this.id, required this.type, required this.typeLabel, required this.status, required this.statusLabel, required this.confidenceLevel, required this.confidenceLabel, required this.confidenceScore});
  factory _ReportIncidentRef.fromJson(Map<String, dynamic> json) => _$ReportIncidentRefFromJson(json);

@override final  String id;
@override final  ReportType type;
@override final  String typeLabel;
@override final  IncidentStatus status;
@override final  String statusLabel;
@override final  ConfidenceLevel confidenceLevel;
@override final  String confidenceLabel;
@override final  double confidenceScore;

/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportIncidentRefCopyWith<_ReportIncidentRef> get copyWith => __$ReportIncidentRefCopyWithImpl<_ReportIncidentRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportIncidentRefToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportIncidentRef&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.confidenceLevel, confidenceLevel) || other.confidenceLevel == confidenceLevel)&&(identical(other.confidenceLabel, confidenceLabel) || other.confidenceLabel == confidenceLabel)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,typeLabel,status,statusLabel,confidenceLevel,confidenceLabel,confidenceScore);
}

@override
String toString() {
    return 'ReportIncidentRef(id: $id, type: $type, typeLabel: $typeLabel, status: $status, statusLabel: $statusLabel, confidenceLevel: $confidenceLevel, confidenceLabel: $confidenceLabel, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$ReportIncidentRefCopyWith<$Res> implements $ReportIncidentRefCopyWith<$Res> {
  factory _$ReportIncidentRefCopyWith(_ReportIncidentRef value, $Res Function(_ReportIncidentRef) _then) = __$ReportIncidentRefCopyWithImpl;
@override @useResult
$Res call({
 String id, ReportType type, String typeLabel, IncidentStatus status, String statusLabel, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore
});




}
/// @nodoc
class __$ReportIncidentRefCopyWithImpl<$Res>
    implements _$ReportIncidentRefCopyWith<$Res> {
  __$ReportIncidentRefCopyWithImpl(this._self, this._then);

  final _ReportIncidentRef _self;
  final $Res Function(_ReportIncidentRef) _then;

/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? statusLabel = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,}) {
  return _then(_ReportIncidentRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceLabel: null == confidenceLabel ? _self.confidenceLabel : confidenceLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
