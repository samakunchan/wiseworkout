import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String timerConfigurationKey = 'timer_configuration';
const String themeModeKey = 'theme_mode';
const String localKey = 'localization';

class CacheService {
  CacheService()
    : _prefsWithCacheFuture = SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{
            timerConfigurationKey,
            themeModeKey,
            localKey,
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
