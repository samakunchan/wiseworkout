// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutHistoryModel {

 DateTime get date; int get timerPlanned; int get timerCompleted; int get pauseDuration; int get pause; int? get id;
/// Create a copy of WorkoutHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutHistoryModelCopyWith<WorkoutHistoryModel> get copyWith => _$WorkoutHistoryModelCopyWithImpl<WorkoutHistoryModel>(this as WorkoutHistoryModel, _$identity);

  /// Serializes this WorkoutHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryModel&&(identical(other.date, date) || other.date == date)&&(identical(other.timerPlanned, timerPlanned) || other.timerPlanned == timerPlanned)&&(identical(other.timerCompleted, timerCompleted) || other.timerCompleted == timerCompleted)&&(identical(other.pauseDuration, pauseDuration) || other.pauseDuration == pauseDuration)&&(identical(other.pause, pause) || other.pause == pause)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timerPlanned,timerCompleted,pauseDuration,pause,id);

@override
String toString() {
  return 'WorkoutHistoryModel(date: $date, timerPlanned: $timerPlanned, timerCompleted: $timerCompleted, pauseDuration: $pauseDuration, pause: $pause, id: $id)';
}


}

/// @nodoc
abstract mixin class $WorkoutHistoryModelCopyWith<$Res>  {
  factory $WorkoutHistoryModelCopyWith(WorkoutHistoryModel value, $Res Function(WorkoutHistoryModel) _then) = _$WorkoutHistoryModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, int timerPlanned, int timerCompleted, int pauseDuration, int pause, int? id
});




}
/// @nodoc
class _$WorkoutHistoryModelCopyWithImpl<$Res>
    implements $WorkoutHistoryModelCopyWith<$Res> {
  _$WorkoutHistoryModelCopyWithImpl(this._self, this._then);

  final WorkoutHistoryModel _self;
  final $Res Function(WorkoutHistoryModel) _then;

/// Create a copy of WorkoutHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? timerPlanned = null,Object? timerCompleted = null,Object? pauseDuration = null,Object? pause = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,timerPlanned: null == timerPlanned ? _self.timerPlanned : timerPlanned // ignore: cast_nullable_to_non_nullable
as int,timerCompleted: null == timerCompleted ? _self.timerCompleted : timerCompleted // ignore: cast_nullable_to_non_nullable
as int,pauseDuration: null == pauseDuration ? _self.pauseDuration : pauseDuration // ignore: cast_nullable_to_non_nullable
as int,pause: null == pause ? _self.pause : pause // ignore: cast_nullable_to_non_nullable
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutHistoryModel].
extension WorkoutHistoryModelPatterns on WorkoutHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int timerPlanned,  int timerCompleted,  int pauseDuration,  int pause,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutHistoryModel() when $default != null:
return $default(_that.date,_that.timerPlanned,_that.timerCompleted,_that.pauseDuration,_that.pause,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int timerPlanned,  int timerCompleted,  int pauseDuration,  int pause,  int? id)  $default,) {final _that = this;
switch (_that) {
case _WorkoutHistoryModel():
return $default(_that.date,_that.timerPlanned,_that.timerCompleted,_that.pauseDuration,_that.pause,_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int timerPlanned,  int timerCompleted,  int pauseDuration,  int pause,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutHistoryModel() when $default != null:
return $default(_that.date,_that.timerPlanned,_that.timerCompleted,_that.pauseDuration,_that.pause,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutHistoryModel implements WorkoutHistoryModel {
  const _WorkoutHistoryModel({required this.date, this.timerPlanned = 0, this.timerCompleted = 0, this.pauseDuration = 0, this.pause = 0, this.id});
  factory _WorkoutHistoryModel.fromJson(Map<String, dynamic> json) => _$WorkoutHistoryModelFromJson(json);

@override final  DateTime date;
@override@JsonKey() final  int timerPlanned;
@override@JsonKey() final  int timerCompleted;
@override@JsonKey() final  int pauseDuration;
@override@JsonKey() final  int pause;
@override final  int? id;

/// Create a copy of WorkoutHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutHistoryModelCopyWith<_WorkoutHistoryModel> get copyWith => __$WorkoutHistoryModelCopyWithImpl<_WorkoutHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutHistoryModel&&(identical(other.date, date) || other.date == date)&&(identical(other.timerPlanned, timerPlanned) || other.timerPlanned == timerPlanned)&&(identical(other.timerCompleted, timerCompleted) || other.timerCompleted == timerCompleted)&&(identical(other.pauseDuration, pauseDuration) || other.pauseDuration == pauseDuration)&&(identical(other.pause, pause) || other.pause == pause)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timerPlanned,timerCompleted,pauseDuration,pause,id);

@override
String toString() {
  return 'WorkoutHistoryModel(date: $date, timerPlanned: $timerPlanned, timerCompleted: $timerCompleted, pauseDuration: $pauseDuration, pause: $pause, id: $id)';
}


}

/// @nodoc
abstract mixin class _$WorkoutHistoryModelCopyWith<$Res> implements $WorkoutHistoryModelCopyWith<$Res> {
  factory _$WorkoutHistoryModelCopyWith(_WorkoutHistoryModel value, $Res Function(_WorkoutHistoryModel) _then) = __$WorkoutHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int timerPlanned, int timerCompleted, int pauseDuration, int pause, int? id
});




}
/// @nodoc
class __$WorkoutHistoryModelCopyWithImpl<$Res>
    implements _$WorkoutHistoryModelCopyWith<$Res> {
  __$WorkoutHistoryModelCopyWithImpl(this._self, this._then);

  final _WorkoutHistoryModel _self;
  final $Res Function(_WorkoutHistoryModel) _then;

/// Create a copy of WorkoutHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? timerPlanned = null,Object? timerCompleted = null,Object? pauseDuration = null,Object? pause = null,Object? id = freezed,}) {
  return _then(_WorkoutHistoryModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,timerPlanned: null == timerPlanned ? _self.timerPlanned : timerPlanned // ignore: cast_nullable_to_non_nullable
as int,timerCompleted: null == timerCompleted ? _self.timerCompleted : timerCompleted // ignore: cast_nullable_to_non_nullable
as int,pauseDuration: null == pauseDuration ? _self.pauseDuration : pauseDuration // ignore: cast_nullable_to_non_nullable
as int,pause: null == pause ? _self.pause : pause // ignore: cast_nullable_to_non_nullable
as int,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
