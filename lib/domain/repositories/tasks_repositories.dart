import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class TasksRepository {
  const TasksRepository();

  Stream<List<Task>> get tasksChanges;

  List<Task> get tasks;

  Future<void> addTask({
    required Task? previousTask,
    required TypeTask type,
    required String title,
    required String description,
    required PriorityTask? priority,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required TimeOfDay? timeStart,
    required TimeOfDay? timeEnd,
    required List<Subtask> subtasks,
    required Tag? tag,
    required bool finish,
  });

  Future<void> delTasks({
    required Task task,
  });

  Future<void> finishTasks({
    required Task task,
    required bool finish,
  });
}

class TasksRepositoryImpl implements TasksRepository, Disposable {
  TasksRepositoryImpl._internal({
    required List<Task> tasks,
    required LocaleTasksDataSource localeTasksDataSource,
  })  : _localeTasksDataSource = localeTasksDataSource,
        _taskController = StreamController<List<Task>>.broadcast(),
        _tasks = tasks;

  static Future<TasksRepositoryImpl> create({
    required LocaleTasksDataSource localeTasksDataSource,
  }) async {
    final tasks = await localeTasksDataSource.getTasks();

    final tasksRepository = TasksRepositoryImpl._internal(
      tasks: tasks,
      localeTasksDataSource: localeTasksDataSource,
    );

    return tasksRepository;
  }

  final LocaleTasksDataSource _localeTasksDataSource;

  final StreamController<List<Task>> _taskController;

  List<Task> _tasks;

  @override
  Future<void> addTask({
    required Task? previousTask,
    required TypeTask type,
    required String title,
    required String description,
    required PriorityTask? priority,
    required DateTime? dateStart,
    required DateTime? dateEnd,
    required TimeOfDay? timeStart,
    required TimeOfDay? timeEnd,
    required List<Subtask> subtasks,
    required Tag? tag,
    required bool finish,
  }) async {
    final task = Task(
      title: title,
      description: description,
      subtasks: subtasks,
      priority: priority,
      dateStart: dateStart,
      dateEnd: dateEnd,
      timeStart: timeStart,
      timeEnd: timeEnd,
      tag: tag,
      finish: finish,
      type: type,
    );

    await _localeTasksDataSource.addTask(
      previousTask: previousTask,
      currentTask: task,
    );

    _tasks = await _localeTasksDataSource.getTasks();

    _taskController.add(_tasks);
  }

  @override
  Future<void> delTasks({
    required Task task,
  }) async {
    await _localeTasksDataSource.delTasks(
      task: task,
    );

    _tasks = await _localeTasksDataSource.getTasks();

    _taskController.add(_tasks);
  }

  @override
  Future<void> finishTasks({
    required Task task,
    required bool finish,
  }) async {
    await _localeTasksDataSource.finishTasks(
      task: task,
      finish: finish,
    );

    _tasks = await _localeTasksDataSource.getTasks();

    _taskController.add(_tasks);
  }

  @override
  FutureOr<void> onDispose() {
    _taskController.close();
  }

  @override
  Stream<List<Task>> get tasksChanges => _taskController.stream;

  @override
  List<Task> get tasks => _tasks;
}
