import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../app/app.dart';
import '../domain.dart';

part 'purpose.g.dart';

@HiveType(typeId: HiveTypeId.purpose)
class Purpose extends Equatable {
  const Purpose({
    required this.title,
    required this.description,
    required this.tag,
    required this.priority,
    required this.dateStart,
    required this.dateEnd,
    required this.timeStart,
    required this.timeEnd,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final Priority? priority;

  @HiveField(3)
  final DateTime? dateStart;

  @HiveField(4)
  final DateTime? dateEnd;

  @HiveField(5)
  final TimeOfDay? timeStart;

  @HiveField(6)
  final TimeOfDay? timeEnd;

  @HiveField(7)
  final Tag? tag;

  @override
  List<Object?> get props => [
    title,
    description,
    tag,
    priority,
    dateStart,
    dateEnd,
    timeStart,
    timeEnd,
  ];
}
