import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wiseworkout/core/themes/theme.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/helpers.dart';
import 'package:wiseworkout/l10n/generated/app_localizations.dart';

void main() {
  setupLocator();
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

    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: .vertical,
            itemCount: screens.length,
            onPageChanged: (_) {},
            itemBuilder: itemBuilder,
          ),
        ),
      ),
    );
  }
}
