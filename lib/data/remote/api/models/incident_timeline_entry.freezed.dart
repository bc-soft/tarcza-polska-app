// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_timeline_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentTimelineEntry {

 IncidentTimelineEntryType get type;/// Polish, ready to display
 String get label; DateTime get at;/// e.g. {reports} for created, {ring, cells, devices} for wave_started, {positiveCells, negativeCells, unknownCells, yes, no} for area_changed, {from, to, score} for confidence_changed
 Map<String, dynamic> get details;
/// Create a copy of IncidentTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentTimelineEntryCopyWith<IncidentTimelineEntry> get copyWith => _$IncidentTimelineEntryCopyWithImpl<IncidentTimelineEntry>(this as IncidentTimelineEntry, _$identity);

  /// Serializes this IncidentTimelineEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as IncidentTimelineEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentTimelineEntry&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.at, _this.at) || other.at == _this.at)&&const DeepCollectionEquality().equals(other.details, _this.details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as IncidentTimelineEntry;
  return Object.hash(runtimeType,_this.type,_this.label,_this.at,const DeepCollectionEquality().hash(_this.details));
}

@override
String toString() {
  final _this = this as IncidentTimelineEntry;
  return 'IncidentTimelineEntry(type: ${_this.type}, label: ${_this.label}, at: ${_this.at}, details: ${_this.details})';
}


}

/// @nodoc
abstract mixin class $IncidentTimelineEntryCopyWith<$Res>  {
  factory $IncidentTimelineEntryCopyWith(IncidentTimelineEntry value, $Res Function(IncidentTimelineEntry) _then) = _$IncidentTimelineEntryCopyWithImpl;
@useResult
$Res call({
 IncidentTimelineEntryType type, String label, DateTime at, Map<String, dynamic> details
});




}
/// @nodoc
class _$IncidentTimelineEntryCopyWithImpl<$Res>
    implements $IncidentTimelineEntryCopyWith<$Res> {
  _$IncidentTimelineEntryCopyWithImpl(this._self, this._then);

  final IncidentTimelineEntry _self;
  final $Res Function(IncidentTimelineEntry) _then;

/// Create a copy of IncidentTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? label = null,Object? at = null,Object? details = null,}) {
  return _then(IncidentTimelineEntry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentTimelineEntryType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,details: null == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentTimelineEntry].
extension IncidentTimelineEntryPatterns on IncidentTimelineEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentTimelineEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentTimelineEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentTimelineEntry value)  $default,){
final _that = this;
switch (_that) {
case _IncidentTimelineEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentTimelineEntry value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentTimelineEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IncidentTimelineEntryType type,  String label,  DateTime at,  Map<String, dynamic> details)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentTimelineEntry() when $default != null:
return $default(_that.type,_that.label,_that.at,_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IncidentTimelineEntryType type,  String label,  DateTime at,  Map<String, dynamic> details)  $default,) {final _that = this;
switch (_that) {
case _IncidentTimelineEntry():
return $default(_that.type,_that.label,_that.at,_that.details);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IncidentTimelineEntryType type,  String label,  DateTime at,  Map<String, dynamic> details)?  $default,) {final _that = this;
switch (_that) {
case _IncidentTimelineEntry() when $default != null:
return $default(_that.type,_that.label,_that.at,_that.details);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentTimelineEntry implements IncidentTimelineEntry {
  const _IncidentTimelineEntry({required this.type, required this.label, required this.at, required  Map<String, dynamic> details}): _details = details;
  factory _IncidentTimelineEntry.fromJson(Map<String, dynamic> json) => _$IncidentTimelineEntryFromJson(json);

@override final  IncidentTimelineEntryType type;
/// Polish, ready to display
@override final  String label;
@override final  DateTime at;
/// e.g. {reports} for created, {ring, cells, devices} for wave_started, {positiveCells, negativeCells, unknownCells, yes, no} for area_changed, {from, to, score} for confidence_changed
 final  Map<String, dynamic> _details;
/// e.g. {reports} for created, {ring, cells, devices} for wave_started, {positiveCells, negativeCells, unknownCells, yes, no} for area_changed, {from, to, score} for confidence_changed
@override Map<String, dynamic> get details {
  if (_details is EqualUnmodifiableMapView) return _details;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_details);
}


/// Create a copy of IncidentTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentTimelineEntryCopyWith<_IncidentTimelineEntry> get copyWith => __$IncidentTimelineEntryCopyWithImpl<_IncidentTimelineEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentTimelineEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentTimelineEntry&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.at, at) || other.at == at)&&const DeepCollectionEquality().equals(other.details, _details));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,type,label,at,const DeepCollectionEquality().hash(_details));
}

@override
String toString() {
    return 'IncidentTimelineEntry(type: $type, label: $label, at: $at, details: $details)';
}


}

/// @nodoc
abstract mixin class _$IncidentTimelineEntryCopyWith<$Res> implements $IncidentTimelineEntryCopyWith<$Res> {
  factory _$IncidentTimelineEntryCopyWith(_IncidentTimelineEntry value, $Res Function(_IncidentTimelineEntry) _then) = __$IncidentTimelineEntryCopyWithImpl;
@override @useResult
$Res call({
 IncidentTimelineEntryType type, String label, DateTime at, Map<String, dynamic> details
});




}
/// @nodoc
class __$IncidentTimelineEntryCopyWithImpl<$Res>
    implements _$IncidentTimelineEntryCopyWith<$Res> {
  __$IncidentTimelineEntryCopyWithImpl(this._self, this._then);

  final _IncidentTimelineEntry _self;
  final $Res Function(_IncidentTimelineEntry) _then;

/// Create a copy of IncidentTimelineEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? label = null,Object? at = null,Object? details = null,}) {
  return _then(_IncidentTimelineEntry(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as IncidentTimelineEntryType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,details: null == details ? _self._details : details // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
