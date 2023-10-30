import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../../domain/domain.dart';

class PriorityTaskAdapter extends TypeAdapter<PriorityTask> {
  @override
  PriorityTask read(BinaryReader reader) {
    final value = reader.readInt();

    return PriorityTask.values[value];
  }

  @override
  int get typeId => HiveTypeId.priorityTask;

  @override
  void write(BinaryWriter writer, PriorityTask obj) {
    writer.writeInt(
      obj.index,
    );
  }
}
