// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PurposeAdapter extends TypeAdapter<Purpose> {
  @override
  final int typeId = 4;

  @override
  Purpose read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Purpose(
      title: fields[0] as String,
      description: fields[1] as String,
      tag: fields[7] as Tag?,
      priority: fields[2] as Priority?,
      dateStart: fields[3] as DateTime?,
      dateEnd: fields[4] as DateTime?,
      timeStart: fields[5] as TimeOfDay?,
      timeEnd: fields[6] as TimeOfDay?,
    );
  }

  @override
  void write(BinaryWriter writer, Purpose obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.priority)
      ..writeByte(3)
      ..write(obj.dateStart)
      ..writeByte(4)
      ..write(obj.dateEnd)
      ..writeByte(5)
      ..write(obj.timeStart)
      ..writeByte(6)
      ..write(obj.timeEnd)
      ..writeByte(7)
      ..write(obj.tag);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PurposeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
