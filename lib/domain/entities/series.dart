// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'series.g.dart';

@HiveType(typeId: 1)
class SeriesEntity {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String description;
  @HiveField(3)
  String video;
  @HiveField(4)
  String intensity;
  @HiveField(5)
  String difficulty;
  @HiveField(6)
  String totalRunTime;
  @HiveField(7)
  List<CoachEntity> coaches;
  @HiveField(8)
  List<ClassEntity> classes;
  @HiveField(9)
  List<PostEntity> posts;
  SeriesEntity({
    required this.name,
    required this.image,
    required this.description,
    required this.video,
    required this.intensity,
    required this.difficulty,
    required this.totalRunTime,
    required this.coaches,
    required this.classes,
    required this.posts,
  });

  factory SeriesEntity.empty() {
    return SeriesEntity(
        name: "name",
        image: "image",
        description: "description",
        video: "video",
        intensity: "intensity",
        difficulty: "difficulty",
        totalRunTime: "totalRunTime",
        coaches: [],
        classes: [],
        posts: []);
  }
}

@HiveType(typeId: 2)
class CoachEntity {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  @HiveField(2)
  String about;
  CoachEntity({
    required this.name,
    required this.image,
    required this.about,
  });
}

@HiveType(typeId: 3)
class ClassEntity {
  @HiveField(0)
  String name;
  @HiveField(1)
  String duration;
  @HiveField(2)
  String description;
  @HiveField(3)
  String url;
  ClassEntity({
    required this.name,
    required this.duration,
    required this.description,
    required this.url,
  });
}

@HiveType(typeId: 4)
class PostEntity {
  @HiveField(0)
  UserEntity user;
  @HiveField(1)
  String date;
  @HiveField(2)
  String comment;
  @HiveField(3)
  int classId;
  @HiveField(4)
  String at;
  @HiveField(5)
  String challengeName;
  PostEntity({
    required this.user,
    required this.date,
    required this.comment,
    required this.classId,
    required this.at,
    required this.challengeName,
  });
}

@HiveType(typeId: 5)
class UserEntity {
  @HiveField(0)
  String name;
  @HiveField(1)
  String image;
  UserEntity({
    required this.name,
    required this.image,
  });
}
