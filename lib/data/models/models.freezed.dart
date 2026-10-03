// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Community {

 int get reports; int get answers;/// `null`, gdy nikt jeszcze nie odpowiedział.
 int? get agreementPct;
/// Create a copy of Community
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityCopyWith<Community> get copyWith => _$CommunityCopyWithImpl<Community>(this as Community, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Community;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Community&&(identical(other.reports, _this.reports) || other.reports == _this.reports)&&(identical(other.answers, _this.answers) || other.answers == _this.answers)&&(identical(other.agreementPct, _this.agreementPct) || other.agreementPct == _this.agreementPct));
}


@override
int get hashCode {
  final _this = this as Community;
  return Object.hash(runtimeType,_this.reports,_this.answers,_this.agreementPct);
}

@override
String toString() {
  final _this = this as Community;
  return 'Community(reports: ${_this.reports}, answers: ${_this.answers}, agreementPct: ${_this.agreementPct})';
}


}

/// @nodoc
abstract mixin class $CommunityCopyWith<$Res>  {
  factory $CommunityCopyWith(Community value, $Res Function(Community) _then) = _$CommunityCopyWithImpl;
@useResult
$Res call({
 int reports, int answers, int? agreementPct
});




}
/// @nodoc
class _$CommunityCopyWithImpl<$Res>
    implements $CommunityCopyWith<$Res> {
  _$CommunityCopyWithImpl(this._self, this._then);

  final Community _self;
  final $Res Function(Community) _then;

/// Create a copy of Community
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reports = null,Object? answers = null,Object? agreementPct = freezed,}) {
  return _then(Community(
reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as int,agreementPct: freezed == agreementPct ? _self.agreementPct : agreementPct // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Community].
extension CommunityPatterns on Community {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Community value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Community() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Community value)  $default,){
final _that = this;
switch (_that) {
case _Community():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Community value)?  $default,){
final _that = this;
switch (_that) {
case _Community() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reports,  int answers,  int? agreementPct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Community() when $default != null:
return $default(_that.reports,_that.answers,_that.agreementPct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reports,  int answers,  int? agreementPct)  $default,) {final _that = this;
switch (_that) {
case _Community():
return $default(_that.reports,_that.answers,_that.agreementPct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reports,  int answers,  int? agreementPct)?  $default,) {final _that = this;
switch (_that) {
case _Community() when $default != null:
return $default(_that.reports,_that.answers,_that.agreementPct);case _:
  return null;

}
}

}

/// @nodoc


class _Community implements Community {
  const _Community({this.reports = 0, this.answers = 0, this.agreementPct});
  

@override@JsonKey() final  int reports;
@override@JsonKey() final  int answers;
/// `null`, gdy nikt jeszcze nie odpowiedział.
@override final  int? agreementPct;

/// Create a copy of Community
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityCopyWith<_Community> get copyWith => __$CommunityCopyWithImpl<_Community>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Community&&(identical(other.reports, reports) || other.reports == reports)&&(identical(other.answers, answers) || other.answers == answers)&&(identical(other.agreementPct, agreementPct) || other.agreementPct == agreementPct));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reports,answers,agreementPct);
}

@override
String toString() {
    return 'Community(reports: $reports, answers: $answers, agreementPct: $agreementPct)';
}


}

/// @nodoc
abstract mixin class _$CommunityCopyWith<$Res> implements $CommunityCopyWith<$Res> {
  factory _$CommunityCopyWith(_Community value, $Res Function(_Community) _then) = __$CommunityCopyWithImpl;
@override @useResult
$Res call({
 int reports, int answers, int? agreementPct
});




}
/// @nodoc
class __$CommunityCopyWithImpl<$Res>
    implements _$CommunityCopyWith<$Res> {
  __$CommunityCopyWithImpl(this._self, this._then);

  final _Community _self;
  final $Res Function(_Community) _then;

/// Create a copy of Community
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reports = null,Object? answers = null,Object? agreementPct = freezed,}) {
  return _then(_Community(
reports: null == reports ? _self.reports : reports // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as int,agreementPct: freezed == agreementPct ? _self.agreementPct : agreementPct // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$Incident {

 String get id; IncidentType get type; String get typeLabel; IncidentStatus get status; ConfidenceLevel get confidenceLevel; String get confidenceLabel;/// 0–1, pokazujemy jako procent. Liczone wyłącznie przez backend.
 double get confidenceScore; DateTime get startedAt; DateTime get lastActivityAt; DateTime? get lastConfirmedAt; Community get community; String? get summary; GeoArea get area;
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentCopyWith<Incident> get copyWith => _$IncidentCopyWithImpl<Incident>(this as Incident, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Incident;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Incident&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.confidenceLevel, _this.confidenceLevel) || other.confidenceLevel == _this.confidenceLevel)&&(identical(other.confidenceLabel, _this.confidenceLabel) || other.confidenceLabel == _this.confidenceLabel)&&(identical(other.confidenceScore, _this.confidenceScore) || other.confidenceScore == _this.confidenceScore)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.lastActivityAt, _this.lastActivityAt) || other.lastActivityAt == _this.lastActivityAt)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.community, _this.community) || other.community == _this.community)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.area, _this.area) || other.area == _this.area));
}


@override
int get hashCode {
  final _this = this as Incident;
  return Object.hash(runtimeType,_this.id,_this.type,_this.typeLabel,_this.status,_this.confidenceLevel,_this.confidenceLabel,_this.confidenceScore,_this.startedAt,_this.lastActivityAt,_this.lastConfirmedAt,_this.community,_this.summary,_this.area);
}

@override
String toString() {
  final _this = this as Incident;
  return 'Incident(id: ${_this.id}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, status: ${_this.status}, confidenceLevel: ${_this.confidenceLevel}, confidenceLabel: ${_this.confidenceLabel}, confidenceScore: ${_this.confidenceScore}, startedAt: ${_this.startedAt}, lastActivityAt: ${_this.lastActivityAt}, lastConfirmedAt: ${_this.lastConfirmedAt}, community: ${_this.community}, summary: ${_this.summary}, area: ${_this.area})';
}


}

/// @nodoc
abstract mixin class $IncidentCopyWith<$Res>  {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) _then) = _$IncidentCopyWithImpl;
@useResult
$Res call({
 String id, IncidentType type, String typeLabel, IncidentStatus status, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore, DateTime startedAt, DateTime lastActivityAt, DateTime? lastConfirmedAt, Community community, String? summary, GeoArea area
});


$CommunityCopyWith<$Res> get community;$GeoAreaCopyWith<$Res> get area;

}
/// @nodoc
class _$IncidentCopyWithImpl<$Res>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._self, this._then);

  final Incident _self;
  final $Res Function(Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,Object? startedAt = null,Object? lastActivityAt = null,Object? lastConfirmedAt = freezed,Object? community = null,Object? summary = freezed,Object? area = null,}) {
  return _then(Incident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceLabel: null == confidenceLabel ? _self.confidenceLabel : confidenceLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoArea,
  ));
}
/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoAreaCopyWith<$Res> get area {
  
  return $GeoAreaCopyWith<$Res>(_self.area, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}


/// Adds pattern-matching-related methods to [Incident].
extension IncidentPatterns on Incident {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Incident value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Incident value)  $default,){
final _that = this;
switch (_that) {
case _Incident():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Incident value)?  $default,){
final _that = this;
switch (_that) {
case _Incident() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  IncidentType type,  String typeLabel,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  DateTime? lastConfirmedAt,  Community community,  String? summary,  GeoArea area)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.lastConfirmedAt,_that.community,_that.summary,_that.area);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  IncidentType type,  String typeLabel,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  DateTime? lastConfirmedAt,  Community community,  String? summary,  GeoArea area)  $default,) {final _that = this;
switch (_that) {
case _Incident():
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.lastConfirmedAt,_that.community,_that.summary,_that.area);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  IncidentType type,  String typeLabel,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  String confidenceLabel,  double confidenceScore,  DateTime startedAt,  DateTime lastActivityAt,  DateTime? lastConfirmedAt,  Community community,  String? summary,  GeoArea area)?  $default,) {final _that = this;
switch (_that) {
case _Incident() when $default != null:
return $default(_that.id,_that.type,_that.typeLabel,_that.status,_that.confidenceLevel,_that.confidenceLabel,_that.confidenceScore,_that.startedAt,_that.lastActivityAt,_that.lastConfirmedAt,_that.community,_that.summary,_that.area);case _:
  return null;

}
}

}

