import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:wiseworkout/core/extensions/context_extension.dart';
import 'package:wiseworkout/core/extensions/string_extension.dart';
import 'package:wiseworkout/core/themes/constantes.dart';
import 'package:wiseworkout/features/di/services/service_locator.dart';
import 'package:wiseworkout/features/history/screens/monthly_summary_screen.dart';
import 'package:wiseworkout/features/more/screens/about_us_screen.dart';
import 'package:wiseworkout/features/more/screens/maintenance_screen.dart';
import 'package:wiseworkout/features/settings/enums/enums.dart';
import 'package:wiseworkout/features/settings/signals/locale_store.dart';
import 'package:wiseworkout/features/settings/signals/theme_mode_store.dart';

class WorkoutDrawer extends StatelessWidget {
  const WorkoutDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleStore localeStore = kGetIt<LocaleStore>();
    final ThemeModeStore themeModeStore = kGetIt<ThemeModeStore>();

    return Drawer(
      child: ListView(
        padding: .zero,
        children: [
          /// Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              border: Border.all(width: 0),
              boxShadow: const [BoxShadow(color: Colors.yellow)],
              borderRadius: .zero,
            ),
            child: Column(
              mainAxisAlignment: .spaceBetween,
              spacing: kDefaultSpacing,
              children: [
                Row(
                  spacing: kDefaultSpacing,
                  children: [
                    Image.asset(kAssetLogo, height: 56, fit: .contain),
                    Expanded(
                      child: Text(
                        context.localizations.titleMainScreen,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ],
                ),

                SignalBuilder(
                  builder: (BuildContext context) {
                    final List<ThemeMode> themeModes = [.dark, .light, .system];

                    return Row(
                      mainAxisAlignment: .center,
                      spacing: 16,
                      children: List.generate(
                        themeModes.length,
                        (int index) => Badge(
                          label: Icon(Icons.check_circle, color: Theme.of(context).colorScheme.surface),
                          isLabelVisible: themeModeStore.themeMode.value == themeModes[index],
                          backgroundColor: Colors.transparent,
                          alignment: const Alignment(.6, -.9),
                          padding: .zero,
                          child: IconButton(
                            icon: Icon(_getIcon(themeModes[index]), color: Theme.of(context).colorScheme.surface),
                            onPressed: () async => themeModeStore.changeThemeMode(themeModes[index]),
                            style: themeModeStore.themeMode.value == themeModes[index]
                                ? IconButton.styleFrom(side: BorderSide(color: Theme.of(context).colorScheme.surface))
                                : null,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          /// Preferences Section
          _buildSectionHeader(context, context.localizations.drawerHeaderPreferences),

          /// Change locale
          SignalBuilder(
            builder: (BuildContext context) {
              final Locale currentLocale = localeStore.locale.value;

              return ListTile(
                leading: Icon(Icons.language, color: Theme.of(context).colorScheme.primary),
                title: Text(context.localizations.languageSelected(currentLocale.languageCode)),
                onTap: () => showCupertinoModalPopup<bool>(
                  context: context,
                  builder: (_) {
                    final int currentLanguageIndex = LanguageEnum.values.indexWhere(
                      (LanguageEnum element) => element.key == currentLocale.languageCode,
                    );

                    return Container(
                      height: 350,
                      width: .infinity,
                      color: CupertinoColors.systemBackground.resolveFrom(context),
                      child: Column(
                        mainAxisAlignment: .end,
                        crossAxisAlignment: .stretch,
                        children: [
                          Expanded(
                            child: CupertinoPicker(
                              looping: LanguageEnum.values.length > 4,
                              squeeze: 1.1,
                              useMagnifier: true,
                              scrollController: FixedExtentScrollController(initialItem: currentLanguageIndex),
                              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                                background: Theme.of(context).colorScheme.primary.withValues(alpha: .3),
                              ),
                              onSelectedItemChanged: (int selectedItem) async {
                                await localeStore.changeLocale(
                                  Locale(LanguageEnum.values[selectedItem].key),
                                );
                              },
                              itemExtent: 52,
                              children: List.generate(
                                LanguageEnum.values.length,
                                (int index) => Align(
                                  alignment: .centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 40),
                                    child: Row(
                                      mainAxisAlignment: .spaceBetween,
                                      children: [
                                        Text(
                                          LanguageEnum.values[index].value.ucFirst(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: kDefaultSpacing + 20),
                                          child: CountryFlag.fromCountryCode(
                                            LanguageEnum.values[index].key == 'en'
                                                ? 'GB'
                                                : LanguageEnum.values[index].key == 'zh'
                                                ? 'CN'
                                                : LanguageEnum.values[index].key.toUpperCase(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),

          /// Tools Section
          const Divider(height: 1),
          _buildSectionHeader(context, context.localizations.drawerHeaderTools),

          /// Monthly Summary
          ListTile(
            leading: Icon(Icons.query_stats, color: Theme.of(context).colorScheme.primary),
            title: Text(context.localizations.drawerMonthlySummaryText),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const MonthlySummaryScreen(),
                ),
              );
            },
          ),

          /// Maintenance
          ListTile(
            leading: Icon(Icons.home_repair_service, color: Theme.of(context).colorScheme.primary),
            title: Text(context.localizations.titleMaintenanceScreen),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const MaintenanceScreen(),
                ),
              );
            },
          ),

          /// Support Section
          const Divider(height: 1),
          _buildSectionHeader(context, context.localizations.drawerHeaderSupport),

          /// About us
          ListTile(
            leading: Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
            title: Text(context.localizations.drawerAboutUsText),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const AboutUsScreen(),
                ),
              );
            },
          ),

          /// Version
          ListTile(
            leading: Icon(Icons.tag, color: Theme.of(context).colorScheme.primary),
            title: Text(context.localizations.drawerVersionInfoText),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.localizations.drawerVersionInfoText)),
              );
            },
          ),

          /// Rate on store
          Badge(
            isLabelVisible: kIsWeb,
            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 10),
            alignment: .topCenter,
            label: _buildWebDisabledBadge(context),
            child: Opacity(
              opacity: kIsWeb ? .5 : 1,
              child: ListTile(
                leading: Icon(Icons.star, color: Theme.of(context).colorScheme.primary),
                title: Text(context.localizations.drawerRateOnStore),
                onTap: kIsWeb
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.localizations.drawerRateOnStore)),
                        );
                      },
              ),
            ),
          ),

          /// Legal Section
          const Divider(height: 1),
          _buildSectionHeader(context, context.localizations.drawerHeaderLegal),

          /// Authorization
          Badge(
            isLabelVisible: kIsWeb,
            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 10),
            alignment: .topCenter,
            label: _buildWebDisabledBadge(context),
            child: Opacity(
              opacity: kIsWeb ? .5 : 1,
              child: ListTile(
                leading: Icon(Icons.tag, color: Theme.of(context).colorScheme.primary),
                title: Text(context.localizations.drawerAuthorizationText),
                onTap: kIsWeb
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.localizations.drawerAuthorizationText)),
                        );
                      },
              ),
            ),
          ),

          /// Privacy
          Badge(
            isLabelVisible: kIsWeb,
            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 10),
            alignment: .topCenter,
            label: _buildWebDisabledBadge(context),
            child: Opacity(
              opacity: kIsWeb ? .5 : 1,
              child: ListTile(
                leading: Icon(Icons.privacy_tip, color: Theme.of(context).colorScheme.primary),
                title: Text(context.localizations.drawerPrivacyPolicy),
                onTap: kIsWeb
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.localizations.drawerPrivacyPolicy)),
                        );
                      },
              ),
            ),
          ),

          /// Terms of service
          Badge(
            isLabelVisible: kIsWeb,
            backgroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
            textColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(fontSize: 10),
            alignment: .topCenter,
            label: _buildWebDisabledBadge(context),
            child: Opacity(
              opacity: kIsWeb ? .5 : 1,
              child: ListTile(
                leading: Icon(Icons.description, color: Theme.of(context).colorScheme.primary),
                title: Text(context.localizations.drawerTermsOfService),
                onTap: kIsWeb
                    ? null
                    : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.localizations.drawerTermsOfService)),
                        );
                      },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: .bold,
          color: Theme.of(context).colorScheme.primary,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildWebDisabledBadge(BuildContext context) {
    return const Text('disabled for this demo');
  }

  IconData _getIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.system:
        return Icons.phone_iphone;
    }
  }
}
