import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../app/app.dart';
import '../domain.dart';

part 'habit.g.dart';

@HiveType(typeId: HiveTypeId.habit)
class Habit extends Equatable {
  const Habit({
    required this.title,
    required this.description,
    required this.days,
    required this.numberRepetitions,
    required this.completedHabits,
    required this.dateAdd,
    required this.color,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final List<int> days;

  @HiveField(3)
  final int numberRepetitions;

  @HiveField(4)
  final List<CompletedHabit> completedHabits;

  @HiveField(5)
  final DateTime dateAdd;

  @HiveField(6)
  final Color color;

  @override
  List<Object?> get props => [
        title,
        description,
        days,
        numberRepetitions,
        completedHabits,
        dateAdd,
        color,
      ];
}