/// @nodoc


class _Incident implements Incident {
  const _Incident({required this.id, required this.type, required this.typeLabel, required this.status, required this.confidenceLevel, required this.confidenceLabel, required this.confidenceScore, required this.startedAt, required this.lastActivityAt, this.lastConfirmedAt, required this.community, this.summary, required this.area});
  

@override final  String id;
@override final  IncidentType type;
@override final  String typeLabel;
@override final  IncidentStatus status;
@override final  ConfidenceLevel confidenceLevel;
@override final  String confidenceLabel;
/// 0–1, pokazujemy jako procent. Liczone wyłącznie przez backend.
@override final  double confidenceScore;
@override final  DateTime startedAt;
@override final  DateTime lastActivityAt;
@override final  DateTime? lastConfirmedAt;
@override final  Community community;
@override final  String? summary;
@override final  GeoArea area;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentCopyWith<_Incident> get copyWith => __$IncidentCopyWithImpl<_Incident>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Incident&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.status, status) || other.status == status)&&(identical(other.confidenceLevel, confidenceLevel) || other.confidenceLevel == confidenceLevel)&&(identical(other.confidenceLabel, confidenceLabel) || other.confidenceLabel == confidenceLabel)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.community, community) || other.community == community)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.area, area) || other.area == area));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,type,typeLabel,status,confidenceLevel,confidenceLabel,confidenceScore,startedAt,lastActivityAt,lastConfirmedAt,community,summary,area);
}

@override
String toString() {
    return 'Incident(id: $id, type: $type, typeLabel: $typeLabel, status: $status, confidenceLevel: $confidenceLevel, confidenceLabel: $confidenceLabel, confidenceScore: $confidenceScore, startedAt: $startedAt, lastActivityAt: $lastActivityAt, lastConfirmedAt: $lastConfirmedAt, community: $community, summary: $summary, area: $area)';
}


}

/// @nodoc
abstract mixin class _$IncidentCopyWith<$Res> implements $IncidentCopyWith<$Res> {
  factory _$IncidentCopyWith(_Incident value, $Res Function(_Incident) _then) = __$IncidentCopyWithImpl;
@override @useResult
$Res call({
 String id, IncidentType type, String typeLabel, IncidentStatus status, ConfidenceLevel confidenceLevel, String confidenceLabel, double confidenceScore, DateTime startedAt, DateTime lastActivityAt, DateTime? lastConfirmedAt, Community community, String? summary, GeoArea area
});


@override $CommunityCopyWith<$Res> get community;@override $GeoAreaCopyWith<$Res> get area;

}
/// @nodoc
class __$IncidentCopyWithImpl<$Res>
    implements _$IncidentCopyWith<$Res> {
  __$IncidentCopyWithImpl(this._self, this._then);

  final _Incident _self;
  final $Res Function(_Incident) _then;

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? typeLabel = null,Object? status = null,Object? confidenceLevel = null,Object? confidenceLabel = null,Object? confidenceScore = null,Object? startedAt = null,Object? lastActivityAt = null,Object? lastConfirmedAt = freezed,Object? community = null,Object? summary = freezed,Object? area = null,}) {
  return _then(_Incident(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceLabel: null == confidenceLabel ? _self.confidenceLabel : confidenceLabel // ignore: cast_nullable_to_non_nullable
as String,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastActivityAt: null == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as Community,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,area: null == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoArea,
  ));
}

/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityCopyWith<$Res> get community {
  
  return $CommunityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}/// Create a copy of Incident
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoAreaCopyWith<$Res> get area {
  
  return $GeoAreaCopyWith<$Res>(_self.area, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}

/// @nodoc
mixin _$Shelter {

 String get id; String get name; String get address; LatLng get location; ShelterStatus get status; String get statusLabel; int? get capacity; DateTime? get lastConfirmedAt; int get confirmationCount;/// Tylko w wariancie „najbliższe” (`?lat&lng`).
 double? get distanceMeters;
/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelterCopyWith<Shelter> get copyWith => _$ShelterCopyWithImpl<Shelter>(this as Shelter, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Shelter;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shelter&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.statusLabel, _this.statusLabel) || other.statusLabel == _this.statusLabel)&&(identical(other.capacity, _this.capacity) || other.capacity == _this.capacity)&&(identical(other.lastConfirmedAt, _this.lastConfirmedAt) || other.lastConfirmedAt == _this.lastConfirmedAt)&&(identical(other.confirmationCount, _this.confirmationCount) || other.confirmationCount == _this.confirmationCount)&&(identical(other.distanceMeters, _this.distanceMeters) || other.distanceMeters == _this.distanceMeters));
}


@override
int get hashCode {
  final _this = this as Shelter;
  return Object.hash(runtimeType,_this.id,_this.name,_this.address,_this.location,_this.status,_this.statusLabel,_this.capacity,_this.lastConfirmedAt,_this.confirmationCount,_this.distanceMeters);
}

@override
String toString() {
  final _this = this as Shelter;
  return 'Shelter(id: ${_this.id}, name: ${_this.name}, address: ${_this.address}, location: ${_this.location}, status: ${_this.status}, statusLabel: ${_this.statusLabel}, capacity: ${_this.capacity}, lastConfirmedAt: ${_this.lastConfirmedAt}, confirmationCount: ${_this.confirmationCount}, distanceMeters: ${_this.distanceMeters})';
}


}

/// @nodoc
abstract mixin class $ShelterCopyWith<$Res>  {
  factory $ShelterCopyWith(Shelter value, $Res Function(Shelter) _then) = _$ShelterCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, LatLng location, ShelterStatus status, String statusLabel, int? capacity, DateTime? lastConfirmedAt, int confirmationCount, double? distanceMeters
});




}
/// @nodoc
class _$ShelterCopyWithImpl<$Res>
    implements $ShelterCopyWith<$Res> {
  _$ShelterCopyWithImpl(this._self, this._then);

  final Shelter _self;
  final $Res Function(Shelter) _then;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? location = null,Object? status = null,Object? statusLabel = null,Object? capacity = freezed,Object? lastConfirmedAt = freezed,Object? confirmationCount = null,Object? distanceMeters = freezed,}) {
  return _then(Shelter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Shelter].
extension ShelterPatterns on Shelter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shelter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shelter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shelter value)  $default,){
final _that = this;
switch (_that) {
case _Shelter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shelter value)?  $default,){
final _that = this;
switch (_that) {
case _Shelter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  LatLng location,  ShelterStatus status,  String statusLabel,  int? capacity,  DateTime? lastConfirmedAt,  int confirmationCount,  double? distanceMeters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shelter() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.location,_that.status,_that.statusLabel,_that.capacity,_that.lastConfirmedAt,_that.confirmationCount,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  LatLng location,  ShelterStatus status,  String statusLabel,  int? capacity,  DateTime? lastConfirmedAt,  int confirmationCount,  double? distanceMeters)  $default,) {final _that = this;
switch (_that) {
case _Shelter():
return $default(_that.id,_that.name,_that.address,_that.location,_that.status,_that.statusLabel,_that.capacity,_that.lastConfirmedAt,_that.confirmationCount,_that.distanceMeters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  LatLng location,  ShelterStatus status,  String statusLabel,  int? capacity,  DateTime? lastConfirmedAt,  int confirmationCount,  double? distanceMeters)?  $default,) {final _that = this;
switch (_that) {
case _Shelter() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.location,_that.status,_that.statusLabel,_that.capacity,_that.lastConfirmedAt,_that.confirmationCount,_that.distanceMeters);case _:
  return null;

}
}

}

