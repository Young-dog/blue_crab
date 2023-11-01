import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../domain.dart';

part 'event.g.dart';

@HiveType(
  typeId: HiveTypeId.event,
)
class Event extends TaskModel {
  const Event({
    required super.type,
    required super.title,
    required super.description,
    required super.priority,
    required super.subtasks,
    required super.tag,
    required super.dateStart,
    required super.timeStart,
    required this.days,
    required this.finishDates,
  });

  @HiveField(8)
  final List<int> days;

  @HiveField(9)
  final List<DateTime> finishDates;

  Event copyWith({
    List<Subtask>? subtasks,
    List<DateTime>? finishDates,
  }) {
    return Event(
      type: type,
      title: title,
      description: description,
      priority: priority,
      subtasks: subtasks ?? this.subtasks,
      tag: tag,
      dateStart: dateStart,
      timeStart: timeStart,
      days: days,
      finishDates: finishDates ?? this.finishDates,
    );
  }

  @override
  List<Object?> get props => [
        type,
        title,
        description,
        priority,
        subtasks,
        tag,
        dateStart,
        timeStart,
        days,
        finishDates,
      ];
}
