import 'package:freezed_annotation/freezed_annotation.dart';

part 'bound_model.freezed.dart';
part 'bound_model.g.dart';

@freezed
sealed class BoundModel with _$BoundModel {
  const factory BoundModel({
    required double min,
    required double max,
    required double value, // Doit etre entre le min et max
    @JsonKey(name: 'bound_name') required String name, // workDuration, restDuration, divisions
    int? id,
  }) = _BoundModel;

  factory BoundModel.fromJson(Map<String, dynamic> json) => _$BoundModelFromJson(json);
}

extension BoundModelExtension on List<BoundModel> {
  bool isFirst(BoundModel bound) {
    return indexOf(bound) == 0;
  }
}
