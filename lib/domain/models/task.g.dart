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
      title: fields[0] as String,
      description: fields[1] as String,
      subtasks: (fields[7] as List).cast<Subtask>(),
      tag: fields[8] as Tag?,
      priority: fields[2] as PriorityTask?,
      dateStart: fields[3] as DateTime?,
      dateEnd: fields[4] as DateTime?,
      timeStart: fields[5] as TimeOfDay?,
      timeEnd: fields[6] as TimeOfDay?,
      finish: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(10)
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
      ..write(obj.subtasks)
      ..writeByte(8)
      ..write(obj.tag)
      ..writeByte(9)
      ..write(obj.finish);
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
