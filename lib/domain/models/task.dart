import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../app/app.dart';
import '../domain.dart';

part 'task.g.dart';

@HiveType(typeId: HiveTypeId.task)
class Task extends Equatable {
  const Task({
    required this.title,
    required this.description,
    required this.subtasks,
    this.tag,
    this.priority,
    this.dateStart,
    this.dateEnd,
    this.timeStart,
    this.timeEnd,
    this.finish = false,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final PriorityTask? priority;

  @HiveField(3)
  final DateTime? dateStart;

  @HiveField(4)
  final DateTime? dateEnd;

  @HiveField(5)
  final TimeOfDay? timeStart;

  @HiveField(6)
  final TimeOfDay? timeEnd;

  @HiveField(7)
  final List<Subtask> subtasks;

  @HiveField(8)
  final Tag? tag;

  @HiveField(9)
  final bool finish;

  Task copyWith({bool? finish, List<Subtask>? subtasks}) {
    return Task(
    title: title,
    description: description,
    priority: priority,
    dateStart: dateStart,
    dateEnd: dateEnd,
    timeEnd: timeEnd,
    subtasks: subtasks ?? this.subtasks,
    tag: tag,
    finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    subtasks,
    tag,
    priority,
    dateStart,
    dateEnd,
    timeStart,
    timeEnd,
    finish,
  ];
}
