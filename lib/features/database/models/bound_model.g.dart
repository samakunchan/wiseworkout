// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bound_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoundModel _$BoundModelFromJson(Map<String, dynamic> json) => _BoundModel(
  min: (json['min'] as num).toDouble(),
  max: (json['max'] as num).toDouble(),
  value: (json['value'] as num).toDouble(),
  name: json['bound_name'] as String,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$BoundModelToJson(_BoundModel instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'value': instance.value,
      'bound_name': instance.name,
      'id': instance.id,
    };