/// @nodoc


class _Shelter implements Shelter {
  const _Shelter({required this.id, required this.name, required this.address, required this.location, required this.status, required this.statusLabel, this.capacity, this.lastConfirmedAt, this.confirmationCount = 0, this.distanceMeters});
  

@override final  String id;
@override final  String name;
@override final  String address;
@override final  LatLng location;
@override final  ShelterStatus status;
@override final  String statusLabel;
@override final  int? capacity;
@override final  DateTime? lastConfirmedAt;
@override@JsonKey() final  int confirmationCount;
/// Tylko w wariancie „najbliższe” (`?lat&lng`).
@override final  double? distanceMeters;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShelterCopyWith<_Shelter> get copyWith => __$ShelterCopyWithImpl<_Shelter>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shelter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.lastConfirmedAt, lastConfirmedAt) || other.lastConfirmedAt == lastConfirmedAt)&&(identical(other.confirmationCount, confirmationCount) || other.confirmationCount == confirmationCount)&&(identical(other.distanceMeters, distanceMeters) || other.distanceMeters == distanceMeters));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,address,location,status,statusLabel,capacity,lastConfirmedAt,confirmationCount,distanceMeters);
}

@override
String toString() {
    return 'Shelter(id: $id, name: $name, address: $address, location: $location, status: $status, statusLabel: $statusLabel, capacity: $capacity, lastConfirmedAt: $lastConfirmedAt, confirmationCount: $confirmationCount, distanceMeters: $distanceMeters)';
}


}

/// @nodoc
abstract mixin class _$ShelterCopyWith<$Res> implements $ShelterCopyWith<$Res> {
  factory _$ShelterCopyWith(_Shelter value, $Res Function(_Shelter) _then) = __$ShelterCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, LatLng location, ShelterStatus status, String statusLabel, int? capacity, DateTime? lastConfirmedAt, int confirmationCount, double? distanceMeters
});




}
/// @nodoc
class __$ShelterCopyWithImpl<$Res>
    implements _$ShelterCopyWith<$Res> {
  __$ShelterCopyWithImpl(this._self, this._then);

  final _Shelter _self;
  final $Res Function(_Shelter) _then;

/// Create a copy of Shelter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? location = null,Object? status = null,Object? statusLabel = null,Object? capacity = freezed,Object? lastConfirmedAt = freezed,Object? confirmationCount = null,Object? distanceMeters = freezed,}) {
  return _then(_Shelter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ShelterStatus,statusLabel: null == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,lastConfirmedAt: freezed == lastConfirmedAt ? _self.lastConfirmedAt : lastConfirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmationCount: null == confirmationCount ? _self.confirmationCount : confirmationCount // ignore: cast_nullable_to_non_nullable
as int,distanceMeters: freezed == distanceMeters ? _self.distanceMeters : distanceMeters // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$Alert {

 String get id; String get title; String get body; AlertSeverity get severity; String? get incidentId; DateTime? get createdAt; DateTime get expiresAt; bool get active;/// Tylko w `GET /alerts/{id}` i na mapie.
 GeoArea? get area;
/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertCopyWith<Alert> get copyWith => _$AlertCopyWithImpl<Alert>(this as Alert, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Alert;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Alert&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.body, _this.body) || other.body == _this.body)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.area, _this.area) || other.area == _this.area));
}


@override
int get hashCode {
  final _this = this as Alert;
  return Object.hash(runtimeType,_this.id,_this.title,_this.body,_this.severity,_this.incidentId,_this.createdAt,_this.expiresAt,_this.active,_this.area);
}

@override
String toString() {
  final _this = this as Alert;
  return 'Alert(id: ${_this.id}, title: ${_this.title}, body: ${_this.body}, severity: ${_this.severity}, incidentId: ${_this.incidentId}, createdAt: ${_this.createdAt}, expiresAt: ${_this.expiresAt}, active: ${_this.active}, area: ${_this.area})';
}


}

/// @nodoc
abstract mixin class $AlertCopyWith<$Res>  {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) _then) = _$AlertCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, String? incidentId, DateTime? createdAt, DateTime expiresAt, bool active, GeoArea? area
});


$GeoAreaCopyWith<$Res>? get area;

}
/// @nodoc
class _$AlertCopyWithImpl<$Res>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._self, this._then);

  final Alert _self;
  final $Res Function(Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? incidentId = freezed,Object? createdAt = freezed,Object? expiresAt = null,Object? active = null,Object? area = freezed,}) {
  return _then(Alert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoArea?,
  ));
}
/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoAreaCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $GeoAreaCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}


/// Adds pattern-matching-related methods to [Alert].
extension AlertPatterns on Alert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Alert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Alert value)  $default,){
final _that = this;
switch (_that) {
case _Alert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Alert value)?  $default,){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  String? incidentId,  DateTime? createdAt,  DateTime expiresAt,  bool active,  GeoArea? area)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.incidentId,_that.createdAt,_that.expiresAt,_that.active,_that.area);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String body,  AlertSeverity severity,  String? incidentId,  DateTime? createdAt,  DateTime expiresAt,  bool active,  GeoArea? area)  $default,) {final _that = this;
switch (_that) {
case _Alert():
return $default(_that.id,_that.title,_that.body,_that.severity,_that.incidentId,_that.createdAt,_that.expiresAt,_that.active,_that.area);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String body,  AlertSeverity severity,  String? incidentId,  DateTime? createdAt,  DateTime expiresAt,  bool active,  GeoArea? area)?  $default,) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.id,_that.title,_that.body,_that.severity,_that.incidentId,_that.createdAt,_that.expiresAt,_that.active,_that.area);case _:
  return null;

}
}

}

/// @nodoc


class _Alert implements Alert {
  const _Alert({required this.id, required this.title, required this.body, required this.severity, this.incidentId, this.createdAt, required this.expiresAt, this.active = true, this.area});
  

@override final  String id;
@override final  String title;
@override final  String body;
@override final  AlertSeverity severity;
@override final  String? incidentId;
@override final  DateTime? createdAt;
@override final  DateTime expiresAt;
@override@JsonKey() final  bool active;
/// Tylko w `GET /alerts/{id}` i na mapie.
@override final  GeoArea? area;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertCopyWith<_Alert> get copyWith => __$AlertCopyWithImpl<_Alert>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Alert&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.active, active) || other.active == active)&&(identical(other.area, area) || other.area == area));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,body,severity,incidentId,createdAt,expiresAt,active,area);
}

@override
String toString() {
    return 'Alert(id: $id, title: $title, body: $body, severity: $severity, incidentId: $incidentId, createdAt: $createdAt, expiresAt: $expiresAt, active: $active, area: $area)';
}


}

/// @nodoc
abstract mixin class _$AlertCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$AlertCopyWith(_Alert value, $Res Function(_Alert) _then) = __$AlertCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String body, AlertSeverity severity, String? incidentId, DateTime? createdAt, DateTime expiresAt, bool active, GeoArea? area
});


