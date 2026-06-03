import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';
import 'package:wiseworkout/features/database/services/database_service.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/settings/signals/workout_settings_store.dart';
import 'package:wiseworkout/features/timer/signals/workout_engine_store.dart';
import 'package:wiseworkout/layout/screen_scaffold.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: context.localizations.titleMaintenanceScreen,
      feedbackLabels: const ['drawer', 'maintenance'],
      child: Padding(
        padding: const EdgeInsets.all(kDefaultSpacing),
        child: ListView(
          children: [
            if (kDebugMode)
              Padding(
                padding: const EdgeInsets.all(kDefaultSpacing),
                child: Column(
                  spacing: kDefaultSpacing,
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(context.localizations.maintenanceDatabaseReloadFixtures),
                    ElevatedButton(
                      onPressed: () async {
                        await kGetIt<AppDatabase>().dumpPresetsForFixtures();
                        kGetIt<WorkoutSettingsStore>().reset();
                        await kGetIt<WorkoutEngineStore>().reset();
                        final SharedPreferencesWithCache cache = await kGetIt<CacheService>().prefsWithCache;
                        await cache.remove(timerConfigurationKey);

                        if (!context.mounted) return;
                        await Fluttertoast.showToast(
                          msg: context.localizations.toastTextResetedDatabase,
                          toastLength: .LENGTH_SHORT,
                          gravity: .BOTTOM,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          textColor: Theme.of(context).colorScheme.surface,
                          fontSize: 16,
                        );
                      },
                      child: Text(context.localizations.buttonResetDatabase),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(kDefaultSpacing),
              child: Column(
                spacing: kDefaultSpacing,
                crossAxisAlignment: .stretch,
                children: [
                  Text(context.localizations.maintenanceHistoryDeleteAllData),
                  ElevatedButton(
                    onPressed: () async {
                      await kGetIt<AppDatabase>().wipeWorkoutHistoryData();
                      if (!context.mounted) return;
                      await Fluttertoast.showToast(
                        msg: context.localizations.maintenanceToastHistoryDeleted,
                        toastLength: .LENGTH_SHORT,
                        gravity: .BOTTOM,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        textColor: Theme.of(context).colorScheme.surface,
                        fontSize: 16,
                      );
                    },
                    child: Text(context.localizations.maintenanceButtonDeleteHistory),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
