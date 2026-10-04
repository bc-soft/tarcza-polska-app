// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerificationQuestion {

 String get verificationId; String get incidentId; ReportType get type; String get typeLabel; String get question; String get context;/// Point verification: the station / shelter the question is about (show its name; it may be a neighbour of the reported one)
 Poi? get poi; List<VerificationAnswer> get options; DateTime get sentAt; DateTime get expiresAt; bool get answered;
/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerificationQuestionCopyWith<VerificationQuestion> get copyWith => _$VerificationQuestionCopyWithImpl<VerificationQuestion>(this as VerificationQuestion, _$identity);

  /// Serializes this VerificationQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VerificationQuestion;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerificationQuestion&&(identical(other.verificationId, _this.verificationId) || other.verificationId == _this.verificationId)&&(identical(other.incidentId, _this.incidentId) || other.incidentId == _this.incidentId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.typeLabel, _this.typeLabel) || other.typeLabel == _this.typeLabel)&&(identical(other.question, _this.question) || other.question == _this.question)&&(identical(other.context, _this.context) || other.context == _this.context)&&(identical(other.poi, _this.poi) || other.poi == _this.poi)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.answered, _this.answered) || other.answered == _this.answered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VerificationQuestion;
  return Object.hash(runtimeType,_this.verificationId,_this.incidentId,_this.type,_this.typeLabel,_this.question,_this.context,_this.poi,const DeepCollectionEquality().hash(_this.options),_this.sentAt,_this.expiresAt,_this.answered);
}

@override
String toString() {
  final _this = this as VerificationQuestion;
  return 'VerificationQuestion(verificationId: ${_this.verificationId}, incidentId: ${_this.incidentId}, type: ${_this.type}, typeLabel: ${_this.typeLabel}, question: ${_this.question}, context: ${_this.context}, poi: ${_this.poi}, options: ${_this.options}, sentAt: ${_this.sentAt}, expiresAt: ${_this.expiresAt}, answered: ${_this.answered})';
}


}

