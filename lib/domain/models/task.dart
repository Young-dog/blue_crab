import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../app/app.dart';
import '../domain.dart';

part 'task.g.dart';

@HiveType(typeId: HiveTypeId.task)
class Task extends TaskModel {
  const Task({
    required super.type,
    required super.title,
    required super.description,
    required super.priority,
    required super.subtasks,
    required super.tag,
    required super.dateStart,
    required super.timeStart,
    required this.dateEnd,
    required this.timeEnd,
    required this.finish,
  });

  @HiveField(8)
  final DateTime? dateEnd;

  @HiveField(9)
  final TimeOfDay? timeEnd;

  @HiveField(10)
  final bool finish;

  Task copyWith({
    bool? finish,
    List<Subtask>? subtasks,
  }) {
    return Task(
      type: type,
      title: title,
      description: description,
      priority: priority,
      dateStart: dateStart,
      dateEnd: dateEnd,
      timeStart: timeStart,
      timeEnd: timeEnd,
      subtasks: subtasks ?? this.subtasks,
      tag: tag,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [
        type,
        title,
        description,
        subtasks,
        tag,
        priority,
        dateStart,
        timeStart,
        dateEnd,
        timeEnd,
        finish,
      ];
}
