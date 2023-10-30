import 'package:hive_flutter/hive_flutter.dart';
import '../../app/hive_boxes.dart';
import '../../domain/domain.dart';

abstract class LocaleTasksDataSource {
  const LocaleTasksDataSource();

  Future<void> addTask({
    required Task task,
    int? index,
  });

  Future<void> delTasks({
    required int index,
  });

  Future<void> finishTasks({
    required int index,
    required bool finish,
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
      Task? updateTask;

      if (task.finish) {
        final subtasks = task.subtasks.map((e) {
          final sub = e.copyWith(finish: true);
          return sub;
        }).toList();
        updateTask = task.copyWith(
          subtasks: subtasks,
        );
      }

      await _taskBox.putAt(
        index,
        updateTask ?? task,
      );
    }
  }

  @override
  Future<void> delTasks({
    required int index,
  }) async {
    await _taskBox.deleteAt(index);
  }

  @override
  Future<void> finishTasks({
    required int index,
    required bool finish,
  }) async {
    final task = _taskBox.values.elementAt(index);

    final subtasks = task.subtasks.map((e) {
      final sub = e.copyWith(finish: finish);
      return sub;
    }).toList();

    final updateTask = task.copyWith(
      finish: finish,
      subtasks: subtasks,
    );

    await _taskBox.putAt(
      index,
      updateTask,
    );
  }
}
