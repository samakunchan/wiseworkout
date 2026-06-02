// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get titleSettingScreen => 'Einstellungen';

  @override
  String get titleMainScreen => 'WiseWorkout';

  @override
  String get titleMaintenanceScreen => 'Wartung';

  @override
  String get titleHistoryScreen => 'Verlauf';

  @override
  String get navigateToSettingScreen => 'Zu den Einstellungen';

  @override
  String get navigateToMaintenanceScreen => 'Zur Wartung';

  @override
  String get navigateToHistoryScreen => 'Zum Verlauf';

  @override
  String get navigateToMainScreen => 'Zum Hauptbildschirm';

  @override
  String get buttonLoadPresets => 'Sequenzen laden';

  @override
  String get buttonApplyConfiguration => 'Konfiguration anwenden';

  @override
  String get buttonResetDatabase => 'Datenbank zurücksetzen';

  @override
  String get buttonChoose => 'Wählen';

  @override
  String get buttonCancel => 'Abbrechen';

  @override
  String get buttonShowHistory => 'Verlauf anzeigen';

  @override
  String get toastTextConfigurationSaved => 'Konfiguration gespeichert';

  @override
  String get toastTextResetedDatabase => 'Datenbank zurückgesetzt';

  @override
  String get titleSettingDescription => 'Einstellungen verwalten';

  @override
  String get labelSettingWorkout => 'Training';

  @override
  String get labelSettingRest => 'Pause';

  @override
  String get labelSettingSets => 'Sätze';

  @override
  String get labelSettingSummarize => 'Zusammenfassung';

  @override
  String get labelSettingOption => 'Option';

  @override
  String get labelSettingUseCircularTimer => 'Kreisförmigen Timer verwenden';

  @override
  String get labelSettingSoundActive => 'Ton aktiv';

  @override
  String textCountTime(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Male',
      one: '1 Mal',
      zero: 'kein Mal',
    );
    return '$_temp0';
  }

  @override
  String get textSummarizeEndText => ' für die Sitzung.';

  @override
  String get drawerHeaderPreferences => 'Einstellungen';

  @override
  String get drawerHeaderTools => 'Tools';

  @override
  String get drawerHeaderSupport => 'Support';

  @override
  String get drawerHeaderLegal => 'Rechtliches';

  @override
  String get drawerMonthlySummaryText => 'Monatsübersicht';

  @override
  String get drawerAboutUsText => 'Über uns';

  @override
  String get drawerVersionInfoText => 'Versionsinfo';

  @override
  String get drawerAuthorizationText => 'Berechtigungen';

  @override
  String get drawerFeedbackText => 'Feedback';

  @override
  String get drawerRateOnStore => 'Im Store bewerten';

  @override
  String get drawerPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get drawerTermsOfService => 'Nutzungsbedingungen';

  @override
  String get drawerReportABug => 'Fehler melden';

  @override
  String get timerIsAlreadyRunning => 'Timer läuft bereits';

  @override
  String get buttonKeepIt => 'Behalten';

  @override
  String get buttonApplyChanges => 'Änderungen anwenden';

  @override
  String get keyNoTranslationAvailable => 'Keine Übersetzung verfügbar';

  @override
  String get keyWarmUpText => 'Aufwärmen';

  @override
  String get keyCoreText => 'Plank';

  @override
  String get keyLearningText => 'Lernen';

  @override
  String get keyWorkingToMyJob => 'Arbeit';

  @override
  String get keyMail => 'E-Mail-Verwaltung';

  @override
  String get keySearchJob => 'Jobsuche';

  @override
  String get keyCookingSteak => 'Steak braten';

  @override
  String get keyCookingNuggets => 'Nuggets zubereiten';

  @override
  String get textToday => 'Heute';

  @override
  String get textYesterday => 'Gestern';

  @override
  String get textDateTime => 'Datum';

  @override
  String get textPlannedTime => 'Geplant';

  @override
  String get textBreakTime => 'Pause';

  @override
  String get textTime => 'Zeit';

  @override
  String get textWorkTime => 'Training';

  @override
  String get textRestTime => 'Pause';

  @override
  String get textFinishedTime => 'Fertig';

  @override
  String get textSessionToday => 'Sitzung heute';

  @override
  String get textTotalTime => 'Gesamtzeit';

  @override
  String get buttonReturnToTimer => 'Zurück zum Timer';

  @override
  String get historyDescription => 'Überprüfen Sie Ihre abgeschlossenen Trainingseinheiten.';

  @override
  String get textSummaryMonthly => 'Monatsübersicht';

  @override
  String get textTotalSessions => 'Sitzungen gesamt';

  @override
  String get textAverageSession => 'Ø Sitzungsdauer';

  @override
  String get textDailySessions => 'Tägliche Sitzungen';

  @override
  String get textActivityBreakdown => 'Aktivitätsverteilung';

  @override
  String get textMostProductiveDay => 'Produktivster Tag';

  @override
  String get textLongestStreak => 'Längste Serie';

  @override
  String get textLongestStreakDescription => 'Tägliches Fokusziel';

  @override
  String get textTaskCompleted => 'Aufgabe erledigt';

  @override
  String get textBreaksTaken => 'Pausen gemacht';

  @override
  String get textBreaksTakenDescription => 'Pausen gesamt';

  @override
  String textNSession(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Sitzungen',
      one: '1 Sitzung',
      zero: 'keine Sitzung',
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
      other: '$countString Tage',
      one: '1 Tag',
      zero: 'kein Tag',
    );
    return '$_temp0';
  }

  @override
  String get textShortMonday => 'Mo';

  @override
  String get textShortTuesday => 'Di';

  @override
  String get textShortWednesday => 'Mi';

  @override
  String get textShortThursday => 'Do';

  @override
  String get textShortFriday => 'Fr';

  @override
  String get textShortSaturday => 'Sa';

  @override
  String get textShortSunday => 'So';

  @override
  String get error404Description => 'Seite nicht gefunden';

  @override
  String languageSelected(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'Englisch',
        'fr': 'Französisch',
        'other': 'Englisch',
      },
    );
    return 'Sprache - $_temp0';
  }

  @override
  String get ofText => 'von';

  @override
  String get sessionCompletedText => 'Sitzung beendet';

  @override
  String get welcomeScreenTitlePrefix => 'Sie kennen Ihre ';

  @override
  String get welcomeScreenTitleHighlight => 'Routine';

  @override
  String get welcomeScreenTitleSuffix => '\nam besten.';

  @override
  String get welcomeScreenSubtitleKnowledge => 'Diese App setzt voraus, dass Sie\nIhre Übungen auswendig kennen.';

  @override
  String get welcomeScreenSubtitleSequence => 'Sequenzieren Sie sie ganz nach Wunsch.';

  @override
  String get buttonGetStarted => 'Loslegen';

  @override
  String get maintenanceDatabaseReloadFixtures => 'Datenbank: Testdaten neu laden';

  @override
  String get maintenanceHistoryDeleteAllData => 'Verlauf: Alle Verlaufsdaten löschen';

  @override
  String get maintenanceButtonDeleteHistory => 'Verlauf löschen';

  @override
  String get maintenanceToastHistoryDeleted => 'Verlaufsdaten gelöscht';

  @override
  String get feedbackImprovementTitle => 'Helfen Sie uns, uns zu verbessern!';

  @override
  String get feedbackHintText => 'Erzählen Sie uns mehr...';

  @override
  String get feedbackSendButton => 'Senden';
}
