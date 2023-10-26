import 'package:Inova/domain/entities/null_checkers.dart';
import '../../configs/constants/json_keys.dart';
import '../../domain/entities/series.dart';

class SeriesModel {
  String name;
  SeriesModel({required this.name});

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        name: (json[JsonKeys.firstName] as String?).ifNullOrEmptyReturn(""),
      );

  SeriesEntity toEntity() {
    return SeriesEntity(
      name: name,
    );
  }
}
