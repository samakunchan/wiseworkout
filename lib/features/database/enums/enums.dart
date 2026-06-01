enum CategoryEnum {
  study('study'),
  sport('sport'),
  freelanceAdmin('freelanceAdmin'),
  food('food')
  ;

  const CategoryEnum(this.value);

  final String value;
}

enum StatusEnum {
  regular('regular'),
  circular('circular')
  ;

  const StatusEnum(this.value);

  final String value;
}

enum SoundStatusEnum {
  active('active'),
  inactive('inactive')
  ;

  const SoundStatusEnum(this.value);

  final String value;
}

enum LanguageEnum {
  english(key: 'en', value: 'English', languageCode: 'en_EN'),
  french(key: 'fr', value: 'Français', languageCode: 'fr_FR')
  ;

  const LanguageEnum({required this.value, required this.key, required this.languageCode});

  final String key;
  final String value;
  final String languageCode;
}
