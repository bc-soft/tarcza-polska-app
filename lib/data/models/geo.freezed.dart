// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeoArea {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoArea);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'GeoArea()';
}


}

/// @nodoc
class $GeoAreaCopyWith<$Res>  {
$GeoAreaCopyWith(GeoArea _, $Res Function(GeoArea) __);
}


/// Adds pattern-matching-related methods to [GeoArea].
extension GeoAreaPatterns on GeoArea {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GeoPointArea value)?  point,TResult Function( GeoPolygonArea value)?  polygons,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GeoPointArea() when point != null:
return point(_that);case GeoPolygonArea() when polygons != null:
return polygons(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GeoPointArea value)  point,required TResult Function( GeoPolygonArea value)  polygons,}){
final _that = this;
switch (_that) {
case GeoPointArea():
return point(_that);case GeoPolygonArea():
return polygons(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GeoPointArea value)?  point,TResult? Function( GeoPolygonArea value)?  polygons,}){
final _that = this;
switch (_that) {
case GeoPointArea() when point != null:
return point(_that);case GeoPolygonArea() when polygons != null:
return polygons(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LatLng point)?  point,TResult Function( List<GeoPolygon> polygons)?  polygons,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GeoPointArea() when point != null:
return point(_that.point);case GeoPolygonArea() when polygons != null:
return polygons(_that.polygons);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LatLng point)  point,required TResult Function( List<GeoPolygon> polygons)  polygons,}) {final _that = this;
switch (_that) {
case GeoPointArea():
return point(_that.point);case GeoPolygonArea():
return polygons(_that.polygons);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LatLng point)?  point,TResult? Function( List<GeoPolygon> polygons)?  polygons,}) {final _that = this;
switch (_that) {
case GeoPointArea() when point != null:
return point(_that.point);case GeoPolygonArea() when polygons != null:
return polygons(_that.polygons);case _:
  return null;

}
}

}

/// @nodoc


class GeoPointArea extends GeoArea {
  const GeoPointArea(this.point): super._();
  

 final  LatLng point;

/// Create a copy of GeoArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPointAreaCopyWith<GeoPointArea> get copyWith => _$GeoPointAreaCopyWithImpl<GeoPointArea>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPointArea&&(identical(other.point, point) || other.point == point));
}


@override
int get hashCode {
    return Object.hash(runtimeType,point);
}

@override
String toString() {
    return 'GeoArea.point(point: $point)';
}


}

/// @nodoc
abstract mixin class $GeoPointAreaCopyWith<$Res> implements $GeoAreaCopyWith<$Res> {
  factory $GeoPointAreaCopyWith(GeoPointArea value, $Res Function(GeoPointArea) _then) = _$GeoPointAreaCopyWithImpl;
@useResult
$Res call({
 LatLng point
});




}
/// @nodoc
class _$GeoPointAreaCopyWithImpl<$Res>
    implements $GeoPointAreaCopyWith<$Res> {
  _$GeoPointAreaCopyWithImpl(this._self, this._then);

  final GeoPointArea _self;
  final $Res Function(GeoPointArea) _then;

/// Create a copy of GeoArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? point = null,}) {
  return _then(GeoPointArea(
null == point ? _self.point : point // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

/// @nodoc


class GeoPolygonArea extends GeoArea {
  const GeoPolygonArea( List<GeoPolygon> polygons): _polygons = polygons,super._();
  

 final  List<GeoPolygon> _polygons;
 List<GeoPolygon> get polygons {
  if (_polygons is EqualUnmodifiableListView) return _polygons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polygons);
}


/// Create a copy of GeoArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPolygonAreaCopyWith<GeoPolygonArea> get copyWith => _$GeoPolygonAreaCopyWithImpl<GeoPolygonArea>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPolygonArea&&const DeepCollectionEquality().equals(other.polygons, _polygons));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_polygons));
}

@override
String toString() {
    return 'GeoArea.polygons(polygons: $polygons)';
}


}

/// @nodoc
abstract mixin class $GeoPolygonAreaCopyWith<$Res> implements $GeoAreaCopyWith<$Res> {
  factory $GeoPolygonAreaCopyWith(GeoPolygonArea value, $Res Function(GeoPolygonArea) _then) = _$GeoPolygonAreaCopyWithImpl;
@useResult
$Res call({
 List<GeoPolygon> polygons
});




}
/// @nodoc
class _$GeoPolygonAreaCopyWithImpl<$Res>
    implements $GeoPolygonAreaCopyWith<$Res> {
  _$GeoPolygonAreaCopyWithImpl(this._self, this._then);

  final GeoPolygonArea _self;
  final $Res Function(GeoPolygonArea) _then;

/// Create a copy of GeoArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? polygons = null,}) {
  return _then(GeoPolygonArea(
null == polygons ? _self._polygons : polygons // ignore: cast_nullable_to_non_nullable
as List<GeoPolygon>,
  ));
}


}

