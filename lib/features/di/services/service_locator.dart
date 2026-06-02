import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';
import 'package:wiseworkout/features/database/services/database_service.dart';
import 'package:wiseworkout/features/history/signals/workout_history_store.dart';
import 'package:wiseworkout/features/settings/signals/locale_store.dart';
import 'package:wiseworkout/features/settings/signals/theme_mode_store.dart';
import 'package:wiseworkout/features/settings/signals/workout_settings_store.dart';
import 'package:wiseworkout/features/sound/services/sound_service.dart';
import 'package:wiseworkout/features/timer/signals/workout_engine_store.dart';

final GetIt kGetIt = GetIt.instance;

void setupLocator() {
  kGetIt
    ..registerSingleton<AppDatabase>(AppDatabase())
    ..registerLazySingleton<AudioPlayer>(AudioPlayer.new)
    ..registerLazySingleton<SoundService>(SoundService.new)
    ..registerLazySingleton<CacheService>(CacheService.new)
    ..registerLazySingleton<WorkoutSettingsStore>(WorkoutSettingsStore.new)
    ..registerLazySingleton<ThemeModeStore>(
      () => ThemeModeStore(kGetIt<CacheService>()),
    )
    ..registerLazySingleton<LocaleStore>(
      () => LocaleStore(kGetIt<CacheService>()),
    )
    ..registerLazySingleton<WorkoutEngineStore>(
      () => WorkoutEngineStore(kGetIt<WorkoutSettingsStore>()),
    )
    ..registerLazySingleton<WorkoutHistoryStore>(
      () => WorkoutHistoryStore(kGetIt<AppDatabase>()),
    );
}
