import 'dart:ui';

import 'package:hive/hive.dart';

import '../../app/app.dart';

class ColorAdapter extends TypeAdapter<Color> {
  @override
  Color read(BinaryReader reader) {
    final value = reader.readInt();
    return Color(value);
  }

  @override
  int get typeId => HiveTypeId.color;

  @override
  void write(BinaryWriter writer, Color obj) {
    writer.writeInt(
      obj.value,
    );
  }
}
