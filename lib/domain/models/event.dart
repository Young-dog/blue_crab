import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../app/app.dart';
import '../domain.dart';

part 'event.g.dart';

@HiveType(typeId: HiveTypeId.event)
class Event extends Equatable {
  const Event({
    required this.title,
    required this.description,
    required this.days,
    this.tag,
    this.priority,
    this.timeStart,
    this.timeEnd,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final PriorityTask? priority;

  @HiveField(3)
  final List<int> days;

  @HiveField(4)
  final TimeOfDay? timeStart;

  @HiveField(5)
  final TimeOfDay? timeEnd;

  @HiveField(6)
  final Tag? tag;

  @override
  List<Object?> get props => [
    title,
    description,
    days,
    tag,
    priority,
    timeStart,
    timeEnd,
  ];
}
