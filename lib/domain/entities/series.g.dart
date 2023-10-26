// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesEntityAdapter extends TypeAdapter<SeriesEntity> {
  @override
  final int typeId = 1;

  @override
  SeriesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesEntity(
      name: fields[0] as String,
      image: fields[1] as String,
      description: fields[2] as String,
      video: fields[3] as String,
      intensity: fields[4] as String,
      difficulty: fields[5] as String,
      totalRunTime: fields[6] as String,
      coaches: (fields[7] as List).cast<CoachEntity>(),
      classes: (fields[8] as List).cast<ClassEntity>(),
      posts: (fields[9] as List).cast<PostEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, SeriesEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.video)
      ..writeByte(4)
      ..write(obj.intensity)
      ..writeByte(5)
      ..write(obj.difficulty)
      ..writeByte(6)
      ..write(obj.totalRunTime)
      ..writeByte(7)
      ..write(obj.coaches)
      ..writeByte(8)
      ..write(obj.classes)
      ..writeByte(9)
      ..write(obj.posts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoachEntityAdapter extends TypeAdapter<CoachEntity> {
  @override
  final int typeId = 2;

  @override
  CoachEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoachEntity(
      name: fields[0] as String,
      image: fields[1] as String,
      about: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CoachEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoachEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClassEntityAdapter extends TypeAdapter<ClassEntity> {
  @override
  final int typeId = 3;

  @override
  ClassEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClassEntity(
      name: fields[0] as String,
      duration: fields[1] as String,
      description: fields[2] as String,
      url: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ClassEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.duration)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClassEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PostEntityAdapter extends TypeAdapter<PostEntity> {
  @override
  final int typeId = 4;

  @override
  PostEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostEntity(
      user: fields[0] as UserEntity,
      date: fields[1] as String,
      comment: fields[2] as String,
      classId: fields[3] as int,
      at: fields[4] as String,
      challengeName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PostEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.classId)
      ..writeByte(4)
      ..write(obj.at)
      ..writeByte(5)
      ..write(obj.challengeName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 5;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      name: fields[0] as String,
      image: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
