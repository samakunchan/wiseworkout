import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiseworkout/features/settings/models/initial_workout_settings.dart';

part 'timer_configuration_model.freezed.dart';
part 'timer_configuration_model.g.dart';

@freezed
sealed class TimerConfigurationModel with _$TimerConfigurationModel {
  const factory TimerConfigurationModel({
    required int workDuration,
    required int restDuration,
    @Default(InitialWorkoutSettings.numberOfSets) int numberOfSets,
    @Default(InitialWorkoutSettings.useCircularTimer) bool useCircularTimer,
    @Default(InitialWorkoutSettings.pauseDuration) int pauseDuration,
    @Default(InitialWorkoutSettings.soundSelected) bool soundSelected,
    String? configName,
    int? presetId,
  }) = _TimerConfigurationModel;

  factory TimerConfigurationModel.fromJson(Map<String, dynamic> json) => _$TimerConfigurationModelFromJson(json);

  static TimerConfigurationModel empty = TimerConfigurationModel.fromJson(
    <String, dynamic>{
      'workDuration': InitialWorkoutSettings.workDuration,
      'restDuration': InitialWorkoutSettings.restDuration,
      'presetId': InitialWorkoutSettings.presetId,
      'numberOfSets': InitialWorkoutSettings.numberOfSets,
      'useCircularTimer': InitialWorkoutSettings.useCircularTimer,
      'pauseDuration': InitialWorkoutSettings.pauseDuration,
      'soundSelected': InitialWorkoutSettings.soundSelected,
      'configName': InitialWorkoutSettings.configName,
    },
  );
}