@override $GeoAreaCopyWith<$Res>? get area;

}
/// @nodoc
class __$AlertCopyWithImpl<$Res>
    implements _$AlertCopyWith<$Res> {
  __$AlertCopyWithImpl(this._self, this._then);

  final _Alert _self;
  final $Res Function(_Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? severity = null,Object? incidentId = freezed,Object? createdAt = freezed,Object? expiresAt = null,Object? active = null,Object? area = freezed,}) {
  return _then(_Alert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as AlertSeverity,incidentId: freezed == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as GeoArea?,
  ));
}

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoAreaCopyWith<$Res>? get area {
    if (_self.area == null) {
    return null;
  }

  return $GeoAreaCopyWith<$Res>(_self.area!, (value) {
    return _then(_self.copyWith(area: value));
  });
}
}

/// @nodoc
mixin _$MapFeature {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MapFeature);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'MapFeature()';
}


}

/// @nodoc
class $MapFeatureCopyWith<$Res>  {
$MapFeatureCopyWith(MapFeature _, $Res Function(MapFeature) __);
}


/// Adds pattern-matching-related methods to [MapFeature].
extension MapFeaturePatterns on MapFeature {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IncidentFeature value)?  incident,TResult Function( ShelterFeature value)?  shelter,TResult Function( AlertFeature value)?  alert,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IncidentFeature() when incident != null:
return incident(_that);case ShelterFeature() when shelter != null:
return shelter(_that);case AlertFeature() when alert != null:
return alert(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IncidentFeature value)  incident,required TResult Function( ShelterFeature value)  shelter,required TResult Function( AlertFeature value)  alert,}){
final _that = this;
switch (_that) {
case IncidentFeature():
return incident(_that);case ShelterFeature():
return shelter(_that);case AlertFeature():
return alert(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IncidentFeature value)?  incident,TResult? Function( ShelterFeature value)?  shelter,TResult? Function( AlertFeature value)?  alert,}){
final _that = this;
switch (_that) {
case IncidentFeature() when incident != null:
return incident(_that);case ShelterFeature() when shelter != null:
return shelter(_that);case AlertFeature() when alert != null:
return alert(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Incident incident)?  incident,TResult Function( Shelter shelter)?  shelter,TResult Function( Alert alert)?  alert,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IncidentFeature() when incident != null:
return incident(_that.incident);case ShelterFeature() when shelter != null:
return shelter(_that.shelter);case AlertFeature() when alert != null:
return alert(_that.alert);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Incident incident)  incident,required TResult Function( Shelter shelter)  shelter,required TResult Function( Alert alert)  alert,}) {final _that = this;
switch (_that) {
case IncidentFeature():
return incident(_that.incident);case ShelterFeature():
return shelter(_that.shelter);case AlertFeature():
return alert(_that.alert);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Incident incident)?  incident,TResult? Function( Shelter shelter)?  shelter,TResult? Function( Alert alert)?  alert,}) {final _that = this;
switch (_that) {
case IncidentFeature() when incident != null:
return incident(_that.incident);case ShelterFeature() when shelter != null:
return shelter(_that.shelter);case AlertFeature() when alert != null:
return alert(_that.alert);case _:
  return null;

}
}

}

/// @nodoc


class IncidentFeature implements MapFeature {
  const IncidentFeature(this.incident);
  

 final  Incident incident;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentFeatureCopyWith<IncidentFeature> get copyWith => _$IncidentFeatureCopyWithImpl<IncidentFeature>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentFeature&&(identical(other.incident, incident) || other.incident == incident));
}


@override
int get hashCode {
    return Object.hash(runtimeType,incident);
}

@override
String toString() {
    return 'MapFeature.incident(incident: $incident)';
}


}

/// @nodoc
abstract mixin class $IncidentFeatureCopyWith<$Res> implements $MapFeatureCopyWith<$Res> {
  factory $IncidentFeatureCopyWith(IncidentFeature value, $Res Function(IncidentFeature) _then) = _$IncidentFeatureCopyWithImpl;
@useResult
$Res call({
 Incident incident
});


$IncidentCopyWith<$Res> get incident;

}
/// @nodoc
class _$IncidentFeatureCopyWithImpl<$Res>
    implements $IncidentFeatureCopyWith<$Res> {
  _$IncidentFeatureCopyWithImpl(this._self, this._then);

  final IncidentFeature _self;
  final $Res Function(IncidentFeature) _then;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? incident = null,}) {
  return _then(IncidentFeature(
null == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as Incident,
  ));
}

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentCopyWith<$Res> get incident {
  
  return $IncidentCopyWith<$Res>(_self.incident, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}

/// @nodoc


class ShelterFeature implements MapFeature {
  const ShelterFeature(this.shelter);
  

 final  Shelter shelter;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShelterFeatureCopyWith<ShelterFeature> get copyWith => _$ShelterFeatureCopyWithImpl<ShelterFeature>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ShelterFeature&&(identical(other.shelter, shelter) || other.shelter == shelter));
}


@override
int get hashCode {
    return Object.hash(runtimeType,shelter);
}

@override
String toString() {
    return 'MapFeature.shelter(shelter: $shelter)';
}


}

/// @nodoc
abstract mixin class $ShelterFeatureCopyWith<$Res> implements $MapFeatureCopyWith<$Res> {
  factory $ShelterFeatureCopyWith(ShelterFeature value, $Res Function(ShelterFeature) _then) = _$ShelterFeatureCopyWithImpl;
@useResult
$Res call({
 Shelter shelter
});


$ShelterCopyWith<$Res> get shelter;

}
/// @nodoc
class _$ShelterFeatureCopyWithImpl<$Res>
    implements $ShelterFeatureCopyWith<$Res> {
  _$ShelterFeatureCopyWithImpl(this._self, this._then);

  final ShelterFeature _self;
  final $Res Function(ShelterFeature) _then;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? shelter = null,}) {
  return _then(ShelterFeature(
null == shelter ? _self.shelter : shelter // ignore: cast_nullable_to_non_nullable
as Shelter,
  ));
}

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShelterCopyWith<$Res> get shelter {
  
  return $ShelterCopyWith<$Res>(_self.shelter, (value) {
    return _then(_self.copyWith(shelter: value));
  });
}
}

/// @nodoc


class AlertFeature implements MapFeature {
  const AlertFeature(this.alert);
  

 final  Alert alert;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertFeatureCopyWith<AlertFeature> get copyWith => _$AlertFeatureCopyWithImpl<AlertFeature>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertFeature&&(identical(other.alert, alert) || other.alert == alert));
}


@override
int get hashCode {
    return Object.hash(runtimeType,alert);
}

@override
String toString() {
    return 'MapFeature.alert(alert: $alert)';
}


}

/// @nodoc
abstract mixin class $AlertFeatureCopyWith<$Res> implements $MapFeatureCopyWith<$Res> {
  factory $AlertFeatureCopyWith(AlertFeature value, $Res Function(AlertFeature) _then) = _$AlertFeatureCopyWithImpl;
@useResult
$Res call({
 Alert alert
});


$AlertCopyWith<$Res> get alert;

}
/// @nodoc
class _$AlertFeatureCopyWithImpl<$Res>
    implements $AlertFeatureCopyWith<$Res> {
  _$AlertFeatureCopyWithImpl(this._self, this._then);

  final AlertFeature _self;
  final $Res Function(AlertFeature) _then;

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alert = null,}) {
  return _then(AlertFeature(
null == alert ? _self.alert : alert // ignore: cast_nullable_to_non_nullable
as Alert,
  ));
}

/// Create a copy of MapFeature
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AlertCopyWith<$Res> get alert {
  
  return $AlertCopyWith<$Res>(_self.alert, (value) {
    return _then(_self.copyWith(alert: value));
  });
}
}

