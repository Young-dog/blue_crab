part of 'habit_bloc.dart';

abstract class HabitEvent extends Equatable {
  const HabitEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTitleHabitEvent extends HabitEvent {
  const ChangeTitleHabitEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [
        title,
      ];
}

class InitHabitEvent extends HabitEvent {
  const InitHabitEvent();
}

class ChangeDescriptionHabitEvent extends HabitEvent {
  const ChangeDescriptionHabitEvent({
    required this.description,
  });

  final String description;

  @override
  List<Object?> get props => [
        description,
      ];
}

class ChangeDaysHabitEvent extends HabitEvent {
  const ChangeDaysHabitEvent({
    required this.days,
  });

  final List<int> days;

  @override
  List<Object?> get props => [
        days,
      ];
}

class ChangeCountRepHabitEvent extends HabitEvent {
  const ChangeCountRepHabitEvent({
    required this.count,
  });

  final int count;

  @override
  List<Object?> get props => [
        count,
      ];
}

class ChangeColorHabitEvent extends HabitEvent {
  const ChangeColorHabitEvent({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [
    color,
  ];
}

class ChangeTagHabitEvent extends HabitEvent {
  const ChangeTagHabitEvent({
    required this.tag,
  });

  final Tag tag;

  @override
  List<Object?> get props => [
    tag,
  ];
}

class ChangePriorityHabitEvent extends HabitEvent {
  const ChangePriorityHabitEvent({
    required this.priority,
  });

  final Priority priority;

  @override
  List<Object?> get props => [
    priority,
  ];
}

class AddHabitEvent extends HabitEvent {
  const AddHabitEvent({this.previousHabit,});

  final Habit? previousHabit;

  @override
  List<Object?> get props => [
    previousHabit,
  ];
}
