import 'package:hive_flutter/hive_flutter.dart';
import '../../app/hive_boxes.dart';
import '../../domain/domain.dart';

abstract class LocaleTasksDataSource {
  const LocaleTasksDataSource();

  Future<void> addTask({
    required Task task,
  });

  Future<List<Task>> getTasks();

  Future<void> delTasks({
    required Task task,
  });

  Future<void> finishTasks({
    required Task task,
    required bool finish,
  });
}

class LocaleTasksDataSourceImpl implements LocaleTasksDataSource {
  const LocaleTasksDataSourceImpl._internal({
    required Box<Task> taskBox,
  }) : _taskBox = taskBox;

  final Box<Task> _taskBox;

  static Future<LocaleTasksDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final taskBox = await hive.openBox<Task>(
      HiveBoxes.tasksBox,
    );

    final localeTasksDataSourceImpl = LocaleTasksDataSourceImpl._internal(
      taskBox: taskBox,
    );

    return localeTasksDataSourceImpl;
  }

  @override
  Future<void> addTask({
    required Task task,
  }) async {
    if (_taskBox.values.toList().contains(task)) {
      final index = _taskBox.values.toList().indexOf(task);

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
    } else {
      await _taskBox.add(
        task,
      );
    }
  }

  @override
  Future<void> delTasks({
    required Task task,
  }) async {
    final index = _taskBox.values.toList().indexOf(task);

    await _taskBox.deleteAt(index);
  }

  @override
  Future<void> finishTasks({
    required Task task,
    required bool finish,
  }) async {
    final index = _taskBox.values.toList().indexOf(task);

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

  @override
  Future<List<Task>> getTasks() async {
    final tasks = _taskBox.values.toList();

    return tasks;
  }
}
