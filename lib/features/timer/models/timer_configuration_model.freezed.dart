// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_configuration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerConfigurationModel {

 int get workDuration; int get restDuration; int get numberOfSets; bool get useCircularTimer; int get pauseDuration; bool get soundSelected; String? get configName; int? get presetId;
/// Create a copy of TimerConfigurationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerConfigurationModelCopyWith<TimerConfigurationModel> get copyWith => _$TimerConfigurationModelCopyWithImpl<TimerConfigurationModel>(this as TimerConfigurationModel, _$identity);

  /// Serializes this TimerConfigurationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerConfigurationModel&&(identical(other.workDuration, workDuration) || other.workDuration == workDuration)&&(identical(other.restDuration, restDuration) || other.restDuration == restDuration)&&(identical(other.numberOfSets, numberOfSets) || other.numberOfSets == numberOfSets)&&(identical(other.useCircularTimer, useCircularTimer) || other.useCircularTimer == useCircularTimer)&&(identical(other.pauseDuration, pauseDuration) || other.pauseDuration == pauseDuration)&&(identical(other.soundSelected, soundSelected) || other.soundSelected == soundSelected)&&(identical(other.configName, configName) || other.configName == configName)&&(identical(other.presetId, presetId) || other.presetId == presetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workDuration,restDuration,numberOfSets,useCircularTimer,pauseDuration,soundSelected,configName,presetId);

@override
String toString() {
  return 'TimerConfigurationModel(workDuration: $workDuration, restDuration: $restDuration, numberOfSets: $numberOfSets, useCircularTimer: $useCircularTimer, pauseDuration: $pauseDuration, soundSelected: $soundSelected, configName: $configName, presetId: $presetId)';
}


}

