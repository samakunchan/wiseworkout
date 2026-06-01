import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/helpers.dart';
import 'package:wiseworkout/features/settings/signals/workout_settings_store.dart';
import 'package:wiseworkout/features/timer/models/timer_configuration_model.dart';
import 'package:wiseworkout/features/timer/signals/workout_engine_store.dart';

class SettingSaveButton extends StatelessWidget {
  const SettingSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => saveConfiguration(context: context),
      child: Text(context.localizations.buttonApplyConfiguration),
    );
  }

  Future<void> saveConfiguration({required BuildContext context}) async {
    final WorkoutSettingsStore settings = kGetIt<WorkoutSettingsStore>();
    final CacheService cacheService = kGetIt<CacheService>();
    final SharedPreferencesWithCache cache = await cacheService.prefsWithCache;

    final TimerConfigurationModel conf = TimerConfigurationModel(
      workDuration: settings.workTime.value,
      restDuration: settings.restTime.value,
      numberOfSets: settings.totalSets.value,
      useCircularTimer: settings.useCircularTimer.value,
      soundSelected: settings.isSoundActive.value,
      configName: settings.timerConf.value.configName ?? 'Default',
      presetId: settings.timerConf.value.presetId ?? 1,
    );

    if (kDebugMode) {
      print('Saving configuration to cache...');
    }

    await cache.setString(timerConfigurationKey, jsonEncode(conf.toJson()));
    settings.timerConf.value = conf;

    final WorkoutEngineStore engine = kGetIt<WorkoutEngineStore>();
    if (!engine.isRunning.value) {
      await engine.reset();
    }

    if (!context.mounted) return;
    await AppHelper.backFromSettingsToMainPage(context: context);
  }
}
