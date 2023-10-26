import 'package:hive_flutter/hive_flutter.dart';
part 'series.g.dart';

@HiveType(typeId: 1)
class SeriesEntity {
  @HiveField(0)
  String name;
  SeriesEntity({
    required this.name,
  });
}
