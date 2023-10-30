import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../app/hive_type_id.dart';

class TimeOfDayAdapter extends TypeAdapter<TimeOfDay> {
  @override
  TimeOfDay read(BinaryReader reader) {
    final hour = reader.readByte();
    final minute = reader.readByte();

    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  int get typeId => HiveTypeId.timeOfDayAdapter;

  @override
  void write(BinaryWriter writer, TimeOfDay obj) {
    writer..writeByte(obj.hour)
    ..writeByte(obj.minute);
  }

}