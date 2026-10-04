// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'procedure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Procedure {

 String get id; String get title; String get summary; List<String> get steps;/// Empty = general procedure
 List<ReportType> get appliesTo;/// Higher first
 int get priority;
/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcedureCopyWith<Procedure> get copyWith => _$ProcedureCopyWithImpl<Procedure>(this as Procedure, _$identity);

  /// Serializes this Procedure to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Procedure;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Procedure&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&const DeepCollectionEquality().equals(other.appliesTo, _this.appliesTo)&&(identical(other.priority, _this.priority) || other.priority == _this.priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Procedure;
  return Object.hash(runtimeType,_this.id,_this.title,_this.summary,const DeepCollectionEquality().hash(_this.steps),const DeepCollectionEquality().hash(_this.appliesTo),_this.priority);
}

@override
String toString() {
  final _this = this as Procedure;
  return 'Procedure(id: ${_this.id}, title: ${_this.title}, summary: ${_this.summary}, steps: ${_this.steps}, appliesTo: ${_this.appliesTo}, priority: ${_this.priority})';
}


}

/// @nodoc
abstract mixin class $ProcedureCopyWith<$Res>  {
  factory $ProcedureCopyWith(Procedure value, $Res Function(Procedure) _then) = _$ProcedureCopyWithImpl;
@useResult
$Res call({
 String id, String title, String summary, List<String> steps, List<ReportType> appliesTo, int priority
});




}
/// @nodoc
class _$ProcedureCopyWithImpl<$Res>
    implements $ProcedureCopyWith<$Res> {
  _$ProcedureCopyWithImpl(this._self, this._then);

  final Procedure _self;
  final $Res Function(Procedure) _then;

/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? steps = null,Object? appliesTo = null,Object? priority = null,}) {
  return _then(Procedure(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as List<ReportType>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Procedure].
extension ProcedurePatterns on Procedure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Procedure value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Procedure() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Procedure value)  $default,){
final _that = this;
switch (_that) {
case _Procedure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Procedure value)?  $default,){
final _that = this;
switch (_that) {
case _Procedure() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  List<String> steps,  List<ReportType> appliesTo,  int priority)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Procedure() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.steps,_that.appliesTo,_that.priority);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String summary,  List<String> steps,  List<ReportType> appliesTo,  int priority)  $default,) {final _that = this;
switch (_that) {
case _Procedure():
return $default(_that.id,_that.title,_that.summary,_that.steps,_that.appliesTo,_that.priority);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String summary,  List<String> steps,  List<ReportType> appliesTo,  int priority)?  $default,) {final _that = this;
switch (_that) {
case _Procedure() when $default != null:
return $default(_that.id,_that.title,_that.summary,_that.steps,_that.appliesTo,_that.priority);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Procedure implements Procedure {
  const _Procedure({required this.id, required this.title, required this.summary, required  List<String> steps, required  List<ReportType> appliesTo, required this.priority}): _steps = steps,_appliesTo = appliesTo;
  factory _Procedure.fromJson(Map<String, dynamic> json) => _$ProcedureFromJson(json);

@override final  String id;
@override final  String title;
@override final  String summary;
 final  List<String> _steps;
@override List<String> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

/// Empty = general procedure
 final  List<ReportType> _appliesTo;
/// Empty = general procedure
@override List<ReportType> get appliesTo {
  if (_appliesTo is EqualUnmodifiableListView) return _appliesTo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_appliesTo);
}

/// Higher first
@override final  int priority;

/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcedureCopyWith<_Procedure> get copyWith => __$ProcedureCopyWithImpl<_Procedure>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcedureToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Procedure&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.steps, _steps)&&const DeepCollectionEquality().equals(other.appliesTo, _appliesTo)&&(identical(other.priority, priority) || other.priority == priority));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,summary,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_appliesTo),priority);
}

@override
String toString() {
    return 'Procedure(id: $id, title: $title, summary: $summary, steps: $steps, appliesTo: $appliesTo, priority: $priority)';
}


}

/// @nodoc
abstract mixin class _$ProcedureCopyWith<$Res> implements $ProcedureCopyWith<$Res> {
  factory _$ProcedureCopyWith(_Procedure value, $Res Function(_Procedure) _then) = __$ProcedureCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String summary, List<String> steps, List<ReportType> appliesTo, int priority
});




}
/// @nodoc
class __$ProcedureCopyWithImpl<$Res>
    implements _$ProcedureCopyWith<$Res> {
  __$ProcedureCopyWithImpl(this._self, this._then);

  final _Procedure _self;
  final $Res Function(_Procedure) _then;

/// Create a copy of Procedure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? summary = null,Object? steps = null,Object? appliesTo = null,Object? priority = null,}) {
  return _then(_Procedure(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<String>,appliesTo: null == appliesTo ? _self._appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as List<ReportType>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
