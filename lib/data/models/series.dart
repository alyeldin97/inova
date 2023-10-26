// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:Inova/domain/entities/null_checkers.dart';

import '../../configs/constants/json_keys.dart';
import '../../domain/entities/series.dart';

class SeriesModel {
  String name;
  String image;
  String description;
  String video;
  String intensity;
  String difficulty;
  String totalRunTime;
  List<CoachModel> coaches;
  List<ClassModel> classes;
  List<PostModel> posts;
  SeriesModel({
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

  //****************************************************

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
        name: (json[JsonKeys.name] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        image: (json[JsonKeys.image] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        description: (json[JsonKeys.description] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        video: (json[JsonKeys.video] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        intensity: (json[JsonKeys.intensity] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        difficulty: (json[JsonKeys.difficulty] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        totalRunTime: (json[JsonKeys.totalRunTime] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        coaches: List<CoachModel>.from((json[JsonKeys.coaches] as List?)
            .ifNullOrEmptyReturn([]).map(
                (coachMap) => CoachModel.fromJson(coachMap))),
        classes: List<ClassModel>.from((json[JsonKeys.classess] as List?)
            .ifNullOrEmptyReturn([]).map(
                (classMap) => ClassModel.fromJson(classMap))),
        posts: List<PostModel>.from((json[JsonKeys.posts] as List?)
            .ifNullOrEmptyReturn([]).map(
                (postMap) => PostModel.fromJson(postMap))),
      );

  //****************************************************

  SeriesEntity toEntity() {
    return SeriesEntity(
      name: name,
      image: image,
      description: description,
      video: video,
      intensity: intensity,
      difficulty: difficulty,
      totalRunTime: totalRunTime,
      coaches: coaches.map((coach) => coach.toEntity()).toList(),
      classes: classes.map((classs) => classs.toEntity()).toList(),
      posts: posts.map((post) => post.toEntity()).toList(),
    );
  }
}

class CoachModel {
  String name;
  String image;
  String about;
  CoachModel({
    required this.name,
    required this.image,
    required this.about,
  });

  //****************************************************

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
        name: (json[JsonKeys.name] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        image: (json[JsonKeys.image] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        about: (json[JsonKeys.about] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
      );

  //****************************************************

  CoachEntity toEntity() {
    return CoachEntity(
      name: name,
      image: image,
      about: about,
    );
  }
}

class ClassModel {
  String name;
  String duration;
  String description;
  String url;
  ClassModel({
    required this.name,
    required this.duration,
    required this.description,
    required this.url,
  });

  //****************************************************

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        name: (json[JsonKeys.name] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        duration: (json[JsonKeys.duration] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        description: (json[JsonKeys.description] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        url: (json[JsonKeys.url] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
      );

  //****************************************************

  ClassEntity toEntity() {
    return ClassEntity(
      name: name,
      duration: duration,
      description: description,
      url: url,
    );
  }
}

class PostModel {
  UserModel user;
  String date;
  String comment;
  int classId;
  String at;
  String challengeName;
  PostModel({
    required this.user,
    required this.date,
    required this.comment,
    required this.classId,
    required this.at,
    required this.challengeName,
  });

  //****************************************************

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        user: UserModel.fromJson(json[JsonKeys.user]),
        date: (json[JsonKeys.date] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        comment: (json[JsonKeys.comments] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        classId: (json[JsonKeys.classId] as int?).ifNullReturn(0),
        at: (json[JsonKeys.at] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        challengeName: (json[JsonKeys.challengeName] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
      );

  //****************************************************

  PostEntity toEntity() {
    return PostEntity(
      user: user.toEntity(),
      date: date,
      comment: comment,
      classId: classId,
      at: at,
      challengeName: challengeName,
    );
  }
}

class UserModel {
  String name;
  String image;
  UserModel({
    required this.name,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: (json[JsonKeys.at] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
        image: (json[JsonKeys.at] as String?)
            .ifNullOrEmptyReturn("handleErrorData"),
      );

  toEntity() {
    return UserEntity(name: name, image: image);
  }
}
