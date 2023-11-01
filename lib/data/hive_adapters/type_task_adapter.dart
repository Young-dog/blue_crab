import 'package:hive/hive.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

class TypeTaskAdapter extends TypeAdapter<TypeTask> {
  @override
  TypeTask read(BinaryReader reader) {
    final value = reader.readInt();

    return TypeTask.values[value];
  }

  @override
  int get typeId => HiveTypeId.typeTaskAdapter;

  @override
  void write(BinaryWriter writer, TypeTask obj) {
    writer.writeInt(obj.index);
  }

}