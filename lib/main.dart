import 'package:device_preview/device_preview.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/core/themes/theme.dart';
import 'package:wiseworkout/features/cache/services/cache_service.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/helpers.dart';
import 'package:wiseworkout/features/onboarding/screens/onboarding_screen.dart';
import 'package:wiseworkout/features/onboarding/signals/onboarding_store.dart';
import 'package:wiseworkout/features/settings/signals/locale_store.dart';
import 'package:wiseworkout/features/settings/signals/theme_mode_store.dart';
import 'package:wiseworkout/features/settings/signals/workout_settings_store.dart';
import 'package:wiseworkout/l10n/generated/app_localizations.dart';
import 'package:wiseworkout/layout/screen_scaffold_with_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Supprime les logs dans la console.
  SignalsObserver.instance = null;

  setupLocator();
  await kGetIt<WorkoutSettingsStore>().loadFromCache(kGetIt<CacheService>());
  await kGetIt<ThemeModeStore>().loadThemeMode();
  await kGetIt<LocaleStore>().loadLocale();
  await kGetIt<OnboardingStore>().loadOnboardingState();

  /// Environment variables
  await dotenv.load();
  if (kDebugMode) {
    print('Les variables d‘environnement ont été chargées : ${dotenv.get('GITHUB_REPO_URL')}');
  }

  if (kIsWeb) {
    runApp(
      DevicePreview(
        enabled: kIsWeb,
        builder: (BuildContext context) => const MyApp(),
      ),
    );
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = AppHelper.getScreens(pageController: _pageController);
    Widget itemBuilder(BuildContext context, int index) => screens[index];

    return SignalBuilder(
      builder: (BuildContext context) {
        final ThemeMode themeMode = kGetIt<ThemeModeStore>().themeMode.value;
        final Locale locale = kGetIt<LocaleStore>().locale.value;
        final bool showOnboarding = kGetIt<OnboardingStore>().shouldShowOnboarding;

        return BetterFeedback(
          theme: AppTheme.feedbackLightTheme,
          darkTheme: AppTheme.feedbackDarkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          localeOverride: locale,
          feedbackBuilder: customFeedbackBuilder,
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: showOnboarding
                ? const OnboardingScreen()
                : ScreenScaffoldWithDrawer(
                    child: SafeArea(
                      child: PageView.builder(
                        controller: _pageController,
                        scrollDirection: .vertical,
                        itemCount: screens.length,
                        onPageChanged: (_) {},
                        itemBuilder: itemBuilder,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}

List<String> feedbackTypes = <String>['bug', 'enhancement', 'other'];
String feedbackType = feedbackTypes.first;

Widget customFeedbackBuilder(
  BuildContext context,
  OnSubmit onSubmit,
  ScrollController? scrollController,
) {
  String feedbackText = '';
  bool isLoading = false;

  return StatefulBuilder(
    builder: (BuildContext _, StateSetter setState) {
      void stopLoading(Object? _) => setState(() => isLoading = false);

      return Padding(
        padding: const EdgeInsets.all(kDefaultSpacing),
        child: Column(
          mainAxisSize: .min,
          children: [
            Text(
              context.localizations.feedbackImprovementTitle,
              style: const TextStyle(fontWeight: .bold),
            ),
            DropdownButton<String>(
              value: feedbackType,
              items: feedbackTypes.map((String type) => DropdownMenuItem<String>(value: type, child: Text(type))).toList(),
              onChanged: (String? val) => setState(() => feedbackType = val!),
            ),
            TextField(
              onChanged: (String val) => setState(() => feedbackText = val),
              decoration: InputDecoration(hintText: context.localizations.feedbackHintText),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() => isLoading = true);
                await onSubmit(
                  feedbackText,
                  extras: <String, dynamic>{'type': feedbackType},
                ).then(stopLoading).catchError(stopLoading);
              },
              child: isLoading ? const CircularProgressIndicator() : Text(context.localizations.feedbackSendButton),
            ),
          ],
        ),
      );
    },
  );
}