/// @nodoc
mixin _$GeoPolygon {

 List<LatLng> get outer; List<List<LatLng>> get holes;
/// Create a copy of GeoPolygon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeoPolygonCopyWith<GeoPolygon> get copyWith => _$GeoPolygonCopyWithImpl<GeoPolygon>(this as GeoPolygon, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeoPolygon;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeoPolygon&&const DeepCollectionEquality().equals(other.outer, _this.outer)&&const DeepCollectionEquality().equals(other.holes, _this.holes));
}


@override
int get hashCode {
  final _this = this as GeoPolygon;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.outer),const DeepCollectionEquality().hash(_this.holes));
}

@override
String toString() {
  final _this = this as GeoPolygon;
  return 'GeoPolygon(outer: ${_this.outer}, holes: ${_this.holes})';
}


}

/// @nodoc
abstract mixin class $GeoPolygonCopyWith<$Res>  {
  factory $GeoPolygonCopyWith(GeoPolygon value, $Res Function(GeoPolygon) _then) = _$GeoPolygonCopyWithImpl;
@useResult
$Res call({
 List<LatLng> outer, List<List<LatLng>> holes
});




}
/// @nodoc
class _$GeoPolygonCopyWithImpl<$Res>
    implements $GeoPolygonCopyWith<$Res> {
  _$GeoPolygonCopyWithImpl(this._self, this._then);

  final GeoPolygon _self;
  final $Res Function(GeoPolygon) _then;

/// Create a copy of GeoPolygon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? outer = null,Object? holes = null,}) {
  return _then(GeoPolygon(
outer: null == outer ? _self.outer : outer // ignore: cast_nullable_to_non_nullable
as List<LatLng>,holes: null == holes ? _self.holes : holes // ignore: cast_nullable_to_non_nullable
as List<List<LatLng>>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeoPolygon].
extension GeoPolygonPatterns on GeoPolygon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeoPolygon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeoPolygon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeoPolygon value)  $default,){
final _that = this;
switch (_that) {
case _GeoPolygon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeoPolygon value)?  $default,){
final _that = this;
switch (_that) {
case _GeoPolygon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LatLng> outer,  List<List<LatLng>> holes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeoPolygon() when $default != null:
return $default(_that.outer,_that.holes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LatLng> outer,  List<List<LatLng>> holes)  $default,) {final _that = this;
switch (_that) {
case _GeoPolygon():
return $default(_that.outer,_that.holes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LatLng> outer,  List<List<LatLng>> holes)?  $default,) {final _that = this;
switch (_that) {
case _GeoPolygon() when $default != null:
return $default(_that.outer,_that.holes);case _:
  return null;

}
}

}

/// @nodoc


class _GeoPolygon implements GeoPolygon {
  const _GeoPolygon({required  List<LatLng> outer,  List<List<LatLng>> holes = const <List<LatLng>>[]}): _outer = outer,_holes = holes;
  

 final  List<LatLng> _outer;
@override List<LatLng> get outer {
  if (_outer is EqualUnmodifiableListView) return _outer;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outer);
}

 final  List<List<LatLng>> _holes;
@override@JsonKey() List<List<LatLng>> get holes {
  if (_holes is EqualUnmodifiableListView) return _holes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_holes);
}


/// Create a copy of GeoPolygon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeoPolygonCopyWith<_GeoPolygon> get copyWith => __$GeoPolygonCopyWithImpl<_GeoPolygon>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeoPolygon&&const DeepCollectionEquality().equals(other.outer, _outer)&&const DeepCollectionEquality().equals(other.holes, _holes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_outer),const DeepCollectionEquality().hash(_holes));
}

@override
String toString() {
    return 'GeoPolygon(outer: $outer, holes: $holes)';
}


}

/// @nodoc
abstract mixin class _$GeoPolygonCopyWith<$Res> implements $GeoPolygonCopyWith<$Res> {
  factory _$GeoPolygonCopyWith(_GeoPolygon value, $Res Function(_GeoPolygon) _then) = __$GeoPolygonCopyWithImpl;
@override @useResult
$Res call({
 List<LatLng> outer, List<List<LatLng>> holes
});




}
/// @nodoc
class __$GeoPolygonCopyWithImpl<$Res>
    implements _$GeoPolygonCopyWith<$Res> {
  __$GeoPolygonCopyWithImpl(this._self, this._then);

  final _GeoPolygon _self;
  final $Res Function(_GeoPolygon) _then;

/// Create a copy of GeoPolygon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? outer = null,Object? holes = null,}) {
  return _then(_GeoPolygon(
outer: null == outer ? _self._outer : outer // ignore: cast_nullable_to_non_nullable
as List<LatLng>,holes: null == holes ? _self._holes : holes // ignore: cast_nullable_to_non_nullable
as List<List<LatLng>>,
  ));
}


}

