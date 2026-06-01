import 'dart:async';

import 'package:signals/signals.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wiseworkout/features/database/services/database_service.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/sound/services/sound_service.dart';
import 'package:wiseworkout/features/timer/enums/enums.dart';
import 'package:wiseworkout/features/timer/signals/workout_settings_store.dart';

/// Represents the status transitions of the running workout timer.

/// ============================================================================
/// ROLE: RUNTIME EXECUTION STORE / CONTROLLER
/// ============================================================================
///
/// [WorkoutEngineStore] manages the active live runtime execution of the workout countdown timer.
///
/// It is responsible for handling dynamic, second-by-second countdown states (such as
/// elapsed time, current sets, pause breaks, and status transitions) DURING a running session.
class WorkoutEngineStore {
  /// Instantiates the engine store injecting the dependent settings configurations.
  WorkoutEngineStore(this._settingsStore);

  final WorkoutSettingsStore _settingsStore;
  Timer? _timer;

  /// The active state of the timer countdown (working, resting, paused, etc.).
  late final Signal<TimerStatus> status = Signal<TimerStatus>(
    TimerStatus.initial,
    options: const SignalOptions(name: ' TIMER STATUS '),
  );

  /// The total elapsed workout time completed by the user (in seconds).
  final Signal<int> currentTimeCompleted = Signal<int>(
    0,
    options: const SignalOptions(name: ' TIME COMPLETED '),
  );

  /// The remaining seconds in the current active interval (work or rest).
  late final Signal<int> currentTime = Signal<int>(
    _settingsStore.workTime.value,
    options: const SignalOptions(name: ' CURRENT TIME '),
  );

  /// The current total pause duration elapsed in the active interval.
  final Signal<int> currentPause = Signal<int>(
    0,
    options: const SignalOptions(name: ' CURRENT PAUSE '),
  );

  /// The active set cycle currently in progress.
  final Signal<int> currentSet = Signal<int>(
    1,
    options: const SignalOptions(name: ' CURRENT SET '),
  );

  /// The total count of temporary breaks/pauses taken during this session.
  final Signal<int> totalBreak = Signal<int>(
    0,
    options: const SignalOptions(name: ' NUMBER OF BREAK '),
  );

  /// Whether the user is in a work interval (true) or rest interval (false).
  final Signal<bool> isWorkTime = Signal<bool>(
    true,
    options: const SignalOptions(name: ' WORKTIME ACTIVE '),
  );

  /// A computed derived signal indicating whether the timer is currently actively counting down.
  late final ReadonlySignal<bool> isRunning = computed(
    () => status.value == TimerStatus.working || status.value == TimerStatus.resting,
    options: const ComputedOptions(name: ' RUNNING '),
  );

  /// A computed derived signal indicating whether the session has been reset/is at the initial state.
  late final ReadonlySignal<bool> isReseted = computed(
    () => status.value == TimerStatus.initial,
    options: const ComputedOptions(name: ' RESETING '),
  );

  /// A computed derived signal indicating whether the session is complete.
  late final ReadonlySignal<bool> isSessionComplete = computed(
    () => status.value == TimerStatus.completed,
    options: const ComputedOptions(name: ' SESSION COMPLETE '),
  );

  // ===========================================================================
  // Controller Action APIs (Called by the passive UI views)
  // ===========================================================================

  /// Starts or resumes the workout session.
  Future<void> start() async {
    if (isRunning.value) return;

    _playSound('start.mp3');

    if (status.value == TimerStatus.completed) {
      reset();
    }

    // Set the status to working or resting depending on the active interval
    status.value = isWorkTime.value ? TimerStatus.working : TimerStatus.resting;

    _startTimerIfNeeded();
    await WakelockPlus.enable();
  }

  /// Pauses the workout session, moving it to break/pause counting.
  Future<void> pause() async {
    if (!isRunning.value) return;

    _playSound('pause.mp3');
    status.value = TimerStatus.paused;
    totalBreak.value++;
  }

  /// Stops and resets the workout session back to initial values.
  Future<void> reset() async {
    _stopTimer();

    // Automatically save history if we were in the middle of a session and actually made some progress
    if (status.value != TimerStatus.initial && status.value != TimerStatus.completed && currentTimeCompleted.value > 0) {
      await _saveHistory(isFinished: false);
    }

    status.value = TimerStatus.initial;
    currentTimeCompleted.value = 0;
    currentTime.value = _settingsStore.workTime.value;
    currentPause.value = 0;
    currentSet.value = 1;
    totalBreak.value = 0;
    isWorkTime.value = true;

    await WakelockPlus.disable();
  }

  // ===========================================================================
  // Internal Single-Timer Engine Loop
  // ===========================================================================

  void _startTimerIfNeeded() {
    _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      switch (status.value) {
        case TimerStatus.working:
          _handleWorkTick();
          break;
        case TimerStatus.resting:
          _handleRestTick();
          break;
        case TimerStatus.paused:
          _handlePauseTick();
          break;
        case TimerStatus.initial:
        case TimerStatus.completed:
          _stopTimer();
          break;
      }
    });
  }

  void _handleWorkTick() {
    currentTimeCompleted.value++;
    if (currentTime.value > 0) {
      currentTime.value--;
    } else {
      // Transition to rest interval
      isWorkTime.value = false;
      status.value = TimerStatus.resting;
      _playSound('pause.mp3');
      currentTime.value = _settingsStore.restTime.value;
    }
  }

  void _handleRestTick() {
    currentTimeCompleted.value++;
    if (currentTime.value > 0) {
      currentTime.value--;
    } else {
      // Transition to next set or complete
      if (currentSet.value >= _settingsStore.totalSets.value) {
        _completeSession();
      } else {
        currentSet.value++;
        isWorkTime.value = true;
        status.value = TimerStatus.working;
        _playSound('start.mp3');
        currentTime.value = _settingsStore.workTime.value;
      }
    }
  }

  void _handlePauseTick() {
    currentPause.value++;
    currentTimeCompleted.value++;
  }

  void _completeSession() {
    _stopTimer();
    status.value = TimerStatus.completed;
    _playSound('finish.mp3');
    _saveHistory(isFinished: true);
    WakelockPlus.disable();
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _playSound(String asset) {
    if (_settingsStore.timerConf.value.soundSelected) {
      kGetIt<SoundService>().playSound(asset);
    }
  }

  Future<void> _saveHistory({required bool isFinished}) async {
    final double plannedTime = (_settingsStore.totalSets.value * (_settingsStore.workTime.value + _settingsStore.restTime.value))
        .toDouble();

    await kGetIt<AppDatabase>().createHistory(
      HistoryCompanion.insert(
        timerPlanned: plannedTime,
        timerCompleted: currentTimeCompleted.value.toDouble(),
        pauseDuration: currentPause.value.toDouble(),
        pause: totalBreak.value.toDouble(),
        date: DateTime.now(),
      ),
    );
  }
}
