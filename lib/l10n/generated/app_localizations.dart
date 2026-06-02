import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('de'), Locale('en'), Locale('es'), Locale('fr'), Locale('zh')];

  /// Text for the title of the setting screen
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettingScreen;

  /// Text for the title of the main screen
  ///
  /// In en, this message translates to:
  /// **'WiseWorkout'**
  String get titleMainScreen;

  /// Text for the title of the maintenance screen
  ///
  /// In en, this message translates to:
  /// **'Maintenance'**
  String get titleMaintenanceScreen;

  /// Text for the title of the history screen
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get titleHistoryScreen;

  /// Text for the button to navigate to the settings screen
  ///
  /// In en, this message translates to:
  /// **'Go to settings'**
  String get navigateToSettingScreen;

  /// Text for the button to navigate to the maintenance screen
  ///
  /// In en, this message translates to:
  /// **'Go to maintenance'**
  String get navigateToMaintenanceScreen;

  /// Text for the button to navigate to the history screen
  ///
  /// In en, this message translates to:
  /// **'Go to history'**
  String get navigateToHistoryScreen;

  /// Text for the button to navigate to main screen
  ///
  /// In en, this message translates to:
  /// **'Go to main'**
  String get navigateToMainScreen;

  /// Text for the button to load presets
  ///
  /// In en, this message translates to:
  /// **'Load presets'**
  String get buttonLoadPresets;

  /// Text for the button to apply configuration
  ///
  /// In en, this message translates to:
  /// **'Apply configuration'**
  String get buttonApplyConfiguration;

  /// Text for the button to reset database
  ///
  /// In en, this message translates to:
  /// **'Reset database'**
  String get buttonResetDatabase;

  /// Text for the button to choose
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get buttonChoose;

  /// Text for the button to cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get buttonCancel;

  /// Text for the button to show history
  ///
  /// In en, this message translates to:
  /// **'Show history'**
  String get buttonShowHistory;

  /// Text for the success toast message : configuration saved
  ///
  /// In en, this message translates to:
  /// **'Configuration saved'**
  String get toastTextConfigurationSaved;

  /// Text for the success toast message: reset database
  ///
  /// In en, this message translates to:
  /// **'Database reseted'**
  String get toastTextResetedDatabase;

  /// Text for the title of the setting description
  ///
  /// In en, this message translates to:
  /// **'Manage your settings'**
  String get titleSettingDescription;

  /// Text for the label of the workout setting
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get labelSettingWorkout;

  /// Text for the label of the rest setting
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get labelSettingRest;

  /// Text for the label of the sets setting
  ///
  /// In en, this message translates to:
  /// **'Sets'**
  String get labelSettingSets;

  /// Text for the label of the summarize setting
  ///
  /// In en, this message translates to:
  /// **'Summarize'**
  String get labelSettingSummarize;

  /// Text for the label of the option setting
  ///
  /// In en, this message translates to:
  /// **'Option'**
  String get labelSettingOption;

  /// Text for the label of the use circular timer setting
  ///
  /// In en, this message translates to:
  /// **'Use circular timer'**
  String get labelSettingUseCircularTimer;

  /// Text for the label of the sound active setting
  ///
  /// In en, this message translates to:
  /// **'Sound active'**
  String get labelSettingSoundActive;

  /// Text for the count time
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no time} =1{1 time} other{{count} times}}'**
  String textCountTime(num count);

  /// Text for the summarize end text
  ///
  /// In en, this message translates to:
  /// **' for the session.'**
  String get textSummarizeEndText;

  /// Subheader for the preferences section in the drawer
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get drawerHeaderPreferences;

  /// Subheader for the tools section in the drawer
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get drawerHeaderTools;

  /// Subheader for the support section in the drawer
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get drawerHeaderSupport;

  /// Subheader for the legal section in the drawer
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get drawerHeaderLegal;

  /// Text for the monthly summary drawer item
  ///
  /// In en, this message translates to:
  /// **'Monthly summary'**
  String get drawerMonthlySummaryText;

  /// Text for the about us drawer item
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get drawerAboutUsText;

  /// Text for the version info drawer
  ///
  /// In en, this message translates to:
  /// **'Version info'**
  String get drawerVersionInfoText;

  /// Text for the authorization drawer
  ///
  /// In en, this message translates to:
  /// **'Authorizations'**
  String get drawerAuthorizationText;

  /// Text for the feedback drawer item
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get drawerFeedbackText;

  /// Text for the rate on the store drawer item
  ///
  /// In en, this message translates to:
  /// **'Rate on the store'**
  String get drawerRateOnStore;

  /// Text for the privacy policy drawer item
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get drawerPrivacyPolicy;

  /// Text for the terms of service drawer item
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get drawerTermsOfService;

  /// Text for the report a bug
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get drawerReportABug;

  /// Text for the timer is already running
  ///
  /// In en, this message translates to:
  /// **'Timer is already running'**
  String get timerIsAlreadyRunning;

  /// Text for the button to keep it
  ///
  /// In en, this message translates to:
  /// **'Keep it'**
  String get buttonKeepIt;

  /// Text for the button to apply changes
  ///
  /// In en, this message translates to:
  /// **'Apply changes'**
  String get buttonApplyChanges;

  /// Text for the no translation available
  ///
  /// In en, this message translates to:
  /// **'No translation available'**
  String get keyNoTranslationAvailable;

  /// Text for the warm up
  ///
  /// In en, this message translates to:
  /// **'Warm up'**
  String get keyWarmUpText;

  /// Text for the core
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get keyCoreText;

  /// Text for the key learning
  ///
  /// In en, this message translates to:
  /// **'Learning'**
  String get keyLearningText;

  /// Text for the key working to my job
  ///
  /// In en, this message translates to:
  /// **'Working to my job'**
  String get keyWorkingToMyJob;

  /// Text for the key mail
  ///
  /// In en, this message translates to:
  /// **'Mail'**
  String get keyMail;

  /// Text for the key search job
  ///
  /// In en, this message translates to:
  /// **'Search job'**
  String get keySearchJob;

  /// Text for the key cooking steak
  ///
  /// In en, this message translates to:
  /// **'Cooking steak'**
  String get keyCookingSteak;

  /// Text for the key cooking nuggets
  ///
  /// In en, this message translates to:
  /// **'Cooking nuggets'**
  String get keyCookingNuggets;

  /// Text for the today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get textToday;

  /// Text for the yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get textYesterday;

  /// Text for the date
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get textDateTime;

  /// Text for the planned time
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get textPlannedTime;

  /// Text for the break time
  ///
  /// In en, this message translates to:
  /// **'Break'**
  String get textBreakTime;

  /// Text for the time
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get textTime;

  /// Text for the work time
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get textWorkTime;

  /// Text for the rest time
  ///
  /// In en, this message translates to:
  /// **'Rest'**
  String get textRestTime;

  /// Text for the finished time
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get textFinishedTime;

  /// Text for the session today
  ///
  /// In en, this message translates to:
  /// **'Session today'**
  String get textSessionToday;

  /// Text for the total time
  ///
  /// In en, this message translates to:
  /// **'Total time'**
  String get textTotalTime;

  /// Button text for the return to timer
  ///
  /// In en, this message translates to:
  /// **'Return to timer'**
  String get buttonReturnToTimer;

  /// Text for the history description
  ///
  /// In en, this message translates to:
  /// **'Review your completed workout sessions.'**
  String get historyDescription;

  /// Text for the monthly summary
  ///
  /// In en, this message translates to:
  /// **'Monthly summary'**
  String get textSummaryMonthly;

  /// Text for the total sessions
  ///
  /// In en, this message translates to:
  /// **'Total sessions'**
  String get textTotalSessions;

  /// Text for the average session
  ///
  /// In en, this message translates to:
  /// **'Average session'**
  String get textAverageSession;

  /// Text for the daily sessions
  ///
  /// In en, this message translates to:
  /// **'Daily sessions'**
  String get textDailySessions;

  /// Text for the activity breakdown
  ///
  /// In en, this message translates to:
  /// **'Activity breakdown'**
  String get textActivityBreakdown;

  /// Text for the most productive day
  ///
  /// In en, this message translates to:
  /// **'Most productive day'**
  String get textMostProductiveDay;

  /// Text for the longest streak
  ///
  /// In en, this message translates to:
  /// **'Longest streak'**
  String get textLongestStreak;

  /// Text for the longest streak description
  ///
  /// In en, this message translates to:
  /// **'Daily focus goal'**
  String get textLongestStreakDescription;

  /// Text for the task completed
  ///
  /// In en, this message translates to:
  /// **'Task completed'**
  String get textTaskCompleted;

  /// Text for the breaks taken
  ///
  /// In en, this message translates to:
  /// **'Breaks taken'**
  String get textBreaksTaken;

  /// Text for the task completed description
  ///
  /// In en, this message translates to:
  /// **'Total short and long breaks'**
  String get textBreaksTakenDescription;

  /// Text for the n session
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no session} =1{1 session} other{{count} sessions}}'**
  String textNSession(num count);

  /// Text for the n day
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{no day} =1{1 day} other{{count} days}}'**
  String textNDay(num count);

  /// Text for the short monday
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get textShortMonday;

  /// Text for the short tuesday
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get textShortTuesday;

  /// Text for the short wednesday
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get textShortWednesday;

  /// Text for the short thursday
  ///
  /// In en, this message translates to:
  /// **'Thr'**
  String get textShortThursday;

  /// Text for the short friday
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get textShortFriday;

  /// Text for the short saturday
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get textShortSaturday;

  /// Text for the short sunday
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get textShortSunday;

  /// Text for the error
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get error404Description;

  /// Text for the language selected
  ///
  /// In en, this message translates to:
  /// **'Language - {language, select, en{English} fr{French} other{English}}'**
  String languageSelected(String language);

  /// Text for the 'of'
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get ofText;

  /// Text for the session completed
  ///
  /// In en, this message translates to:
  /// **'Session completed'**
  String get sessionCompletedText;

  /// First part of the welcome screen title
  ///
  /// In en, this message translates to:
  /// **'You know your '**
  String get welcomeScreenTitlePrefix;

  /// Highlighted part of the welcome screen title
  ///
  /// In en, this message translates to:
  /// **'routine'**
  String get welcomeScreenTitleHighlight;

  /// Last part of the welcome screen title
  ///
  /// In en, this message translates to:
  /// **'\nbest.'**
  String get welcomeScreenTitleSuffix;

  /// Subtitle text about knowing exercises
  ///
  /// In en, this message translates to:
  /// **'This application assumes that you\nknow your exercises by heart.'**
  String get welcomeScreenSubtitleKnowledge;

  /// Subtitle text about sequencing
  ///
  /// In en, this message translates to:
  /// **'Sequence them exactly as you wish.'**
  String get welcomeScreenSubtitleSequence;

  /// Text for the Get Started button
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get buttonGetStarted;

  /// Label for database reload fixtures section
  ///
  /// In en, this message translates to:
  /// **'Database : reload fixtures'**
  String get maintenanceDatabaseReloadFixtures;

  /// Label for history delete section
  ///
  /// In en, this message translates to:
  /// **'History : delete all history datas'**
  String get maintenanceHistoryDeleteAllData;

  /// Label for delete history button
  ///
  /// In en, this message translates to:
  /// **'Delete history'**
  String get maintenanceButtonDeleteHistory;

  /// Toast message after history deletion
  ///
  /// In en, this message translates to:
  /// **'History datas deleted'**
  String get maintenanceToastHistoryDeleted;

  /// Title of the feedback form
  ///
  /// In en, this message translates to:
  /// **'Help us improve!'**
  String get feedbackImprovementTitle;

  /// Hint text for the feedback text field
  ///
  /// In en, this message translates to:
  /// **'Tell us more...'**
  String get feedbackHintText;

  /// Text for the send feedback button
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get feedbackSendButton;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