/// @nodoc
abstract mixin class $TimerConfigurationModelCopyWith<$Res>  {
  factory $TimerConfigurationModelCopyWith(TimerConfigurationModel value, $Res Function(TimerConfigurationModel) _then) = _$TimerConfigurationModelCopyWithImpl;
@useResult
$Res call({
 int workDuration, int restDuration, int numberOfSets, bool useCircularTimer, int pauseDuration, bool soundSelected, String? configName, int? presetId
});




}
/// @nodoc
class _$TimerConfigurationModelCopyWithImpl<$Res>
    implements $TimerConfigurationModelCopyWith<$Res> {
  _$TimerConfigurationModelCopyWithImpl(this._self, this._then);

  final TimerConfigurationModel _self;
  final $Res Function(TimerConfigurationModel) _then;

/// Create a copy of TimerConfigurationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workDuration = null,Object? restDuration = null,Object? numberOfSets = null,Object? useCircularTimer = null,Object? pauseDuration = null,Object? soundSelected = null,Object? configName = freezed,Object? presetId = freezed,}) {
  return _then(_self.copyWith(
workDuration: null == workDuration ? _self.workDuration : workDuration // ignore: cast_nullable_to_non_nullable
as int,restDuration: null == restDuration ? _self.restDuration : restDuration // ignore: cast_nullable_to_non_nullable
as int,numberOfSets: null == numberOfSets ? _self.numberOfSets : numberOfSets // ignore: cast_nullable_to_non_nullable
as int,useCircularTimer: null == useCircularTimer ? _self.useCircularTimer : useCircularTimer // ignore: cast_nullable_to_non_nullable
as bool,pauseDuration: null == pauseDuration ? _self.pauseDuration : pauseDuration // ignore: cast_nullable_to_non_nullable
as int,soundSelected: null == soundSelected ? _self.soundSelected : soundSelected // ignore: cast_nullable_to_non_nullable
as bool,configName: freezed == configName ? _self.configName : configName // ignore: cast_nullable_to_non_nullable
as String?,presetId: freezed == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerConfigurationModel].
extension TimerConfigurationModelPatterns on TimerConfigurationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerConfigurationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerConfigurationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerConfigurationModel value)  $default,){
final _that = this;
switch (_that) {
case _TimerConfigurationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerConfigurationModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimerConfigurationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int workDuration,  int restDuration,  int numberOfSets,  bool useCircularTimer,  int pauseDuration,  bool soundSelected,  String? configName,  int? presetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerConfigurationModel() when $default != null:
return $default(_that.workDuration,_that.restDuration,_that.numberOfSets,_that.useCircularTimer,_that.pauseDuration,_that.soundSelected,_that.configName,_that.presetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int workDuration,  int restDuration,  int numberOfSets,  bool useCircularTimer,  int pauseDuration,  bool soundSelected,  String? configName,  int? presetId)  $default,) {final _that = this;
switch (_that) {
case _TimerConfigurationModel():
return $default(_that.workDuration,_that.restDuration,_that.numberOfSets,_that.useCircularTimer,_that.pauseDuration,_that.soundSelected,_that.configName,_that.presetId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int workDuration,  int restDuration,  int numberOfSets,  bool useCircularTimer,  int pauseDuration,  bool soundSelected,  String? configName,  int? presetId)?  $default,) {final _that = this;
switch (_that) {
case _TimerConfigurationModel() when $default != null:
return $default(_that.workDuration,_that.restDuration,_that.numberOfSets,_that.useCircularTimer,_that.pauseDuration,_that.soundSelected,_that.configName,_that.presetId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerConfigurationModel implements TimerConfigurationModel {
  const _TimerConfigurationModel({required this.workDuration, required this.restDuration, this.numberOfSets = InitialWorkoutSettings.numberOfSets, this.useCircularTimer = InitialWorkoutSettings.useCircularTimer, this.pauseDuration = InitialWorkoutSettings.pauseDuration, this.soundSelected = InitialWorkoutSettings.soundSelected, this.configName, this.presetId});
  factory _TimerConfigurationModel.fromJson(Map<String, dynamic> json) => _$TimerConfigurationModelFromJson(json);

@override final  int workDuration;
@override final  int restDuration;
@override@JsonKey() final  int numberOfSets;
@override@JsonKey() final  bool useCircularTimer;
@override@JsonKey() final  int pauseDuration;
@override@JsonKey() final  bool soundSelected;
@override final  String? configName;
@override final  int? presetId;

/// Create a copy of TimerConfigurationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerConfigurationModelCopyWith<_TimerConfigurationModel> get copyWith => __$TimerConfigurationModelCopyWithImpl<_TimerConfigurationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerConfigurationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerConfigurationModel&&(identical(other.workDuration, workDuration) || other.workDuration == workDuration)&&(identical(other.restDuration, restDuration) || other.restDuration == restDuration)&&(identical(other.numberOfSets, numberOfSets) || other.numberOfSets == numberOfSets)&&(identical(other.useCircularTimer, useCircularTimer) || other.useCircularTimer == useCircularTimer)&&(identical(other.pauseDuration, pauseDuration) || other.pauseDuration == pauseDuration)&&(identical(other.soundSelected, soundSelected) || other.soundSelected == soundSelected)&&(identical(other.configName, configName) || other.configName == configName)&&(identical(other.presetId, presetId) || other.presetId == presetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workDuration,restDuration,numberOfSets,useCircularTimer,pauseDuration,soundSelected,configName,presetId);

@override
String toString() {
  return 'TimerConfigurationModel(workDuration: $workDuration, restDuration: $restDuration, numberOfSets: $numberOfSets, useCircularTimer: $useCircularTimer, pauseDuration: $pauseDuration, soundSelected: $soundSelected, configName: $configName, presetId: $presetId)';
}


}

/// @nodoc
abstract mixin class _$TimerConfigurationModelCopyWith<$Res> implements $TimerConfigurationModelCopyWith<$Res> {
  factory _$TimerConfigurationModelCopyWith(_TimerConfigurationModel value, $Res Function(_TimerConfigurationModel) _then) = __$TimerConfigurationModelCopyWithImpl;
@override @useResult
$Res call({
 int workDuration, int restDuration, int numberOfSets, bool useCircularTimer, int pauseDuration, bool soundSelected, String? configName, int? presetId
});




}
/// @nodoc
class __$TimerConfigurationModelCopyWithImpl<$Res>
    implements _$TimerConfigurationModelCopyWith<$Res> {
  __$TimerConfigurationModelCopyWithImpl(this._self, this._then);

  final _TimerConfigurationModel _self;
  final $Res Function(_TimerConfigurationModel) _then;

/// Create a copy of TimerConfigurationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workDuration = null,Object? restDuration = null,Object? numberOfSets = null,Object? useCircularTimer = null,Object? pauseDuration = null,Object? soundSelected = null,Object? configName = freezed,Object? presetId = freezed,}) {
  return _then(_TimerConfigurationModel(
workDuration: null == workDuration ? _self.workDuration : workDuration // ignore: cast_nullable_to_non_nullable
as int,restDuration: null == restDuration ? _self.restDuration : restDuration // ignore: cast_nullable_to_non_nullable
as int,numberOfSets: null == numberOfSets ? _self.numberOfSets : numberOfSets // ignore: cast_nullable_to_non_nullable
as int,useCircularTimer: null == useCircularTimer ? _self.useCircularTimer : useCircularTimer // ignore: cast_nullable_to_non_nullable
as bool,pauseDuration: null == pauseDuration ? _self.pauseDuration : pauseDuration // ignore: cast_nullable_to_non_nullable
as int,soundSelected: null == soundSelected ? _self.soundSelected : soundSelected // ignore: cast_nullable_to_non_nullable
as bool,configName: freezed == configName ? _self.configName : configName // ignore: cast_nullable_to_non_nullable
as String?,presetId: freezed == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
