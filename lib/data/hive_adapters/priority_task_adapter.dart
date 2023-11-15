import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

class PriorityTaskAdapter extends TypeAdapter<Priority> {
  @override
  Priority read(BinaryReader reader) {
    final value = reader.readInt();

    return Priority.values[value];
  }

  @override
  int get typeId => HiveTypeId.priorityTask;

  @override
  void write(BinaryWriter writer, Priority obj) {
    writer.writeInt(
      obj.index,
    );
  }
}
