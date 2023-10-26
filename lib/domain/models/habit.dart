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
    required this.countRepetitions,
    required this.days,
    this.tag,
    this.priority,
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
  final List<int> countRepetitions;

  @HiveField(5)
  final Tag? tag;

  @override
  List<Object?> get props => [
    title,
    description,
    days,
    tag,
    priority,
    countRepetitions,
  ];
}
