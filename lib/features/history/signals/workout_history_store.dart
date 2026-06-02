import 'dart:async';
import 'package:signals/signals.dart';
import 'package:wiseworkout/features/database/models/workout_history_model.dart';
import 'package:wiseworkout/features/database/services/database_service.dart';

class WorkoutHistoryStore {
  WorkoutHistoryStore(this._database) {
    _subscription = _database.watchAllHistories().listen((List<WorkoutHistoryModel> list) {
      histories.value = list;
    });
  }

  final AppDatabase _database;
  StreamSubscription<List<WorkoutHistoryModel>>? _subscription;

  final Signal<List<WorkoutHistoryModel>> histories = Signal<List<WorkoutHistoryModel>>(
    const <WorkoutHistoryModel>[],
    options: const SignalOptions(name: ' HISTORIES '),
  );

  void dispose() {
    unawaited(_subscription?.cancel());
  }
}
