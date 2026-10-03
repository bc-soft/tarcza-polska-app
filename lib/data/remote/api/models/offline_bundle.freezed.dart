// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineBundle {

 DateTime get generatedAt;/// Refresh after this time (24 h) or on foreground
 DateTime get validUntil; GeoJsonGeometry get center; int get radiusMeters;/// Nearest first, with distanceMeters
 List<ShelterView> get shelters; List<AlertView> get alerts; List<IncidentView> get incidents; List<Procedure> get procedures;
/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineBundleCopyWith<OfflineBundle> get copyWith => _$OfflineBundleCopyWithImpl<OfflineBundle>(this as OfflineBundle, _$identity);

  /// Serializes this OfflineBundle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfflineBundle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineBundle&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt)&&(identical(other.validUntil, _this.validUntil) || other.validUntil == _this.validUntil)&&(identical(other.center, _this.center) || other.center == _this.center)&&(identical(other.radiusMeters, _this.radiusMeters) || other.radiusMeters == _this.radiusMeters)&&const DeepCollectionEquality().equals(other.shelters, _this.shelters)&&const DeepCollectionEquality().equals(other.alerts, _this.alerts)&&const DeepCollectionEquality().equals(other.incidents, _this.incidents)&&const DeepCollectionEquality().equals(other.procedures, _this.procedures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfflineBundle;
  return Object.hash(runtimeType,_this.generatedAt,_this.validUntil,_this.center,_this.radiusMeters,const DeepCollectionEquality().hash(_this.shelters),const DeepCollectionEquality().hash(_this.alerts),const DeepCollectionEquality().hash(_this.incidents),const DeepCollectionEquality().hash(_this.procedures));
}

@override
String toString() {
  final _this = this as OfflineBundle;
  return 'OfflineBundle(generatedAt: ${_this.generatedAt}, validUntil: ${_this.validUntil}, center: ${_this.center}, radiusMeters: ${_this.radiusMeters}, shelters: ${_this.shelters}, alerts: ${_this.alerts}, incidents: ${_this.incidents}, procedures: ${_this.procedures})';
}


}

/// @nodoc
abstract mixin class $OfflineBundleCopyWith<$Res>  {
  factory $OfflineBundleCopyWith(OfflineBundle value, $Res Function(OfflineBundle) _then) = _$OfflineBundleCopyWithImpl;
@useResult
$Res call({
 DateTime generatedAt, DateTime validUntil, GeoJsonGeometry center, int radiusMeters, List<ShelterView> shelters, List<AlertView> alerts, List<IncidentView> incidents, List<Procedure> procedures
});


$GeoJsonGeometryCopyWith<$Res> get center;

}
/// @nodoc
class _$OfflineBundleCopyWithImpl<$Res>
    implements $OfflineBundleCopyWith<$Res> {
  _$OfflineBundleCopyWithImpl(this._self, this._then);

  final OfflineBundle _self;
  final $Res Function(OfflineBundle) _then;

/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generatedAt = null,Object? validUntil = null,Object? center = null,Object? radiusMeters = null,Object? shelters = null,Object? alerts = null,Object? incidents = null,Object? procedures = null,}) {
  return _then(OfflineBundle(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,shelters: null == shelters ? _self.shelters : shelters // ignore: cast_nullable_to_non_nullable
as List<ShelterView>,alerts: null == alerts ? _self.alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<AlertView>,incidents: null == incidents ? _self.incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<IncidentView>,procedures: null == procedures ? _self.procedures : procedures // ignore: cast_nullable_to_non_nullable
as List<Procedure>,
  ));
}
/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get center {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}


