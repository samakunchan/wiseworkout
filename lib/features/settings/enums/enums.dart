enum TimerField { minutes, seconds }

enum LanguageEnum {
  german(key: 'de', value: 'Deutsch', languageCode: 'de_DE'),
  english(key: 'en', value: 'English', languageCode: 'en_GB'),
  french(key: 'fr', value: 'Français', languageCode: 'fr_FR'),
  spanish(key: 'es', value: 'Español', languageCode: 'es_ES'),
  chinese(key: 'zh', value: '中文', languageCode: 'zh_CN'),
  ;

  const LanguageEnum({
    required this.value,
    required this.key,
    required this.languageCode,
  });

  final String key;
  final String value;
  final String languageCode;
}
