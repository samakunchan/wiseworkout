// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleSettingScreen => 'Settings';

  @override
  String get titleMainScreen => 'WiseWorkout';

  @override
  String get titleMaintenanceScreen => 'Maintenance';

  @override
  String get titleHistoryScreen => 'History';

  @override
  String get navigateToSettingScreen => 'Go to settings';

  @override
  String get navigateToMaintenanceScreen => 'Go to maintenance';

  @override
  String get navigateToHistoryScreen => 'Go to history';

  @override
  String get navigateToMainScreen => 'Go to main';

  @override
  String get buttonLoadPresets => 'Load presets';

  @override
  String get buttonApplyConfiguration => 'Apply configuration';

  @override
  String get buttonResetDatabase => 'Reset configuration';

  @override
  String get buttonChoose => 'Choose';

  @override
  String get buttonCancel => 'Cancel';

  @override
  String get buttonShowHistory => 'Show history';

  @override
  String get toastTextConfigurationSaved => 'Configuration saved';

  @override
  String get toastTextResetedDatabase => 'Configuration reseted';

  @override
  String get titleSettingDescription => 'Manage your settings';

  @override
  String get labelSettingWorkout => 'Workout';

  @override
  String get labelSettingRest => 'Rest';

  @override
  String get labelSettingSets => 'Sets';

  @override
  String get labelSettingSummarize => 'Summarize';

  @override
  String get labelSettingOption => 'Option';

  @override
  String get labelSettingUseCircularTimer => 'Use circular timer';

  @override
  String get labelSettingSoundActive => 'Sound active';

  @override
  String textCountTime(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString times',
      one: '1 time',
      zero: 'no time',
    );
    return '$_temp0';
  }

  @override
  String get textSummarizeEndText => ' for the session.';

  @override
  String get drawerHeaderPreferences => 'Preferences';

  @override
  String get drawerHeaderTools => 'Tools';

  @override
  String get drawerHeaderSupport => 'Support';

  @override
  String get drawerHeaderLegal => 'Legal';

  @override
  String get drawerMonthlySummaryText => 'Monthly summary';

  @override
  String get drawerAboutUsText => 'About us';

  @override
  String get drawerVersionInfoText => 'Version info';

  @override
  String get drawerAuthorizationText => 'Authorizations';

  @override
  String get drawerFeedbackText => 'Feedback';

  @override
  String get drawerRateOnStore => 'Rate on the store';

  @override
  String get drawerPrivacyPolicy => 'Privacy policy';

  @override
  String get drawerTermsOfService => 'Terms of service';

  @override
  String get drawerReportABug => 'Report a bug';

  @override
  String get timerIsAlreadyRunning => 'Timer is already running';

  @override
  String get buttonKeepIt => 'Keep it';

  @override
  String get buttonApplyChanges => 'Apply changes';

  @override
  String get keyNoTranslationAvailable => 'No translation available';

  @override
  String get keyWarmUpText => 'Warm up';

  @override
  String get keyCoreText => 'Core';

  @override
  String get keyLearningText => 'Learning';

  @override
  String get keyWorkingToMyJob => 'Working to my job';

  @override
  String get keyMail => 'Mail';

  @override
  String get keySearchJob => 'Search job';

  @override
  String get keyCookingSteak => 'Cooking steak';

  @override
  String get keyCookingNuggets => 'Cooking nuggets';

  @override
  String get textToday => 'Today';

  @override
  String get textYesterday => 'Yesterday';

  @override
  String get textDateTime => 'Date';

  @override
  String get textPlannedTime => 'Planned';

  @override
  String get textBreakTime => 'Break';

  @override
  String get textTime => 'Time';

  @override
  String get textWorkTime => 'Work';

  @override
  String get textRestTime => 'Rest';

  @override
  String get textFinishedTime => 'Finished';

  @override
  String get textSessionToday => 'Session today';

  @override
  String get textTotalTime => 'Total time';

  @override
  String get buttonReturnToTimer => 'Return to timer';

  @override
  String get historyDescription => 'Review your completed workout sessions.';

  @override
  String get textSummaryMonthly => 'Monthly summary';

  @override
  String get textTotalSessions => 'Total sessions';

  @override
  String get textAverageSession => 'Average session';

  @override
  String get textDailySessions => 'Daily sessions';

  @override
  String get textActivityBreakdown => 'Activity breakdown';

  @override
  String get textMostProductiveDay => 'Most productive day';

  @override
  String get textLongestStreak => 'Longest streak';

  @override
  String get textLongestStreakDescription => 'Daily focus goal';

  @override
  String get textTaskCompleted => 'Task completed';

  @override
  String get textBreaksTaken => 'Breaks taken';

  @override
  String get textBreaksTakenDescription => 'Total short and long breaks';

  @override
  String textNSession(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString sessions',
      one: '1 session',
      zero: 'no session',
    );
    return '$_temp0';
  }

  @override
  String textNDay(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      one: '1 day',
      zero: 'no day',
    );
    return '$_temp0';
  }

  @override
  String get textShortMonday => 'Mon';

  @override
  String get textShortTuesday => 'Tue';

  @override
  String get textShortWednesday => 'Wed';

  @override
  String get textShortThursday => 'Thr';

  @override
  String get textShortFriday => 'Fri';

  @override
  String get textShortSaturday => 'Sat';

  @override
  String get textShortSunday => 'Sun';

  @override
  String get error404Description => 'Page not found';

  @override
  String languageSelected(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'English',
        'fr': 'French',
        'other': 'English',
      },
    );
    return 'Language - $_temp0';
  }

  @override
  String get ofText => 'of';

  @override
  String get sessionCompletedText => 'Session completed';

  @override
  String get welcomeScreenTitlePrefix => 'You know your ';

  @override
  String get welcomeScreenTitleHighlight => 'routine';

  @override
  String get welcomeScreenTitleSuffix => '\nbest.';

  @override
  String get welcomeScreenSubtitleKnowledge => 'This application assumes that you\nknow your exercises by heart.';

  @override
  String get welcomeScreenSubtitleSequence => 'Sequence them exactly as you wish.';

  @override
  String get buttonGetStarted => 'Get Started';

  @override
  String get maintenanceDatabaseReloadFixtures => 'Configuration : reload default configuration';

  @override
  String get maintenanceHistoryDeleteAllData => 'History : delete all history datas';

  @override
  String get maintenanceButtonDeleteHistory => 'Delete history';

  @override
  String get maintenanceToastHistoryDeleted => 'History datas deleted';

  @override
  String get feedbackImprovementTitle => 'Help us improve!';

  @override
  String get feedbackHintText => 'Tell us more...';

  @override
  String get feedbackSendButton => 'Send';
}