/// @nodoc
abstract mixin class $VerificationQuestionCopyWith<$Res>  {
  factory $VerificationQuestionCopyWith(VerificationQuestion value, $Res Function(VerificationQuestion) _then) = _$VerificationQuestionCopyWithImpl;
@useResult
$Res call({
 String verificationId, String incidentId, ReportType type, String typeLabel, String question, String context, Poi? poi, List<VerificationAnswer> options, DateTime sentAt, DateTime expiresAt, bool answered
});


$PoiCopyWith<$Res>? get poi;

}
/// @nodoc
class _$VerificationQuestionCopyWithImpl<$Res>
    implements $VerificationQuestionCopyWith<$Res> {
  _$VerificationQuestionCopyWithImpl(this._self, this._then);

  final VerificationQuestion _self;
  final $Res Function(VerificationQuestion) _then;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verificationId = null,Object? incidentId = null,Object? type = null,Object? typeLabel = null,Object? question = null,Object? context = null,Object? poi = freezed,Object? options = null,Object? sentAt = null,Object? expiresAt = null,Object? answered = null,}) {
  return _then(VerificationQuestion(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,poi: freezed == poi ? _self.poi : poi // ignore: cast_nullable_to_non_nullable
as Poi?,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<VerificationAnswer>,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PoiCopyWith<$Res>? get poi {
    if (_self.poi == null) {
    return null;
  }

  return $PoiCopyWith<$Res>(_self.poi!, (value) {
    return _then(_self.copyWith(poi: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  ReportType type,  String typeLabel,  String question,  String context,  Poi? poi,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.poi,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String verificationId,  String incidentId,  ReportType type,  String typeLabel,  String question,  String context,  Poi? poi,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)  $default,) {final _that = this;
switch (_that) {
case _VerificationQuestion():
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.poi,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String verificationId,  String incidentId,  ReportType type,  String typeLabel,  String question,  String context,  Poi? poi,  List<VerificationAnswer> options,  DateTime sentAt,  DateTime expiresAt,  bool answered)?  $default,) {final _that = this;
switch (_that) {
case _VerificationQuestion() when $default != null:
return $default(_that.verificationId,_that.incidentId,_that.type,_that.typeLabel,_that.question,_that.context,_that.poi,_that.options,_that.sentAt,_that.expiresAt,_that.answered);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerificationQuestion implements VerificationQuestion {
  const _VerificationQuestion({required this.verificationId, required this.incidentId, required this.type, required this.typeLabel, required this.question, required this.context, required this.poi, required  List<VerificationAnswer> options, required this.sentAt, required this.expiresAt, required this.answered}): _options = options;
  factory _VerificationQuestion.fromJson(Map<String, dynamic> json) => _$VerificationQuestionFromJson(json);

@override final  String verificationId;
@override final  String incidentId;
@override final  ReportType type;
@override final  String typeLabel;
@override final  String question;
@override final  String context;
/// Point verification: the station / shelter the question is about (show its name; it may be a neighbour of the reported one)
@override final  Poi? poi;
 final  List<VerificationAnswer> _options;
@override List<VerificationAnswer> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  DateTime sentAt;
@override final  DateTime expiresAt;
@override final  bool answered;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerificationQuestionCopyWith<_VerificationQuestion> get copyWith => __$VerificationQuestionCopyWithImpl<_VerificationQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerificationQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerificationQuestion&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.incidentId, incidentId) || other.incidentId == incidentId)&&(identical(other.type, type) || other.type == type)&&(identical(other.typeLabel, typeLabel) || other.typeLabel == typeLabel)&&(identical(other.question, question) || other.question == question)&&(identical(other.context, context) || other.context == context)&&(identical(other.poi, poi) || other.poi == poi)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.answered, answered) || other.answered == answered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,verificationId,incidentId,type,typeLabel,question,context,poi,const DeepCollectionEquality().hash(_options),sentAt,expiresAt,answered);
}

@override
String toString() {
    return 'VerificationQuestion(verificationId: $verificationId, incidentId: $incidentId, type: $type, typeLabel: $typeLabel, question: $question, context: $context, poi: $poi, options: $options, sentAt: $sentAt, expiresAt: $expiresAt, answered: $answered)';
}


}

/// @nodoc
abstract mixin class _$VerificationQuestionCopyWith<$Res> implements $VerificationQuestionCopyWith<$Res> {
  factory _$VerificationQuestionCopyWith(_VerificationQuestion value, $Res Function(_VerificationQuestion) _then) = __$VerificationQuestionCopyWithImpl;
@override @useResult
$Res call({
 String verificationId, String incidentId, ReportType type, String typeLabel, String question, String context, Poi? poi, List<VerificationAnswer> options, DateTime sentAt, DateTime expiresAt, bool answered
});


@override $PoiCopyWith<$Res>? get poi;

}
/// @nodoc
class __$VerificationQuestionCopyWithImpl<$Res>
    implements _$VerificationQuestionCopyWith<$Res> {
  __$VerificationQuestionCopyWithImpl(this._self, this._then);

  final _VerificationQuestion _self;
  final $Res Function(_VerificationQuestion) _then;

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? incidentId = null,Object? type = null,Object? typeLabel = null,Object? question = null,Object? context = null,Object? poi = freezed,Object? options = null,Object? sentAt = null,Object? expiresAt = null,Object? answered = null,}) {
  return _then(_VerificationQuestion(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,incidentId: null == incidentId ? _self.incidentId : incidentId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReportType,typeLabel: null == typeLabel ? _self.typeLabel : typeLabel // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as String,poi: freezed == poi ? _self.poi : poi // ignore: cast_nullable_to_non_nullable
as Poi?,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<VerificationAnswer>,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of VerificationQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PoiCopyWith<$Res>? get poi {
    if (_self.poi == null) {
    return null;
  }

  return $PoiCopyWith<$Res>(_self.poi!, (value) {
    return _then(_self.copyWith(poi: value));
  });
}
}

// dart format on
