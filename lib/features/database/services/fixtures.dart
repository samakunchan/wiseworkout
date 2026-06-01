import 'package:wiseworkout/features/database/enums/enums.dart';
import 'package:wiseworkout/features/database/models/bound_model.dart';
import 'package:wiseworkout/features/database/models/preset_model.dart';

/// Default configuration
List<PresetModel> kDefaultConfiguration = <PresetModel>[
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Working',
      'category': CategoryEnum.study.value,
      'trad_key': 'KEY_WORKING_TO_MY_JOB',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 1800,
            'min': 0,
            'value': 1200,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 600,
            'min': 0,
            'value': 400,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
];

/// Sport
List<PresetModel> kPresetsSport = <PresetModel>[
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Warm up',
      'category': CategoryEnum.sport.value,
      'trad_key': 'KEY_WARM_UP',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 360,
            'min': 60,
            'value': 120,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 60,
            'min': 15,
            'value': 50,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Core',
      'category': CategoryEnum.sport.value,
      'trad_key': 'KEY_CORE',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 360,
            'min': 60,
            'value': 120,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 60,
            'min': 15,
            'value': 50,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
];

/// Etude
List<PresetModel> kPresetsStudy = <PresetModel>[
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Learning',
      'category': CategoryEnum.study.value,
      'trad_key': 'KEY_LEARNING',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 1800,
            'min': 900,
            'value': 1200,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 600,
            'min': 60,
            'value': 400,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Working',
      'category': CategoryEnum.study.value,
      'trad_key': 'KEY_WORKING_TO_MY_JOB',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 1800,
            'min': 900,
            'value': 1200,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 600,
            'min': 60,
            'value': 400,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
];

/// Admin
List<PresetModel> kPresetsFreelanceAdmin = <PresetModel>[
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Mail',
      'category': CategoryEnum.freelanceAdmin.value,
      'trad_key': 'KEY_MAIL',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 900,
            'min': 300,
            'value': 500,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 600,
            'min': 60,
            'value': 400,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Search Job',
      'category': CategoryEnum.freelanceAdmin.value,
      'trad_key': 'KEY_SEARCH_JOB',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 900,
            'min': 300,
            'value': 500,
            'bound_name': 'workout',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 600,
            'min': 60,
            'value': 400,
            'bound_name': 'rest',
          },
        ).toJson(),
      ],
    },
  ),
];

/// Food
List<PresetModel> kPresetsFood = <PresetModel>[
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Steak',
      'category': CategoryEnum.food.value,
      'trad_key': 'KEY_COOKING_STEAK',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 360,
            'min': 0,
            'value': 200,
            'bound_name': 'cook',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 120,
            'min': 0,
            'value': 40,
            'bound_name': 'turn',
          },
        ).toJson(),
      ],
    },
  ),
  PresetModel.fromJson(
    <String, dynamic>{
      'preset_name': 'Nuggets',
      'category': CategoryEnum.food.value,
      'trad_key': 'KEY_COOKING_NUGGETS',
      'bounds': [
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 900,
            'min': 300,
            'value': 500,
            'bound_name': 'cook',
          },
        ).toJson(),
        BoundModel.fromJson(
          <String, dynamic>{
            'max': 120,
            'min': 0,
            'value': 40,
            'bound_name': 'turn',
          },
        ).toJson(),
      ],
    },
  ),
];

List<PresetModel> kAllPresets = <PresetModel>[
  ...kDefaultConfiguration,
  ...kPresetsSport,
  ...kPresetsStudy,
  ...kPresetsFreelanceAdmin,
  ...kPresetsFood,
];
