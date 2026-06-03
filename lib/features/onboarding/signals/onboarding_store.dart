import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';

class OnboardingStore {
  OnboardingStore(this._cacheService);

  final CacheService _cacheService;

  final Signal<bool> onboardingCompleted = Signal<bool>(
    false,
    options: const SignalOptions(name: ' ONBOARDING COMPLETED '),
  );

  /// Load onboarding state from cache.
  Future<void> loadOnboardingState() async {
    if (kIsWeb) {
      onboardingCompleted.value = false;
      return;
    }
    final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
    final bool? completed = prefs.getBool(onboardingCompletedKey);
    if (completed != null) {
      onboardingCompleted.value = completed;
    }
  }

  /// Whether onboarding should be shown.
  bool get shouldShowOnboarding {
    return !onboardingCompleted.value;
  }

  /// Complete onboarding and persist to cache (if not on Web).
  Future<void> completeOnboarding() async {
    onboardingCompleted.value = true;
    if (!kIsWeb) {
      final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
      await prefs.setBool(onboardingCompletedKey, true);
    }
  }

  /// Relaunch/reset onboarding state (for testing or debugging).
  Future<void> resetOnboarding() async {
    onboardingCompleted.value = false;
    if (!kIsWeb) {
      final SharedPreferencesWithCache prefs = await _cacheService.prefsWithCache;
      await prefs.setBool(onboardingCompletedKey, false);
    }
  }
}
