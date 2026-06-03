// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get titleSettingScreen => 'Paramètres';

  @override
  String get titleMainScreen => 'WiseWorkout';

  @override
  String get titleMaintenanceScreen => 'Maintenance';

  @override
  String get titleHistoryScreen => 'Historique';

  @override
  String get navigateToSettingScreen => 'Aller vers Paramètres';

  @override
  String get navigateToMaintenanceScreen => 'Aller vers Maintenance';

  @override
  String get navigateToHistoryScreen => 'Aller vers Historique';

  @override
  String get navigateToMainScreen => 'Aller vers Accueil';

  @override
  String get buttonLoadPresets => 'Charger les séquences';

  @override
  String get buttonApplyConfiguration => 'Appliquer la configuration';

  @override
  String get buttonResetDatabase => 'Réinitialiser la configuration';

  @override
  String get buttonChoose => 'Choisir';

  @override
  String get buttonCancel => 'Annuler';

  @override
  String get buttonShowHistory => 'Voir l\'historique';

  @override
  String get toastTextConfigurationSaved => 'Configuration enregistrée';

  @override
  String get toastTextResetedDatabase => 'Configuration réinitialisée';

  @override
  String get titleSettingDescription => 'Gérer vos paramètres';

  @override
  String get labelSettingWorkout => 'Travail';

  @override
  String get labelSettingRest => 'Pause';

  @override
  String get labelSettingSets => 'Séquences';

  @override
  String get labelSettingSummarize => 'Récapitulatif';

  @override
  String get labelSettingOption => 'Option';

  @override
  String get labelSettingUseCircularTimer => 'Utiliser un timer circulaire';

  @override
  String get labelSettingSoundActive => 'Son actif';

  @override
  String textCountTime(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString fois',
      one: '1 fois',
      zero: 'no time',
    );
    return '$_temp0';
  }

  @override
  String get textSummarizeEndText => ' pour la session.';

  @override
  String get drawerHeaderPreferences => 'Préférences';

  @override
  String get drawerHeaderTools => 'Outils';

  @override
  String get drawerHeaderSupport => 'Support';

  @override
  String get drawerHeaderLegal => 'Légal';

  @override
  String get drawerMonthlySummaryText => 'Résumé mensuel';

  @override
  String get drawerAboutUsText => 'À propos de nous';

  @override
  String get drawerVersionInfoText => 'Information de version';

  @override
  String get drawerAuthorizationText => 'Autorisations';

  @override
  String get drawerFeedbackText => 'Feedback';

  @override
  String get drawerRateOnStore => 'Évaluer l\'application';

  @override
  String get drawerPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get drawerTermsOfService => 'Conditions d\'utilisation';

  @override
  String get drawerReportABug => 'Signaler un bug';

  @override
  String get timerIsAlreadyRunning => 'Un timer est déjà en cours';

  @override
  String get buttonKeepIt => 'Garder cette configuration';

  @override
  String get buttonApplyChanges => 'Appliquer les changements';

  @override
  String get keyNoTranslationAvailable => 'Aucun traduction disponible';

  @override
  String get keyWarmUpText => 'Echauffement';

  @override
  String get keyCoreText => 'Planche';

  @override
  String get keyLearningText => 'Etude';

  @override
  String get keyWorkingToMyJob => 'Travail';

  @override
  String get keyMail => 'Gestion d\'emails';

  @override
  String get keySearchJob => 'Recherche de contrat';

  @override
  String get keyCookingSteak => 'Cuisiner un steak';

  @override
  String get keyCookingNuggets => 'Cuisiner des nuggets';

  @override
  String get textToday => 'Aujourd\'hui';

  @override
  String get textYesterday => 'Hier';

  @override
  String get textDateTime => 'Date';

  @override
  String get textPlannedTime => 'Planifié';

  @override
  String get textBreakTime => 'Pause';

  @override
  String get textTime => 'Temps';

  @override
  String get textWorkTime => 'Travail';

  @override
  String get textRestTime => 'Repos';

  @override
  String get textFinishedTime => 'Terminé';

  @override
  String get textSessionToday => 'Session aujourd\'hui';

  @override
  String get textTotalTime => 'Temps total';

  @override
  String get buttonReturnToTimer => 'Retour au timer';

  @override
  String get historyDescription => 'Revoir vos sessions de travail complétées.';

  @override
  String get textSummaryMonthly => 'Résumé mensuel';

  @override
  String get textTotalSessions => 'Sessions totales';

  @override
  String get textAverageSession => 'Session moyenne';

  @override
  String get textDailySessions => 'Sessions quotidiennes';

  @override
  String get textActivityBreakdown => 'Analyse d\'activité';

  @override
  String get textMostProductiveDay => 'Jour le plus productif';

  @override
  String get textLongestStreak => 'Nombre de jours consécutifs';

  @override
  String get textLongestStreakDescription => 'Jours de travail';

  @override
  String get textTaskCompleted => 'Tâche terminée';

  @override
  String get textBreaksTaken => 'Pauses courtes/longues prises';

  @override
  String get textBreaksTakenDescription => 'Total de pauses';

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
      zero: 'aucune session',
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
      other: '$countString jours',
      one: '1 jour',
      zero: 'aucun jour',
    );
    return '$_temp0';
  }

  @override
  String get textShortMonday => 'Lun';

  @override
  String get textShortTuesday => 'Mar';

  @override
  String get textShortWednesday => 'Mer';

  @override
  String get textShortThursday => 'Jeu';

  @override
  String get textShortFriday => 'Ven';

  @override
  String get textShortSaturday => 'Sam';

  @override
  String get textShortSunday => 'Dim';

  @override
  String get error404Description => 'Oups ! La page n\'existe pas.';

  @override
  String languageSelected(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'Anglais',
        'fr': 'Français',
        'other': 'Anglais',
      },
    );
    return 'Langage - $_temp0';
  }

  @override
  String get ofText => 'sur';

  @override
  String get sessionCompletedText => 'Session terminé';

  @override
  String get welcomeScreenTitlePrefix => 'Vous connaissez votre ';

  @override
  String get welcomeScreenTitleHighlight => 'routine';

  @override
  String get welcomeScreenTitleSuffix => '\nmieux que personne.';

  @override
  String get welcomeScreenSubtitleKnowledge => 'Cette application suppose que vous\nconnaissez vos exercices par cœur.';

  @override
  String get welcomeScreenSubtitleSequence => 'Organisez-les exactement comme vous le souhaitez.';

  @override
  String get buttonGetStarted => 'Commencer';

  @override
  String get maintenanceDatabaseReloadFixtures => 'Configuration : recharger la configuration par défaut';

  @override
  String get maintenanceHistoryDeleteAllData => 'Historique : supprimer l\'historique';

  @override
  String get maintenanceButtonDeleteHistory => 'Supprimer historique';

  @override
  String get maintenanceToastHistoryDeleted => 'Historique supprimé';

  @override
  String get feedbackImprovementTitle => 'Aidez-nous à nous améliorer !';

  @override
  String get feedbackHintText => 'Dites-nous en plus...';

  @override
  String get feedbackSendButton => 'Envoyer';

  @override
  String get onboardingSlide2Title => 'Rythmez votre séance';

  @override
  String get onboardingSlide2Subtitle1 => 'Configurez vos temps d\'effort, de repos et le nombre de séries.';

  @override
  String get onboardingSlide2Subtitle2 => 'Activez les alertes sonores et choisissez le style de votre chronomètre.';

  @override
  String get onboardingSlide3Title => 'Suivez vos progrès';

  @override
  String get onboardingSlide3Subtitle1 => 'Consultez l\'historique de vos séances et suivez vos statistiques mensuelles.';

  @override
  String get onboardingSlide3Subtitle2 => 'Analysez vos jours les plus productifs et maintenez votre régularité.';

  @override
  String get buttonSkip => 'Passer';

  @override
  String get drawerRelaunchOnboardingText => 'Visite guidée';

  @override
  String get buttonNext => 'Suivant';
}
