import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_configuration_model.freezed.dart';
part 'timer_configuration_model.g.dart';

@freezed
sealed class TimerConfigurationModel with _$TimerConfigurationModel {
  const factory TimerConfigurationModel({
    required int workDuration,
    required int restDuration,
    @Default(4) int numberOfSets,
    @Default(false) bool useCircularTimer,
    @Default(0) int pauseDuration,
    @Default(true) bool soundSelected,
    String? configName,
    int? presetId,
  }) = _TimerConfigurationModel;

  factory TimerConfigurationModel.fromJson(Map<String, dynamic> json) => _$TimerConfigurationModelFromJson(json);

  static TimerConfigurationModel empty = TimerConfigurationModel.fromJson(
    <String, dynamic>{
      'workDuration': 90,
      'restDuration': 15,
      'presetId': -1,
      'numberOfSets': 8,
      'useCircularTimer': false,
      'pauseDuration': 0,
      'soundSelected': true,
      'configName': 'No config',
    },
  );
}
