import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';

class LocaleStore {
  LocaleStore(this._cacheService);

  final CacheService _cacheService;

  final Signal<Locale> locale = Signal<Locale>(
    const Locale('en', 'EN'),
    options: const SignalOptions(name: ' LOCALE '),
  );

  Future<void> loadLocale() async {
    final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
    final String? data = prefs.getString(localKey);
    if (data != null) {
      locale.value = Locale(data);
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    locale.value = newLocale;
    final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
    await prefs.setString(localKey, newLocale.languageCode);
  }
}
