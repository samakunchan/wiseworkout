import 'package:signals/signals.dart';
import 'package:wiseworkout/features/sound/enums/enums.dart';
import 'package:wiseworkout/features/sound/signals/workout_settings_store.dart';

/// Represents the status transitions of the running workout timer.

/// ============================================================================
/// ROLE: RUNTIME EXECUTION STORE
/// ============================================================================
///
/// [WorkoutEngineStore] manages the active live runtime execution of the workout countdown timer.
///
/// It is responsible ONLY for handling dynamic, second-by-second countdown states (such as
/// elapsed time, current sets, pause breaks, and status transitions) DURING a running session.
class WorkoutEngineStore {
  /// Instantiates the engine store injecting the dependent settings configurations.
  WorkoutEngineStore(this._settingsStore);

  final WorkoutSettingsStore _settingsStore;

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

  /// Resets all active execution countdown signals back to their starting values.
  void reset() {
    status.value = TimerStatus.initial;
    currentTimeCompleted.value = 0;
    currentTime.value = _settingsStore.workTime.value;
    currentPause.value = 0;
    currentSet.value = 1;
    totalBreak.value = 0;
    isWorkTime.value = true;
  }
}
