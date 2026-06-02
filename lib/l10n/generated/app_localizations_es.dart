// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get titleSettingScreen => 'Ajustes';

  @override
  String get titleMainScreen => 'WiseWorkout';

  @override
  String get titleMaintenanceScreen => 'Mantenimiento';

  @override
  String get titleHistoryScreen => 'Historial';

  @override
  String get navigateToSettingScreen => 'Ir a ajustes';

  @override
  String get navigateToMaintenanceScreen => 'Ir a mantenimiento';

  @override
  String get navigateToHistoryScreen => 'Ir al historial';

  @override
  String get navigateToMainScreen => 'Ir a inicio';

  @override
  String get buttonLoadPresets => 'Cargar secuencias';

  @override
  String get buttonApplyConfiguration => 'Aplicar configuración';

  @override
  String get buttonResetDatabase => 'Restablecer configuración';

  @override
  String get buttonChoose => 'Elegir';

  @override
  String get buttonCancel => 'Cancelar';

  @override
  String get buttonShowHistory => 'Ver historial';

  @override
  String get toastTextConfigurationSaved => 'Configuración guardada';

  @override
  String get toastTextResetedDatabase => 'Configuración restablecida';

  @override
  String get titleSettingDescription => 'Administrar sus ajustes';

  @override
  String get labelSettingWorkout => 'Trabajo';

  @override
  String get labelSettingRest => 'Descanso';

  @override
  String get labelSettingSets => 'Series';

  @override
  String get labelSettingSummarize => 'Resumen';

  @override
  String get labelSettingOption => 'Opción';

  @override
  String get labelSettingUseCircularTimer => 'Usar temporizador circular';

  @override
  String get labelSettingSoundActive => 'Sonido activo';

  @override
  String textCountTime(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString veces',
      one: '1 vez',
      zero: 'ninguna vez',
    );
    return '$_temp0';
  }

  @override
  String get textSummarizeEndText => ' para la sesión.';

  @override
  String get drawerHeaderPreferences => 'Preferencias';

  @override
  String get drawerHeaderTools => 'Herramientas';

  @override
  String get drawerHeaderSupport => 'Soporte';

  @override
  String get drawerHeaderLegal => 'Legal';

  @override
  String get drawerMonthlySummaryText => 'Resumen mensual';

  @override
  String get drawerAboutUsText => 'Sobre nosotros';

  @override
  String get drawerVersionInfoText => 'Información de versión';

  @override
  String get drawerAuthorizationText => 'Autorizaciones';

  @override
  String get drawerFeedbackText => 'Comentarios';

  @override
  String get drawerRateOnStore => 'Calificar la aplicación';

  @override
  String get drawerPrivacyPolicy => 'Política de privacidad';

  @override
  String get drawerTermsOfService => 'Condiciones de servicio';

  @override
  String get drawerReportABug => 'Reportar un error';

  @override
  String get timerIsAlreadyRunning => 'El temporizador ya está en marcha';

  @override
  String get buttonKeepIt => 'Conservarla';

  @override
  String get buttonApplyChanges => 'Aplicar cambios';

  @override
  String get keyNoTranslationAvailable => 'Sin traducción disponible';

  @override
  String get keyWarmUpText => 'Calentamiento';

  @override
  String get keyCoreText => 'Plancha';

  @override
  String get keyLearningText => 'Estudio';

  @override
  String get keyWorkingToMyJob => 'Trabajo';

  @override
  String get keyMail => 'Gestión de correos';

  @override
  String get keySearchJob => 'Buscar contrato';

  @override
  String get keyCookingSteak => 'Cocinar un filete';

  @override
  String get keyCookingNuggets => 'Cocinar nuggets';

  @override
  String get textToday => 'Hoy';

  @override
  String get textYesterday => 'Ayer';

  @override
  String get textDateTime => 'Fecha';

  @override
  String get textPlannedTime => 'Planificado';

  @override
  String get textBreakTime => 'Pausa';

  @override
  String get textTime => 'Tiempo';

  @override
  String get textWorkTime => 'Trabajo';

  @override
  String get textRestTime => 'Descanso';

  @override
  String get textFinishedTime => 'Terminado';

  @override
  String get textSessionToday => 'Sesión de hoy';

  @override
  String get textTotalTime => 'Tiempo total';

  @override
  String get buttonReturnToTimer => 'Volver al temporizador';

  @override
  String get historyDescription => 'Revisar sus sesiones de entrenamiento completadas.';

  @override
  String get textSummaryMonthly => 'Resumen mensual';

  @override
  String get textTotalSessions => 'Sesiones totales';

  @override
  String get textAverageSession => 'Sesión promedio';

  @override
  String get textDailySessions => 'Sesiones diarias';

  @override
  String get textActivityBreakdown => 'Desglose de actividad';

  @override
  String get textMostProductiveDay => 'Día más productivo';

  @override
  String get textLongestStreak => 'Racha más larga';

  @override
  String get textLongestStreakDescription => 'Días de trabajo';

  @override
  String get textTaskCompleted => 'Tarea completada';

  @override
  String get textBreaksTaken => 'Pausas tomadas';

  @override
  String get textBreaksTakenDescription => 'Total de pausas';

  @override
  String textNSession(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString sesiones',
      one: '1 sesión',
      zero: 'ninguna sesión',
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
      other: '$countString días',
      one: '1 día',
      zero: 'ningún día',
    );
    return '$_temp0';
  }

  @override
  String get textShortMonday => 'Lun';

  @override
  String get textShortTuesday => 'Mar';

  @override
  String get textShortWednesday => 'Mié';

  @override
  String get textShortThursday => 'Jue';

  @override
  String get textShortFriday => 'Vie';

  @override
  String get textShortSaturday => 'Sáb';

  @override
  String get textShortSunday => 'Dom';

  @override
  String get error404Description => 'Página no encontrada';

  @override
  String languageSelected(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': 'Inglés',
        'fr': 'Francés',
        'other': 'Inglés',
      },
    );
    return 'Idioma - $_temp0';
  }

  @override
  String get ofText => 'de';

  @override
  String get sessionCompletedText => 'Sesión completada';

  @override
  String get welcomeScreenTitlePrefix => 'Conoce su ';

  @override
  String get welcomeScreenTitleHighlight => 'rutina';

  @override
  String get welcomeScreenTitleSuffix => '\nmejor que nadie.';

  @override
  String get welcomeScreenSubtitleKnowledge => 'Esta aplicación asume que\nconoce sus ejercicios de memoria.';

  @override
  String get welcomeScreenSubtitleSequence => 'Secuéncielos exactamente como desee.';

  @override
  String get buttonGetStarted => 'Comenzar';

  @override
  String get maintenanceDatabaseReloadFixtures => 'Configuración: recargar configuración por defecto';

  @override
  String get maintenanceHistoryDeleteAllData => 'Historial: eliminar todo el historial';

  @override
  String get maintenanceButtonDeleteHistory => 'Eliminar historial';

  @override
  String get maintenanceToastHistoryDeleted => 'Datos de historial eliminados';

  @override
  String get feedbackImprovementTitle => '¡Ayúdenos a mejorar!';

  @override
  String get feedbackHintText => 'Cuéntenos más...';

  @override
  String get feedbackSendButton => 'Enviar';
}
