import 'package:hive_flutter/hive_flutter.dart';
import '../../app/hive_boxes.dart';
import '../../domain/domain.dart';

abstract class LocaleTasksDataSource {
  const LocaleTasksDataSource();

  Future<void> addTask({
    required Task task,
    int? index,
  });
}

class LocaleTasksDataSourceImpl extends LocaleTasksDataSource {
  const LocaleTasksDataSourceImpl._internal({
    required Box<Task> taskBox,
  }) : _taskBox = taskBox;

  final Box<Task> _taskBox;

  static Future<LocaleTasksDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final taskBox = await Hive.openBox<Task>(
      HiveBoxes.taskBox,
    );

    final localeTasksDataSourceImpl = LocaleTasksDataSourceImpl._internal(
      taskBox: taskBox,
    );

    return localeTasksDataSourceImpl;
  }

  @override
  Future<void> addTask({
    required Task task,
    int? index,
  }) async {
    if (index == null) {
      await _taskBox.add(
        task,
      );
    } else {
      await _taskBox.putAt(
        index,
        task,
      );
    }
  }
}
