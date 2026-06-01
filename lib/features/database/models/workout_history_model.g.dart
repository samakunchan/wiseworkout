// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutHistoryModel _$WorkoutHistoryModelFromJson(Map<String, dynamic> json) =>
    _WorkoutHistoryModel(
      date: DateTime.parse(json['date'] as String),
      timerPlanned: (json['timerPlanned'] as num?)?.toInt() ?? 0,
      timerCompleted: (json['timerCompleted'] as num?)?.toInt() ?? 0,
      pauseDuration: (json['pauseDuration'] as num?)?.toInt() ?? 0,
      pause: (json['pause'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkoutHistoryModelToJson(
  _WorkoutHistoryModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'timerPlanned': instance.timerPlanned,
  'timerCompleted': instance.timerCompleted,
  'pauseDuration': instance.pauseDuration,
  'pause': instance.pause,
  'id': instance.id,
};
