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
    );
  }

  @override
  void write(BinaryWriter writer, SeriesEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
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
