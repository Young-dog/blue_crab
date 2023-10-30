import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class TasksRepository {
  const TasksRepository();

  Future<void> addTask({
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

class TasksRepositoryImpl extends TasksRepository {
  const TasksRepositoryImpl({
    required LocaleTasksDataSource localeTasksDataSource,
  }) : _localeTasksDataSource = localeTasksDataSource;

  final LocaleTasksDataSource _localeTasksDataSource;

  @override
  Future<void> addTask({
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
    int? index,
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
    );

    await _localeTasksDataSource.addTask(
      task: task,
      index: index,
    );
  }

  @override
  Future<void> delTasks({
    required int index,
  }) async {
    await _localeTasksDataSource.delTasks(
      index: index,
    );
  }

  @override
  Future<void> finishTasks({
    required int index,
    required bool finish,
  }) async {
    await _localeTasksDataSource.finishTasks(
      index: index,
      finish: finish,
    );
  }
}
