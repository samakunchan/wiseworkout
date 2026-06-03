import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String timerConfigurationKey = 'timer_configuration';
const String themeModeKey = 'theme_mode';
const String localKey = 'localization';
const String onboardingCompletedKey = 'onboarding_completed';

class CacheService {
  CacheService()
    : _prefsWithCacheFuture = SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{
            timerConfigurationKey,
            themeModeKey,
            localKey,
            onboardingCompletedKey,
          },
        ),
      ) {
    if (kDebugMode) {
      print('CacheService constructor called.');
    }
  }

  final Future<SharedPreferencesWithCache> _prefsWithCacheFuture;

  Future<SharedPreferencesWithCache> get prefsWithCache => _prefsWithCacheFuture;
}
