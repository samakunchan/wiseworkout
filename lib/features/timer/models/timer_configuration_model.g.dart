// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerConfigurationModel _$TimerConfigurationModelFromJson(
  Map<String, dynamic> json,
) => _TimerConfigurationModel(
  workDuration: (json['workDuration'] as num).toInt(),
  restDuration: (json['restDuration'] as num).toInt(),
  numberOfSets:
      (json['numberOfSets'] as num?)?.toInt() ??
      InitialWorkoutSettings.numberOfSets,
  useCircularTimer:
      json['useCircularTimer'] as bool? ??
      InitialWorkoutSettings.useCircularTimer,
  pauseDuration:
      (json['pauseDuration'] as num?)?.toInt() ??
      InitialWorkoutSettings.pauseDuration,
  soundSelected:
      json['soundSelected'] as bool? ?? InitialWorkoutSettings.soundSelected,
  configName: json['configName'] as String?,
  presetId: (json['presetId'] as num?)?.toInt(),
);

Map<String, dynamic> _$TimerConfigurationModelToJson(
  _TimerConfigurationModel instance,
) => <String, dynamic>{
  'workDuration': instance.workDuration,
  'restDuration': instance.restDuration,
  'numberOfSets': instance.numberOfSets,
  'useCircularTimer': instance.useCircularTimer,
  'pauseDuration': instance.pauseDuration,
  'soundSelected': instance.soundSelected,
  'configName': instance.configName,
  'presetId': instance.presetId,
};
