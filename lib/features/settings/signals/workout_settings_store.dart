import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';
import 'package:wiseworkout/features/timer/models/timer_configuration_model.dart';

/// ============================================================================
/// ROLE: CONFIGURATION STORE
/// ============================================================================
///
/// [WorkoutSettingsStore] manages the user-configured settings for active workout timers.
///
/// It is responsible ONLY for handling configuration settings (such as work/rest intervals,
/// set counts, and sound setup) configured BEFORE starting a session. It is completely
/// isolated from the live workout execution countdown.
class WorkoutSettingsStore {
  /// The duration (in seconds) of active work intervals.
  final Signal<int> workTime = Signal<int>(
    90,
    options: const SignalOptions(name: ' WORK TIME '),
  );

  /// The duration (in seconds) of rest intervals.
  final Signal<int> restTime = Signal<int>(
    15,
    options: const SignalOptions(name: ' REST TIME '),
  );

  /// The total number of sets planned for the workout.
  final Signal<int> totalSets = Signal<int>(
    2,
    options: const SignalOptions(name: ' TOTAL SETS '),
  );

  /// The active set cycle sequence.
  final Signal<int> numberOfSets = Signal<int>(
    1,
    options: const SignalOptions(name: ' NUMBER OF SETS '),
  );

  /// The current summarized set index.
  final Signal<int> summarizeSet = Signal<int>(
    0,
    options: const SignalOptions(name: ' CURRENT SET '),
  );

  /// Total work time summarized across active intervals.
  final Signal<int> summarizeWorkTime = Signal<int>(
    0,
    options: const SignalOptions(name: ' CURRENT SET '),
  );

  /// Total rest time summarized across active intervals.
  final Signal<int> summarizeRestTime = Signal<int>(
    0,
    options: const SignalOptions(name: ' CURRENT SET '),
  );

  /// Whether the UI utilizes a circular visual countdown representation.
  final Signal<bool> useCircularTimer = Signal<bool>(
    false,
    options: const SignalOptions(name: ' CIRCULAR TIMER '),
  );

  /// Tracks if audio signals are actively triggering/enabled.
  final Signal<bool> isSoundActive = Signal<bool>(
    false,
    options: const SignalOptions(name: ' SOUND ACTIVATING '),
  );

  /// The underlying immutable model containing preset configurations and properties.
  final Signal<TimerConfigurationModel> timerConf = Signal<TimerConfigurationModel>(
    TimerConfigurationModel.empty,
    options: const SignalOptions(name: ' SETTINGS '),
  );

  /// Loads configuration settings from the SharedPreferences cache.
  Future<void> loadFromCache(CacheService cacheService) async {
    final SharedPreferencesWithCache prefs = await cacheService.prefsWithCache;
    final String? jsonStr = prefs.getString(timerConfigurationKey);
    if (jsonStr != null) {
      try {
        final Map<String, dynamic> json = jsonDecode(jsonStr) as Map<String, dynamic>;
        final TimerConfigurationModel conf = TimerConfigurationModel.fromJson(json);
        workTime.value = conf.workDuration;
        restTime.value = conf.restDuration;
        totalSets.value = conf.numberOfSets;
        useCircularTimer.value = conf.useCircularTimer;
        isSoundActive.value = conf.soundSelected;
        timerConf.value = conf;

        summarizeWorkTime.value = conf.workDuration;
        summarizeRestTime.value = conf.restDuration;
        summarizeSet.value = conf.numberOfSets;
      } on Exception catch (e) {
        if (kDebugMode) {
          print('Error loading settings from cache: $e');
        }
      }
    } else {
      // Default initial states if cache is empty
      workTime.value = 90;
      restTime.value = 15;
      totalSets.value = 2;
      useCircularTimer.value = false;
      isSoundActive.value = false;

      summarizeWorkTime.value = 90;
      summarizeRestTime.value = 15;
      summarizeSet.value = 2;
    }
  }

  /// Resets all settings configuration signals back to their factory default values.
  void reset() {
    workTime.value = 90;
    restTime.value = 15;
    totalSets.value = 2;
    numberOfSets.value = 1;
    summarizeSet.value = 0;
    summarizeWorkTime.value = 0;
    summarizeRestTime.value = 0;
    useCircularTimer.value = false;
    isSoundActive.value = false;
    timerConf.value = TimerConfigurationModel.empty;
  }
}