/// @nodoc
mixin _$VerificationQuestion {

 String get verificationId; String get incidentId; IncidentType get type; String get typeLabel; String get question; String get context; List<VerificationAnswer> get options; DateTime get sentAt; DateTime get expiresAt; bool get answered;
/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationQuestionCopyWith<VerificationQuestion> get copyWith => _$VerificationQuestionCopyWithImpl<VerificationQuestion>(this as VerificationQuestion, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerificationQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationQuestion&&(identical(other.verificationId, _this.verificationId) || other.verificationId == _this.verificationId)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.question, _this.question) || other.question == _this.question)&&(identical(other.context, _this.context) || other.context == _this.context)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.answered, _this.answered) || other.answered == _this.answered));
}


@override
int get hashCode {
  final _this = this as VerificationQuestion;
  return Object.hash(runtimeType,_this.verificationId,_this.incidentId,_this.type,_this.typeLabel,_this.question,_this.context,const DeepCollectionEquality().hash(_this.options),_this.sentAt,_this.expiresAt,_this.answered);
}

@override
String toString() {
  final _this = this as VerificationQuestion;
  return 'VerificationQuestion(verificationId: ${_this.verificationId}, incidentId: ${_this.incidentId}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, question: ${_this.question}, context: ${_this.context}, options: ${_this.options}, sentAt: ${_this.sentAt}, expiresAt: ${_this.expiresAt}, answered: ${_this.answered})';
}


}

/// @nodoc
abstract mixin class $VerificationQuestionCopyWith<$Res>  {
  factory $VerificationQuestionCopyWith(VerificationQuestion value, $Res Function(VerificationQuestion) _then) = _$VerificationQuestionCopyWithImpl;
@useResult
$Res call({
 String verificationId, String incidentId, IncidentType type, String typeLabel, String question, String context, List<VerificationAnswer> options, DateTime sentAt, DateTime expiresAt, bool answered
});




}
/// @nodoc
class _$VerificationQuestionCopyWithImpl<$Res>
    implements $VerificationQuestionCopyWith<$Res> {
  _$VerificationQuestionCopyWithImpl(this._self, this._then);

  final VerificationQuestion _self;
  final $Res Function(VerificationQuestion) _then;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,Object? incidentId = null,Object? type = null,Object? typeLabel = null,Object? question = null,Object? context = null,Object? options = null,Object? sentAt = null,Object? expiresAt = null,Object? answered = null,}) {
  return _then(VerificationQuestion(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<VerificationAnswer>,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [VerificationQuestion].
extension VerificationQuestionPatterns on VerificationQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerificationQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerificationQuestion value)  $default,){
final _that = this;
switch (_that) {
case _VerificationQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerificationQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  IncidentType type,  String typeLabel,  String question,  String context,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  IncidentType type,  String typeLabel,  String question,  String context,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)  $default,) {final _that = this;
switch (_that) {
case _VerificationQuestion():
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId,  String incidentId,  IncidentType type,  String typeLabel,  String question,  String context,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)?  $default,) {final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
  return null;

}
}

}

/// @nodoc


class _VerificationQuestion extends VerificationQuestion {
  const _VerificationQuestion({required this.verificationId, required this.incidentId, required this.type, required this.typeLabel, required this.question, required this.context,  List<VerificationAnswer> options = VerificationAnswer.values, required this.sentAt, required this.expiresAt, this.answered = false}): _options = options,super._();
  

@override final  String verificationId;
@override final  String incidentId;
@override final  IncidentType type;
@override final  String typeLabel;
@override final  String question;
@override final  String context;
 final  List<VerificationAnswer> _options;
@override@JsonKey() List<VerificationAnswer> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  DateTime sentAt;
@override final  DateTime expiresAt;
@override@JsonKey() final  bool answered;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationQuestionCopyWith<_VerificationQuestion> get copyWith => __$VerificationQuestionCopyWithImpl<_VerificationQuestion>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationQuestion&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.question, question) || other.question == question)&&(identical(other.context, context) || other.context == context)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.answered, answered) || other.answered == answered));
}


@override
int get hashCode {
    return Object.hash(runtimeType,verificationId,incidentId,type,typeLabel,question,context,const DeepCollectionEquality().hash(_options),sentAt,expiresAt,answered);
}

@override
String toString() {
    return 'VerificationQuestion(verificationId: $verificationId, incidentId: $incidentId, type: $type, typeLabel: $typeLabel, question: $question, context: $context, options: $options, sentAt: $sentAt, expiresAt: $expiresAt, answered: $answered)';
}


}

/// @nodoc
abstract mixin class _$VerificationQuestionCopyWith<$Res> implements $VerificationQuestionCopyWith<$Res> {
  factory _$VerificationQuestionCopyWith(_VerificationQuestion value, $Res Function(_VerificationQuestion) _then) = __$VerificationQuestionCopyWithImpl;
@override @useResult
$Res call({
 String verificationId, String incidentId, IncidentType type, String typeLabel, String question, String context, List<VerificationAnswer> options, DateTime sentAt, DateTime expiresAt, bool answered
});




}
/// @nodoc
class __$VerificationQuestionCopyWithImpl<$Res>
    implements _$VerificationQuestionCopyWith<$Res> {
  __$VerificationQuestionCopyWithImpl(this._self, this._then);

  final _VerificationQuestion _self;
  final $Res Function(_VerificationQuestion) _then;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? incidentId = null,Object? type = null,Object? typeLabel = null,Object? question = null,Object? context = null,Object? options = null,Object? sentAt = null,Object? expiresAt = null,Object? answered = null,}) {
  return _then(_VerificationQuestion(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<VerificationAnswer>,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$VerificationResult {

 String get verificationId; String get incidentId; String get thanks;
/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationResultCopyWith<VerificationResult> get copyWith => _$VerificationResultCopyWithImpl<VerificationResult>(this as VerificationResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as VerificationResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationResult&&(identical(other.verificationId, _this.verificationId) || other.verificationId == _this.verificationId)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId)&&(identical(other.thanks, _this.thanks) || other.thanks == _this.thanks));
}


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


class _VerificationResult implements VerificationResult {
  const _VerificationResult({required this.verificationId, required this.incidentId, required this.thanks});
  

@override final  String verificationId;
@override final  String incidentId;
@override final  String thanks;

/// Create a copy of VerificationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationResultCopyWith<_VerificationResult> get copyWith => __$VerificationResultCopyWithImpl<_VerificationResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationResult&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.thanks, thanks) || other.thanks == thanks));
}


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

/// @nodoc
mixin _$ReportTypeOption {

 IncidentType get type; String get label;
/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportTypeOptionCopyWith<ReportTypeOption> get copyWith => _$ReportTypeOptionCopyWithImpl<ReportTypeOption>(this as ReportTypeOption, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportTypeOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportTypeOption&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.label, _this.label) || other.label == _this.label));
}


@override
int get hashCode {
  final _this = this as ReportTypeOption;
  return Object.hash(runtimeType,_this.type,_this.label);
}

