import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_history_model.freezed.dart';
part 'workout_history_model.g.dart';

@freezed
sealed class WorkoutHistoryModel with _$WorkoutHistoryModel {
  const factory WorkoutHistoryModel({
    required DateTime date,
    @Default(0) int timerPlanned,
    @Default(0) int timerCompleted,
    @Default(0) int pauseDuration,
    @Default(0) int pause,
    int? id,
  }) = _WorkoutHistoryModel;

  factory WorkoutHistoryModel.fromJson(Map<String, dynamic> json) => _$WorkoutHistoryModelFromJson(json);

  static List<WorkoutHistoryModel> fakeDatas = List<WorkoutHistoryModel>.of([
    WorkoutHistoryModel(
      date: DateTime.parse('2025-12-11'),
      timerPlanned: 120,
      timerCompleted: 15,
    ),
    WorkoutHistoryModel(
      date: DateTime.parse('2025-12-11'),
      timerPlanned: 160,
      timerCompleted: 15,
      pauseDuration: 25,
    ),
    WorkoutHistoryModel(
      date: DateTime.parse('2025-12-12'),
      timerPlanned: 30,
      timerCompleted: 15,
      pauseDuration: 50,
    ),
    WorkoutHistoryModel(
      date: DateTime.parse('2025-12-12'),
      timerPlanned: 60,
      timerCompleted: 15,
      pauseDuration: 200,
    ),
  ]);
}
