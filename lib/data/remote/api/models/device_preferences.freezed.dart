// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DevicePreferences {

/// Receive the location_refresh reminder push (default true)
 bool get locationRefresh;
/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DevicePreferencesCopyWith<DevicePreferences> get copyWith => _$DevicePreferencesCopyWithImpl<DevicePreferences>(this as DevicePreferences, _$identity);

  /// Serializes this DevicePreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DevicePreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DevicePreferences&&(identical(other.locationRefresh, _this.locationRefresh) || other.locationRefresh == _this.locationRefresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DevicePreferences;
  return Object.hash(runtimeType,_this.locationRefresh);
}

@override
String toString() {
  final _this = this as DevicePreferences;
  return 'DevicePreferences(locationRefresh: ${_this.locationRefresh})';
}


}

/// @nodoc
abstract mixin class $DevicePreferencesCopyWith<$Res>  {
  factory $DevicePreferencesCopyWith(DevicePreferences value, $Res Function(DevicePreferences) _then) = _$DevicePreferencesCopyWithImpl;
@useResult
$Res call({
 bool locationRefresh
});




}
/// @nodoc
class _$DevicePreferencesCopyWithImpl<$Res>
    implements $DevicePreferencesCopyWith<$Res> {
  _$DevicePreferencesCopyWithImpl(this._self, this._then);

  final DevicePreferences _self;
  final $Res Function(DevicePreferences) _then;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locationRefresh = null,}) {
  return _then(DevicePreferences(
locationRefresh: null == locationRefresh ? _self.locationRefresh : locationRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DevicePreferences].
extension DevicePreferencesPatterns on DevicePreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DevicePreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DevicePreferences value)  $default,){
final _that = this;
switch (_that) {
case _DevicePreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DevicePreferences value)?  $default,){
final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool locationRefresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
return $default(_that.locationRefresh);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool locationRefresh)  $default,) {final _that = this;
switch (_that) {
case _DevicePreferences():
return $default(_that.locationRefresh);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool locationRefresh)?  $default,) {final _that = this;
switch (_that) {
case _DevicePreferences() when $default != null:
return $default(_that.locationRefresh);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DevicePreferences implements DevicePreferences {
  const _DevicePreferences({required this.locationRefresh});
  factory _DevicePreferences.fromJson(Map<String, dynamic> json) => _$DevicePreferencesFromJson(json);

/// Receive the location_refresh reminder push (default true)
@override final  bool locationRefresh;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DevicePreferencesCopyWith<_DevicePreferences> get copyWith => __$DevicePreferencesCopyWithImpl<_DevicePreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DevicePreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DevicePreferences&&(identical(other.locationRefresh, locationRefresh) || other.locationRefresh == locationRefresh));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,locationRefresh);
}

@override
String toString() {
    return 'DevicePreferences(locationRefresh: $locationRefresh)';
}


}

/// @nodoc
abstract mixin class _$DevicePreferencesCopyWith<$Res> implements $DevicePreferencesCopyWith<$Res> {
  factory _$DevicePreferencesCopyWith(_DevicePreferences value, $Res Function(_DevicePreferences) _then) = __$DevicePreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool locationRefresh
});




}
/// @nodoc
class __$DevicePreferencesCopyWithImpl<$Res>
    implements _$DevicePreferencesCopyWith<$Res> {
  __$DevicePreferencesCopyWithImpl(this._self, this._then);

  final _DevicePreferences _self;
  final $Res Function(_DevicePreferences) _then;

/// Create a copy of DevicePreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locationRefresh = null,}) {
  return _then(_DevicePreferences(
locationRefresh: null == locationRefresh ? _self.locationRefresh : locationRefresh // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
