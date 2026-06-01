import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiseworkout/features/database/enums/enums.dart';
import 'package:wiseworkout/features/database/models/bound_model.dart';

part 'preset_model.freezed.dart';
part 'preset_model.g.dart';

@freezed
sealed class PresetModel with _$PresetModel {
  const factory PresetModel({
    required List<BoundModel> bounds,
    @JsonKey(name: 'preset_name') required String name,
    required CategoryEnum category,
    @Default('NO_TRANSLATION_AVAILABLE') @JsonKey(name: 'trad_key') String tradKey,
    int? id,
  }) = _PresetModel;

  factory PresetModel.fromJson(Map<String, dynamic> json) => _$PresetModelFromJson(json);

  static PresetModel empty = const PresetModel(
    bounds: [],
    name: 'Preset unavailable',
    category: CategoryEnum.sport,
  );

  static PresetModel defaultConfiguration = PresetModel.fromJson(
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
  );
}
