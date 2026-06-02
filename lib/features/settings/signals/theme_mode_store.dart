import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';

class ThemeModeStore {
  ThemeModeStore(this._cacheService);

  final CacheService _cacheService;

  final Signal<ThemeMode> themeMode = Signal<ThemeMode>(
    ThemeMode.light,
    options: const SignalOptions(name: ' THEME MODE '),
  );

  Future<void> loadThemeMode() async {
    final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
    final String? data = prefs.getString(themeModeKey);
    if (data != null) {
      themeMode.value = ThemeMode.values.firstWhere(
        (ThemeMode element) => element.name == data,
        orElse: () => ThemeMode.light,
      );
    }
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
    await prefs.setString(themeModeKey, mode.name);
  }
}