@override
String toString() {
  final _this = this as ReportTypeOption;
  return 'ReportTypeOption(type: ${_this.type}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $ReportTypeOptionCopyWith<$Res>  {
  factory $ReportTypeOptionCopyWith(ReportTypeOption value, $Res Function(ReportTypeOption) _then) = _$ReportTypeOptionCopyWithImpl;
@useResult
$Res call({
 IncidentType type, String label
});




}
/// @nodoc
class _$ReportTypeOptionCopyWithImpl<$Res>
    implements $ReportTypeOptionCopyWith<$Res> {
  _$ReportTypeOptionCopyWithImpl(this._self, this._then);

  final ReportTypeOption _self;
  final $Res Function(ReportTypeOption) _then;

/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? label = null,}) {
  return _then(ReportTypeOption(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportTypeOption].
extension ReportTypeOptionPatterns on ReportTypeOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportTypeOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportTypeOption value)  $default,){
final _that = this;
switch (_that) {
case _ReportTypeOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportTypeOption value)?  $default,){
final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IncidentType type,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
return $default(_that.type,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IncidentType type,  String label)  $default,) {final _that = this;
switch (_that) {
case _ReportTypeOption():
return $default(_that.type,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IncidentType type,  String label)?  $default,) {final _that = this;
switch (_that) {
case _ReportTypeOption() when $default != null:
return $default(_that.type,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _ReportTypeOption implements ReportTypeOption {
  const _ReportTypeOption({required this.type, required this.label});
  

@override final  IncidentType type;
@override final  String label;

/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportTypeOptionCopyWith<_ReportTypeOption> get copyWith => __$ReportTypeOptionCopyWithImpl<_ReportTypeOption>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportTypeOption&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode {
    return Object.hash(runtimeType,type,label);
}

@override
String toString() {
    return 'ReportTypeOption(type: $type, label: $label)';
}


}

/// @nodoc
abstract mixin class _$ReportTypeOptionCopyWith<$Res> implements $ReportTypeOptionCopyWith<$Res> {
  factory _$ReportTypeOptionCopyWith(_ReportTypeOption value, $Res Function(_ReportTypeOption) _then) = __$ReportTypeOptionCopyWithImpl;
@override @useResult
$Res call({
 IncidentType type, String label
});




}
/// @nodoc
class __$ReportTypeOptionCopyWithImpl<$Res>
    implements _$ReportTypeOptionCopyWith<$Res> {
  __$ReportTypeOptionCopyWithImpl(this._self, this._then);

  final _ReportTypeOption _self;
  final $Res Function(_ReportTypeOption) _then;

/// Create a copy of ReportTypeOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? label = null,}) {
  return _then(_ReportTypeOption(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ReportReceipt {

 String get reportId; String? get h3Cell; DateTime get createdAt;
/// Create a copy of ReportReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportReceiptCopyWith<ReportReceipt> get copyWith => _$ReportReceiptCopyWithImpl<ReportReceipt>(this as ReportReceipt, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportReceipt;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportReceipt&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.h3Cell, _this.h3Cell) || other.h3Cell == _this.h3Cell)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as ReportReceipt;
  return Object.hash(runtimeType,_this.reportId,_this.h3Cell,_this.createdAt);
}

@override
String toString() {
  final _this = this as ReportReceipt;
  return 'ReportReceipt(reportId: ${_this.reportId}, h3Cell: ${_this.h3Cell}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $ReportReceiptCopyWith<$Res>  {
  factory $ReportReceiptCopyWith(ReportReceipt value, $Res Function(ReportReceipt) _then) = _$ReportReceiptCopyWithImpl;
@useResult
$Res call({
 String reportId, String? h3Cell, DateTime createdAt
});




}
/// @nodoc
class _$ReportReceiptCopyWithImpl<$Res>
    implements $ReportReceiptCopyWith<$Res> {
  _$ReportReceiptCopyWithImpl(this._self, this._then);

  final ReportReceipt _self;
  final $Res Function(ReportReceipt) _then;

/// Create a copy of ReportReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportId = null,Object? h3Cell = freezed,Object? createdAt = null,}) {
  return _then(ReportReceipt(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportReceipt].
extension ReportReceiptPatterns on ReportReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportReceipt value)  $default,){
final _that = this;
switch (_that) {
case _ReportReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _ReportReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reportId,  String? h3Cell,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportReceipt() when $default != null:
return $default(_that.reportId,_that.h3Cell,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reportId,  String? h3Cell,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ReportReceipt():
return $default(_that.reportId,_that.h3Cell,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reportId,  String? h3Cell,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ReportReceipt() when $default != null:
return $default(_that.reportId,_that.h3Cell,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _ReportReceipt implements ReportReceipt {
  const _ReportReceipt({required this.reportId, this.h3Cell, required this.createdAt});
  

@override final  String reportId;
@override final  String? h3Cell;
@override final  DateTime createdAt;

/// Create a copy of ReportReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportReceiptCopyWith<_ReportReceipt> get copyWith => __$ReportReceiptCopyWithImpl<_ReportReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportReceipt&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.h3Cell, h3Cell) || other.h3Cell == h3Cell)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reportId,h3Cell,createdAt);
}

@override
String toString() {
    return 'ReportReceipt(reportId: $reportId, h3Cell: $h3Cell, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ReportReceiptCopyWith<$Res> implements $ReportReceiptCopyWith<$Res> {
  factory _$ReportReceiptCopyWith(_ReportReceipt value, $Res Function(_ReportReceipt) _then) = __$ReportReceiptCopyWithImpl;
@override @useResult
$Res call({
 String reportId, String? h3Cell, DateTime createdAt
});




}
/// @nodoc
class __$ReportReceiptCopyWithImpl<$Res>
    implements _$ReportReceiptCopyWith<$Res> {
  __$ReportReceiptCopyWithImpl(this._self, this._then);

  final _ReportReceipt _self;
  final $Res Function(_ReportReceipt) _then;

/// Create a copy of ReportReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportId = null,Object? h3Cell = freezed,Object? createdAt = null,}) {
  return _then(_ReportReceipt(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$ReportIncidentRef {

 String get id; IncidentStatus get status; ConfidenceLevel get confidenceLevel; double get confidenceScore;
/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportIncidentRefCopyWith<ReportIncidentRef> get copyWith => _$ReportIncidentRefCopyWithImpl<ReportIncidentRef>(this as ReportIncidentRef, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportIncidentRef;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportIncidentRef&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.confidenceLevel, _this.confidenceLevel) || other.confidenceLevel == _this.confidenceLevel)&&(identical(other.confidenceScore, _this.confidenceScore) || other.confidenceScore == _this.confidenceScore));
}


@override
int get hashCode {
  final _this = this as ReportIncidentRef;
  return Object.hash(runtimeType,_this.id,_this.status,_this.confidenceLevel,_this.confidenceScore);
}

@override
String toString() {
  final _this = this as ReportIncidentRef;
  return 'ReportIncidentRef(id: ${_this.id}, status: ${_this.status}, confidenceLevel: ${_this.confidenceLevel}, confidenceScore: ${_this.confidenceScore})';
}


}

/// @nodoc
abstract mixin class $ReportIncidentRefCopyWith<$Res>  {
  factory $ReportIncidentRefCopyWith(ReportIncidentRef value, $Res Function(ReportIncidentRef) _then) = _$ReportIncidentRefCopyWithImpl;
@useResult
$Res call({
 String id, IncidentStatus status, ConfidenceLevel confidenceLevel, double confidenceScore
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? confidenceLevel = null,Object? confidenceScore = null,}) {
  return _then(ReportIncidentRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  double confidenceScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
return $default(_that.id,_that.status,_that.confidenceLevel,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  double confidenceScore)  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentRef():
return $default(_that.id,_that.status,_that.confidenceLevel,_that.confidenceScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  IncidentStatus status,  ConfidenceLevel confidenceLevel,  double confidenceScore)?  $default,) {final _that = this;
switch (_that) {
case _ReportIncidentRef() when $default != null:
return $default(_that.id,_that.status,_that.confidenceLevel,_that.confidenceScore);case _:
  return null;

}
}

}

/// @nodoc


class _ReportIncidentRef implements ReportIncidentRef {
  const _ReportIncidentRef({required this.id, required this.status, required this.confidenceLevel, required this.confidenceScore});
  

@override final  String id;
@override final  IncidentStatus status;
@override final  ConfidenceLevel confidenceLevel;
@override final  double confidenceScore;

/// Create a copy of ReportIncidentRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportIncidentRefCopyWith<_ReportIncidentRef> get copyWith => __$ReportIncidentRefCopyWithImpl<_ReportIncidentRef>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportIncidentRef&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.confidenceLevel, confidenceLevel) || other.confidenceLevel == confidenceLevel)&&(identical(other.confidenceScore, confidenceScore) || other.confidenceScore == confidenceScore));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,status,confidenceLevel,confidenceScore);
}

@override
String toString() {
    return 'ReportIncidentRef(id: $id, status: $status, confidenceLevel: $confidenceLevel, confidenceScore: $confidenceScore)';
}


}

/// @nodoc
abstract mixin class _$ReportIncidentRefCopyWith<$Res> implements $ReportIncidentRefCopyWith<$Res> {
  factory _$ReportIncidentRefCopyWith(_ReportIncidentRef value, $Res Function(_ReportIncidentRef) _then) = __$ReportIncidentRefCopyWithImpl;
@override @useResult
$Res call({
 String id, IncidentStatus status, ConfidenceLevel confidenceLevel, double confidenceScore
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? confidenceLevel = null,Object? confidenceScore = null,}) {
  return _then(_ReportIncidentRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IncidentStatus,confidenceLevel: null == confidenceLevel ? _self.confidenceLevel : confidenceLevel // ignore: cast_nullable_to_non_nullable
as ConfidenceLevel,confidenceScore: null == confidenceScore ? _self.confidenceScore : confidenceScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ReportStatus {

 String get reportId; IncidentType get type; DateTime get createdAt; ReportIncidentRef? get incident;
/// Create a copy of ReportStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportStatusCopyWith<ReportStatus> get copyWith => _$ReportStatusCopyWithImpl<ReportStatus>(this as ReportStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReportStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportStatus&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.incident, _this.incident) || other.incident == _this.incident));
}


@override
int get hashCode {
  final _this = this as ReportStatus;
  return Object.hash(runtimeType,_this.reportId,_this.type,_this.createdAt,_this.incident);
}

@override
String toString() {
  final _this = this as ReportStatus;
  return 'ReportStatus(reportId: ${_this.reportId}, type: ${_this.type}, createdAt: ${_this.createdAt}, incident: ${_this.incident})';
}


}

/// @nodoc
abstract mixin class $ReportStatusCopyWith<$Res>  {
  factory $ReportStatusCopyWith(ReportStatus value, $Res Function(ReportStatus) _then) = _$ReportStatusCopyWithImpl;
@useResult
$Res call({
 String reportId, IncidentType type, DateTime createdAt, ReportIncidentRef? incident
});


$ReportIncidentRefCopyWith<$Res>? get incident;

}
/// @nodoc
class _$ReportStatusCopyWithImpl<$Res>
    implements $ReportStatusCopyWith<$Res> {
  _$ReportStatusCopyWithImpl(this._self, this._then);

  final ReportStatus _self;
  final $Res Function(ReportStatus) _then;

/// Create a copy of ReportStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportId = null,Object? type = null,Object? createdAt = null,Object? incident = freezed,}) {
  return _then(ReportStatus(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as ReportIncidentRef?,
  ));
}
/// Create a copy of ReportStatus
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


/// Adds pattern-matching-related methods to [ReportStatus].
extension ReportStatusPatterns on ReportStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportStatus value)  $default,){
final _that = this;
switch (_that) {
case _ReportStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ReportStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reportId,  IncidentType type,  DateTime createdAt,  ReportIncidentRef? incident)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportStatus() when $default != null:
return $default(_that.reportId,_that.type,_that.createdAt,_that.incident);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reportId,  IncidentType type,  DateTime createdAt,  ReportIncidentRef? incident)  $default,) {final _that = this;
switch (_that) {
case _ReportStatus():
return $default(_that.reportId,_that.type,_that.createdAt,_that.incident);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reportId,  IncidentType type,  DateTime createdAt,  ReportIncidentRef? incident)?  $default,) {final _that = this;
switch (_that) {
case _ReportStatus() when $default != null:
return $default(_that.reportId,_that.type,_that.createdAt,_that.incident);case _:
  return null;

}
}

}

/// @nodoc


class _ReportStatus implements ReportStatus {
  const _ReportStatus({required this.reportId, required this.type, required this.createdAt, this.incident});
  

@override final  String reportId;
@override final  IncidentType type;
@override final  DateTime createdAt;
@override final  ReportIncidentRef? incident;

/// Create a copy of ReportStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportStatusCopyWith<_ReportStatus> get copyWith => __$ReportStatusCopyWithImpl<_ReportStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportStatus&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.incident, incident) || other.incident == incident));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reportId,type,createdAt,incident);
}

@override
String toString() {
    return 'ReportStatus(reportId: $reportId, type: $type, createdAt: $createdAt, incident: $incident)';
}


}

/// @nodoc
abstract mixin class _$ReportStatusCopyWith<$Res> implements $ReportStatusCopyWith<$Res> {
  factory _$ReportStatusCopyWith(_ReportStatus value, $Res Function(_ReportStatus) _then) = __$ReportStatusCopyWithImpl;
@override @useResult
$Res call({
 String reportId, IncidentType type, DateTime createdAt, ReportIncidentRef? incident
});


@override $ReportIncidentRefCopyWith<$Res>? get incident;

}
/// @nodoc
class __$ReportStatusCopyWithImpl<$Res>
    implements _$ReportStatusCopyWith<$Res> {
  __$ReportStatusCopyWithImpl(this._self, this._then);

  final _ReportStatus _self;
  final $Res Function(_ReportStatus) _then;

/// Create a copy of ReportStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportId = null,Object? type = null,Object? createdAt = null,Object? incident = freezed,}) {
  return _then(_ReportStatus(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as ReportIncidentRef?,
  ));
}

/// Create a copy of ReportStatus
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

/// @nodoc
mixin _$DeviceProfile {

 String get deviceId; String? get platform; bool get hasPushToken; LatLng? get lastLocation; String? get h3Cell; DateTime? get locationUpdatedAt;
/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceProfileCopyWith<DeviceProfile> get copyWith => _$DeviceProfileCopyWithImpl<DeviceProfile>(this as DeviceProfile, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DeviceProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceProfile&&(identical(other.deviceId, _this.deviceId) || other.deviceId == _this.deviceId)&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.hasPushToken, _this.hasPushToken) || other.hasPushToken == _this.hasPushToken)&&(identical(other.lastLocation, _this.lastLocation) || other.lastLocation == _this.lastLocation)&&(identical(other.h3Cell, _this.h3Cell) || other.h3Cell == _this.h3Cell)&&(identical(other.locationUpdatedAt, _this.locationUpdatedAt) || other.locationUpdatedAt == _this.locationUpdatedAt));
}


@override
int get hashCode {
  final _this = this as DeviceProfile;
  return Object.hash(runtimeType,_this.deviceId,_this.platform,_this.hasPushToken,_this.lastLocation,_this.h3Cell,_this.locationUpdatedAt);
}

@override
String toString() {
  final _this = this as DeviceProfile;
  return 'DeviceProfile(deviceId: ${_this.deviceId}, platform: ${_this.platform}, hasPushToken: ${_this.hasPushToken}, lastLocation: ${_this.lastLocation}, h3Cell: ${_this.h3Cell}, locationUpdatedAt: ${_this.locationUpdatedAt})';
}


}

/// @nodoc
abstract mixin class $DeviceProfileCopyWith<$Res>  {
  factory $DeviceProfileCopyWith(DeviceProfile value, $Res Function(DeviceProfile) _then) = _$DeviceProfileCopyWithImpl;
@useResult
$Res call({
 String deviceId, String? platform, bool hasPushToken, LatLng? lastLocation, String? h3Cell, DateTime? locationUpdatedAt
});




}
/// @nodoc
class _$DeviceProfileCopyWithImpl<$Res>
    implements $DeviceProfileCopyWith<$Res> {
  _$DeviceProfileCopyWithImpl(this._self, this._then);

  final DeviceProfile _self;
  final $Res Function(DeviceProfile) _then;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,Object? platform = freezed,Object? hasPushToken = null,Object? lastLocation = freezed,Object? h3Cell = freezed,Object? locationUpdatedAt = freezed,}) {
  return _then(DeviceProfile(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,hasPushToken: null == hasPushToken ? _self.hasPushToken : hasPushToken // ignore: cast_nullable_to_non_nullable
as bool,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceProfile].
extension DeviceProfilePatterns on DeviceProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceProfile value)  $default,){
final _that = this;
switch (_that) {
case _DeviceProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceProfile value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId,  String? platform,  bool hasPushToken,  LatLng? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
return $default(_that.deviceId,_that.platform,_that.hasPushToken,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId,  String? platform,  bool hasPushToken,  LatLng? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceProfile():
return $default(_that.deviceId,_that.platform,_that.hasPushToken,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId,  String? platform,  bool hasPushToken,  LatLng? lastLocation,  String? h3Cell,  DateTime? locationUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceProfile() when $default != null:
return $default(_that.deviceId,_that.platform,_that.hasPushToken,_that.lastLocation,_that.h3Cell,_that.locationUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DeviceProfile implements DeviceProfile {
  const _DeviceProfile({required this.deviceId, this.platform, this.hasPushToken = false, this.lastLocation, this.h3Cell, this.locationUpdatedAt});
  

@override final  String deviceId;
@override final  String? platform;
@override@JsonKey() final  bool hasPushToken;
@override final  LatLng? lastLocation;
@override final  String? h3Cell;
@override final  DateTime? locationUpdatedAt;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceProfileCopyWith<_DeviceProfile> get copyWith => __$DeviceProfileCopyWithImpl<_DeviceProfile>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceProfile&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.hasPushToken, hasPushToken) || other.hasPushToken == hasPushToken)&&(identical(other.lastLocation, lastLocation) || other.lastLocation == lastLocation)&&(identical(other.h3Cell, h3Cell) || other.h3Cell == h3Cell)&&(identical(other.locationUpdatedAt, locationUpdatedAt) || other.locationUpdatedAt == locationUpdatedAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,deviceId,platform,hasPushToken,lastLocation,h3Cell,locationUpdatedAt);
}

@override
String toString() {
    return 'DeviceProfile(deviceId: $deviceId, platform: $platform, hasPushToken: $hasPushToken, lastLocation: $lastLocation, h3Cell: $h3Cell, locationUpdatedAt: $locationUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceProfileCopyWith<$Res> implements $DeviceProfileCopyWith<$Res> {
  factory _$DeviceProfileCopyWith(_DeviceProfile value, $Res Function(_DeviceProfile) _then) = __$DeviceProfileCopyWithImpl;
@override @useResult
$Res call({
 String deviceId, String? platform, bool hasPushToken, LatLng? lastLocation, String? h3Cell, DateTime? locationUpdatedAt
});




}
/// @nodoc
class __$DeviceProfileCopyWithImpl<$Res>
    implements _$DeviceProfileCopyWith<$Res> {
  __$DeviceProfileCopyWithImpl(this._self, this._then);

  final _DeviceProfile _self;
  final $Res Function(_DeviceProfile) _then;

/// Create a copy of DeviceProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,Object? platform = freezed,Object? hasPushToken = null,Object? lastLocation = freezed,Object? h3Cell = freezed,Object? locationUpdatedAt = freezed,}) {
  return _then(_DeviceProfile(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,platform: freezed == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String?,hasPushToken: null == hasPushToken ? _self.hasPushToken : hasPushToken // ignore: cast_nullable_to_non_nullable
as bool,lastLocation: freezed == lastLocation ? _self.lastLocation : lastLocation // ignore: cast_nullable_to_non_nullable
as LatLng?,h3Cell: freezed == h3Cell ? _self.h3Cell : h3Cell // ignore: cast_nullable_to_non_nullable
as String?,locationUpdatedAt: freezed == locationUpdatedAt ? _self.locationUpdatedAt : locationUpdatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$HomeAddress {

 String get label; LatLng get location;
/// Create a copy of HomeAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeAddressCopyWith<HomeAddress> get copyWith => _$HomeAddressCopyWithImpl<HomeAddress>(this as HomeAddress, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HomeAddress;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeAddress&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.location, _this.location) || other.location == _this.location));
}


@override
int get hashCode {
  final _this = this as HomeAddress;
  return Object.hash(runtimeType,_this.label,_this.location);
}

@override
String toString() {
  final _this = this as HomeAddress;
  return 'HomeAddress(label: ${_this.label}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $HomeAddressCopyWith<$Res>  {
  factory $HomeAddressCopyWith(HomeAddress value, $Res Function(HomeAddress) _then) = _$HomeAddressCopyWithImpl;
@useResult
$Res call({
 String label, LatLng location
});




}
/// @nodoc
class _$HomeAddressCopyWithImpl<$Res>
    implements $HomeAddressCopyWith<$Res> {
  _$HomeAddressCopyWithImpl(this._self, this._then);

  final HomeAddress _self;
  final $Res Function(HomeAddress) _then;

/// Create a copy of HomeAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? location = null,}) {
  return _then(HomeAddress(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeAddress].
extension HomeAddressPatterns on HomeAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeAddress value)  $default,){
final _that = this;
switch (_that) {
case _HomeAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeAddress value)?  $default,){
final _that = this;
switch (_that) {
case _HomeAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  LatLng location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeAddress() when $default != null:
return $default(_that.label,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  LatLng location)  $default,) {final _that = this;
switch (_that) {
case _HomeAddress():
return $default(_that.label,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  LatLng location)?  $default,) {final _that = this;
switch (_that) {
case _HomeAddress() when $default != null:
return $default(_that.label,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _HomeAddress implements HomeAddress {
  const _HomeAddress({required this.label, required this.location});
  

@override final  String label;
@override final  LatLng location;

/// Create a copy of HomeAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeAddressCopyWith<_HomeAddress> get copyWith => __$HomeAddressCopyWithImpl<_HomeAddress>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeAddress&&(identical(other.label, label) || other.label == label)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode {
    return Object.hash(runtimeType,label,location);
}

@override
String toString() {
    return 'HomeAddress(label: $label, location: $location)';
}


}

/// @nodoc
abstract mixin class _$HomeAddressCopyWith<$Res> implements $HomeAddressCopyWith<$Res> {
  factory _$HomeAddressCopyWith(_HomeAddress value, $Res Function(_HomeAddress) _then) = __$HomeAddressCopyWithImpl;
@override @useResult
$Res call({
 String label, LatLng location
});




}
/// @nodoc
class __$HomeAddressCopyWithImpl<$Res>
    implements _$HomeAddressCopyWith<$Res> {
  __$HomeAddressCopyWithImpl(this._self, this._then);

  final _HomeAddress _self;
  final $Res Function(_HomeAddress) _then;

/// Create a copy of HomeAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? location = null,}) {
  return _then(_HomeAddress(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
