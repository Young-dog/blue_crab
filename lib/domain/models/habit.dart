import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../app/app.dart';

part 'habit.g.dart';

@HiveType(typeId: HiveTypeId.habit)
class Habit extends Equatable {
  const Habit({
    required this.title,
    required this.description,
    required this.countRepetitions,
    required this.days,
  });

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(3)
  final List<int> days;

  @HiveField(4)
  final int countRepetitions;

  @override
  List<Object?> get props => [
    title,
    description,
    days,
    countRepetitions,
  ];
}
