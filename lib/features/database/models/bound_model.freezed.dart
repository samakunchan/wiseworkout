// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bound_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoundModel {

 double get min; double get max; double get value;// Doit etre entre le min et max
@JsonKey(name: 'bound_name') String get name;// workDuration, restDuration, divisions
 int? get id;
/// Create a copy of BoundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoundModelCopyWith<BoundModel> get copyWith => _$BoundModelCopyWithImpl<BoundModel>(this as BoundModel, _$identity);

  /// Serializes this BoundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoundModel&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.value, value) || other.value == value)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max,value,name,id);

@override
String toString() {
  return 'BoundModel(min: $min, max: $max, value: $value, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $BoundModelCopyWith<$Res>  {
  factory $BoundModelCopyWith(BoundModel value, $Res Function(BoundModel) _then) = _$BoundModelCopyWithImpl;
@useResult
$Res call({
 double min, double max, double value,@JsonKey(name: 'bound_name') String name, int? id
});




}
/// @nodoc
class _$BoundModelCopyWithImpl<$Res>
    implements $BoundModelCopyWith<$Res> {
  _$BoundModelCopyWithImpl(this._self, this._then);

  final BoundModel _self;
  final $Res Function(BoundModel) _then;

/// Create a copy of BoundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,Object? value = null,Object? name = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BoundModel].
extension BoundModelPatterns on BoundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoundModel value)  $default,){
final _that = this;
switch (_that) {
case _BoundModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoundModel value)?  $default,){
final _that = this;
switch (_that) {
case _BoundModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double min,  double max,  double value, @JsonKey(name: 'bound_name')  String name,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoundModel() when $default != null:
return $default(_that.min,_that.max,_that.value,_that.name,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double min,  double max,  double value, @JsonKey(name: 'bound_name')  String name,  int? id)  $default,) {final _that = this;
switch (_that) {
case _BoundModel():
return $default(_that.min,_that.max,_that.value,_that.name,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double min,  double max,  double value, @JsonKey(name: 'bound_name')  String name,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _BoundModel() when $default != null:
return $default(_that.min,_that.max,_that.value,_that.name,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BoundModel implements BoundModel {
  const _BoundModel({required this.min, required this.max, required this.value, @JsonKey(name: 'bound_name') required this.name, this.id});
  factory _BoundModel.fromJson(Map<String, dynamic> json) => _$BoundModelFromJson(json);

@override final  double min;
@override final  double max;
@override final  double value;
// Doit etre entre le min et max
@override@JsonKey(name: 'bound_name') final  String name;
// workDuration, restDuration, divisions
@override final  int? id;

/// Create a copy of BoundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoundModelCopyWith<_BoundModel> get copyWith => __$BoundModelCopyWithImpl<_BoundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoundModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoundModel&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.value, value) || other.value == value)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max,value,name,id);

@override
String toString() {
  return 'BoundModel(min: $min, max: $max, value: $value, name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$BoundModelCopyWith<$Res> implements $BoundModelCopyWith<$Res> {
  factory _$BoundModelCopyWith(_BoundModel value, $Res Function(_BoundModel) _then) = __$BoundModelCopyWithImpl;
@override @useResult
$Res call({
 double min, double max, double value,@JsonKey(name: 'bound_name') String name, int? id
});




}
/// @nodoc
class __$BoundModelCopyWithImpl<$Res>
    implements _$BoundModelCopyWith<$Res> {
  __$BoundModelCopyWithImpl(this._self, this._then);

  final _BoundModel _self;
  final $Res Function(_BoundModel) _then;

/// Create a copy of BoundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,Object? value = null,Object? name = null,Object? id = freezed,}) {
  return _then(_BoundModel(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
