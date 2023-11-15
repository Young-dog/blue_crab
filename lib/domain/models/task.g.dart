// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      type: fields[5] as TypeTask,
      title: fields[0] as String,
      description: fields[1] as String,
      priority: fields[2] as Priority?,
      subtasks: (fields[3] as List).cast<Subtask>(),
      tag: fields[4] as Tag?,
      dateStart: fields[6] as DateTime?,
      timeStart: fields[7] as TimeOfDay?,
      dateEnd: fields[8] as DateTime?,
      timeEnd: fields[9] as TimeOfDay?,
      finish: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(11)
      ..writeByte(8)
      ..write(obj.dateEnd)
      ..writeByte(9)
      ..write(obj.timeEnd)
      ..writeByte(10)
      ..write(obj.finish)
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
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
