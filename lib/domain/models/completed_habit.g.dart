// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedHabitAdapter extends TypeAdapter<CompletedHabit> {
  @override
  final int typeId = 11;

  @override
  CompletedHabit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedHabit(
      finishCountRepetition: fields[0] as int,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedHabit obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.finishCountRepetition)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedHabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