/// Adds pattern-matching-related methods to [OfflineBundle].
extension OfflineBundlePatterns on OfflineBundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineBundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineBundle value)  $default,){
final _that = this;
switch (_that) {
case _OfflineBundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineBundle value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineBundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime generatedAt,  DateTime validUntil,  GeoJsonGeometry center,  int radiusMeters,  List<ShelterView> shelters,  List<AlertView> alerts,  List<IncidentView> incidents,  List<Procedure> procedures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineBundle() when $default != null:
return $default(_that.generatedAt,_that.validUntil,_that.center,_that.radiusMeters,_that.shelters,_that.alerts,_that.incidents,_that.procedures);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime generatedAt,  DateTime validUntil,  GeoJsonGeometry center,  int radiusMeters,  List<ShelterView> shelters,  List<AlertView> alerts,  List<IncidentView> incidents,  List<Procedure> procedures)  $default,) {final _that = this;
switch (_that) {
case _OfflineBundle():
return $default(_that.generatedAt,_that.validUntil,_that.center,_that.radiusMeters,_that.shelters,_that.alerts,_that.incidents,_that.procedures);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime generatedAt,  DateTime validUntil,  GeoJsonGeometry center,  int radiusMeters,  List<ShelterView> shelters,  List<AlertView> alerts,  List<IncidentView> incidents,  List<Procedure> procedures)?  $default,) {final _that = this;
switch (_that) {
case _OfflineBundle() when $default != null:
return $default(_that.generatedAt,_that.validUntil,_that.center,_that.radiusMeters,_that.shelters,_that.alerts,_that.incidents,_that.procedures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfflineBundle implements OfflineBundle {
  const _OfflineBundle({required this.generatedAt, required this.validUntil, required this.center, required this.radiusMeters, required  List<ShelterView> shelters, required  List<AlertView> alerts, required  List<IncidentView> incidents, required  List<Procedure> procedures}): _shelters = shelters,_alerts = alerts,_incidents = incidents,_procedures = procedures;
  factory _OfflineBundle.fromJson(Map<String, dynamic> json) => _$OfflineBundleFromJson(json);

@override final  DateTime generatedAt;
/// Refresh after this time (24 h) or on foreground
@override final  DateTime validUntil;
@override final  GeoJsonGeometry center;
@override final  int radiusMeters;
/// Nearest first, with distanceMeters
 final  List<ShelterView> _shelters;
/// Nearest first, with distanceMeters
@override List<ShelterView> get shelters {
  if (_shelters is EqualUnmodifiableListView) return _shelters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shelters);
}

 final  List<AlertView> _alerts;
@override List<AlertView> get alerts {
  if (_alerts is EqualUnmodifiableListView) return _alerts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alerts);
}

 final  List<IncidentView> _incidents;
@override List<IncidentView> get incidents {
  if (_incidents is EqualUnmodifiableListView) return _incidents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidents);
}

 final  List<Procedure> _procedures;
@override List<Procedure> get procedures {
  if (_procedures is EqualUnmodifiableListView) return _procedures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_procedures);
}


/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineBundleCopyWith<_OfflineBundle> get copyWith => __$OfflineBundleCopyWithImpl<_OfflineBundle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfflineBundleToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineBundle&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.center, center) || other.center == center)&&(identical(other.radiusMeters, radiusMeters) || other.radiusMeters == radiusMeters)&&const DeepCollectionEquality().equals(other.shelters, _shelters)&&const DeepCollectionEquality().equals(other.alerts, _alerts)&&const DeepCollectionEquality().equals(other.incidents, _incidents)&&const DeepCollectionEquality().equals(other.procedures, _procedures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,generatedAt,validUntil,center,radiusMeters,const DeepCollectionEquality().hash(_shelters),const DeepCollectionEquality().hash(_alerts),const DeepCollectionEquality().hash(_incidents),const DeepCollectionEquality().hash(_procedures));
}

@override
String toString() {
    return 'OfflineBundle(generatedAt: $generatedAt, validUntil: $validUntil, center: $center, radiusMeters: $radiusMeters, shelters: $shelters, alerts: $alerts, incidents: $incidents, procedures: $procedures)';
}


}

/// @nodoc
abstract mixin class _$OfflineBundleCopyWith<$Res> implements $OfflineBundleCopyWith<$Res> {
  factory _$OfflineBundleCopyWith(_OfflineBundle value, $Res Function(_OfflineBundle) _then) = __$OfflineBundleCopyWithImpl;
@override @useResult
$Res call({
 DateTime generatedAt, DateTime validUntil, GeoJsonGeometry center, int radiusMeters, List<ShelterView> shelters, List<AlertView> alerts, List<IncidentView> incidents, List<Procedure> procedures
});


@override $GeoJsonGeometryCopyWith<$Res> get center;

}
/// @nodoc
class __$OfflineBundleCopyWithImpl<$Res>
    implements _$OfflineBundleCopyWith<$Res> {
  __$OfflineBundleCopyWithImpl(this._self, this._then);

  final _OfflineBundle _self;
  final $Res Function(_OfflineBundle) _then;

/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generatedAt = null,Object? validUntil = null,Object? center = null,Object? radiusMeters = null,Object? shelters = null,Object? alerts = null,Object? incidents = null,Object? procedures = null,}) {
  return _then(_OfflineBundle(
generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as GeoJsonGeometry,radiusMeters: null == radiusMeters ? _self.radiusMeters : radiusMeters // ignore: cast_nullable_to_non_nullable
as int,shelters: null == shelters ? _self._shelters : shelters // ignore: cast_nullable_to_non_nullable
as List<ShelterView>,alerts: null == alerts ? _self._alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<AlertView>,incidents: null == incidents ? _self._incidents : incidents // ignore: cast_nullable_to_non_nullable
as List<IncidentView>,procedures: null == procedures ? _self._procedures : procedures // ignore: cast_nullable_to_non_nullable
as List<Procedure>,
  ));
}

/// Create a copy of OfflineBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoJsonGeometryCopyWith<$Res> get center {
  
  return $GeoJsonGeometryCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}

// dart format on
