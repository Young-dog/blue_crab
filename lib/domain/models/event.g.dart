// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 9;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      type: fields[5] as TypeTask,
      title: fields[0] as String,
      description: fields[1] as String,
      priority: fields[2] as Priority?,
      subtasks: (fields[3] as List).cast<Subtask>(),
      tag: fields[4] as Tag?,
      dateStart: fields[6] as DateTime?,
      timeStart: fields[7] as TimeOfDay?,
      days: (fields[8] as List).cast<int>(),
      finishDates: (fields[9] as List).cast<DateTime>(),
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(10)
      ..writeByte(8)
      ..write(obj.days)
      ..writeByte(9)
      ..write(obj.finishDates)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.priority)
      ..writeByte(3)
      ..write(obj.subtasks)
      ..writeByte(4)
      ..write(obj.tag)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.dateStart)
      ..writeByte(7)
      ..write(obj.timeStart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