/// @nodoc
mixin _$BBox {

 double get minLng; double get minLat; double get maxLng; double get maxLat;
/// Create a copy of BBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BBoxCopyWith<BBox> get copyWith => _$BBoxCopyWithImpl<BBox>(this as BBox, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BBox;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BBox&&(identical(other.minLng, _this.minLng) || other.minLng == _this.minLng)&&(identical(other.minLat, _this.minLat) || other.minLat == _this.minLat)&&(identical(other.maxLng, _this.maxLng) || other.maxLng == _this.maxLng)&&(identical(other.maxLat, _this.maxLat) || other.maxLat == _this.maxLat));
}


@override
int get hashCode {
  final _this = this as BBox;
  return Object.hash(runtimeType,_this.minLng,_this.minLat,_this.maxLng,_this.maxLat);
}

@override
String toString() {
  final _this = this as BBox;
  return 'BBox(minLng: ${_this.minLng}, minLat: ${_this.minLat}, maxLng: ${_this.maxLng}, maxLat: ${_this.maxLat})';
}


}

/// @nodoc
abstract mixin class $BBoxCopyWith<$Res>  {
  factory $BBoxCopyWith(BBox value, $Res Function(BBox) _then) = _$BBoxCopyWithImpl;
@useResult
$Res call({
 double minLng, double minLat, double maxLng, double maxLat
});




}
/// @nodoc
class _$BBoxCopyWithImpl<$Res>
    implements $BBoxCopyWith<$Res> {
  _$BBoxCopyWithImpl(this._self, this._then);

  final BBox _self;
  final $Res Function(BBox) _then;

/// Create a copy of BBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minLng = null,Object? minLat = null,Object? maxLng = null,Object? maxLat = null,}) {
  return _then(BBox(
minLng: null == minLng ? _self.minLng : minLng // ignore: cast_nullable_to_non_nullable
as double,minLat: null == minLat ? _self.minLat : minLat // ignore: cast_nullable_to_non_nullable
as double,maxLng: null == maxLng ? _self.maxLng : maxLng // ignore: cast_nullable_to_non_nullable
as double,maxLat: null == maxLat ? _self.maxLat : maxLat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [BBox].
extension BBoxPatterns on BBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BBox value)  $default,){
final _that = this;
switch (_that) {
case _BBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BBox value)?  $default,){
final _that = this;
switch (_that) {
case _BBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minLng,  double minLat,  double maxLng,  double maxLat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BBox() when $default != null:
return $default(_that.minLng,_that.minLat,_that.maxLng,_that.maxLat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minLng,  double minLat,  double maxLng,  double maxLat)  $default,) {final _that = this;
switch (_that) {
case _BBox():
return $default(_that.minLng,_that.minLat,_that.maxLng,_that.maxLat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minLng,  double minLat,  double maxLng,  double maxLat)?  $default,) {final _that = this;
switch (_that) {
case _BBox() when $default != null:
return $default(_that.minLng,_that.minLat,_that.maxLng,_that.maxLat);case _:
  return null;

}
}

}

/// @nodoc


class _BBox extends BBox {
  const _BBox({required this.minLng, required this.minLat, required this.maxLng, required this.maxLat}): super._();
  

@override final  double minLng;
@override final  double minLat;
@override final  double maxLng;
@override final  double maxLat;

/// Create a copy of BBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BBoxCopyWith<_BBox> get copyWith => __$BBoxCopyWithImpl<_BBox>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BBox&&(identical(other.minLng, minLng) || other.minLng == minLng)&&(identical(other.minLat, minLat) || other.minLat == minLat)&&(identical(other.maxLng, maxLng) || other.maxLng == maxLng)&&(identical(other.maxLat, maxLat) || other.maxLat == maxLat));
}


@override
int get hashCode {
    return Object.hash(runtimeType,minLng,minLat,maxLng,maxLat);
}

@override
String toString() {
    return 'BBox(minLng: $minLng, minLat: $minLat, maxLng: $maxLng, maxLat: $maxLat)';
}


}

/// @nodoc
abstract mixin class _$BBoxCopyWith<$Res> implements $BBoxCopyWith<$Res> {
  factory _$BBoxCopyWith(_BBox value, $Res Function(_BBox) _then) = __$BBoxCopyWithImpl;
@override @useResult
$Res call({
 double minLng, double minLat, double maxLng, double maxLat
});




}
/// @nodoc
class __$BBoxCopyWithImpl<$Res>
    implements _$BBoxCopyWith<$Res> {
  __$BBoxCopyWithImpl(this._self, this._then);

  final _BBox _self;
  final $Res Function(_BBox) _then;

/// Create a copy of BBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minLng = null,Object? minLat = null,Object? maxLng = null,Object? maxLat = null,}) {
  return _then(_BBox(
minLng: null == minLng ? _self.minLng : minLng // ignore: cast_nullable_to_non_nullable
as double,minLat: null == minLat ? _self.minLat : minLat // ignore: cast_nullable_to_non_nullable
as double,maxLng: null == maxLng ? _self.maxLng : maxLng // ignore: cast_nullable_to_non_nullable
as double,maxLat: null == maxLat ? _self.maxLat : maxLat // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
