import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../app/app.dart';
import '../domain.dart';


@HiveType(typeId: HiveTypeId.taskModel,)
abstract class TaskModel extends Equatable {
  const TaskModel({
    required this.type,
    required this.title,
    required this.description,
    required this.priority,
    required this.subtasks,
    required this.tag,
    required this.dateStart,
    required this.timeStart,
  });

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final Priority? priority;
  @HiveField(3)
  final List<Subtask> subtasks;
  @HiveField(4)
  final Tag? tag;
  @HiveField(5)
  final TypeTask type;

  @HiveField(6)
  final DateTime? dateStart;

  @HiveField(7)
  final TimeOfDay? timeStart;
}
