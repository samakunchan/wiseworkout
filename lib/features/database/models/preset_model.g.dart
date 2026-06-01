// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresetModel _$PresetModelFromJson(Map<String, dynamic> json) => _PresetModel(
  bounds: (json['bounds'] as List<dynamic>)
      .map((e) => BoundModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['preset_name'] as String,
  category: $enumDecode(_$CategoryEnumEnumMap, json['category']),
  tradKey: json['trad_key'] as String? ?? 'NO_TRANSLATION_AVAILABLE',
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$PresetModelToJson(_PresetModel instance) =>
    <String, dynamic>{
      'bounds': instance.bounds,
      'preset_name': instance.name,
      'category': _$CategoryEnumEnumMap[instance.category]!,
      'trad_key': instance.tradKey,
      'id': instance.id,
    };

const _$CategoryEnumEnumMap = {
  CategoryEnum.study: 'study',
  CategoryEnum.sport: 'sport',
  CategoryEnum.freelanceAdmin: 'freelanceAdmin',
  CategoryEnum.food: 'food',
};
