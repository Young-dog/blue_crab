part of 'habit_bloc.dart';

enum HabitStatus {
  initial,
  add,
  added,
  success;
}

class HabitState extends Equatable {
  const HabitState({
    required this.status,
    required this.title,
    required this.description,
    required this.days,
    required this.numberRepetitions,
    required this.completedHabits,
    required this.dateAdd,
    required this.missedHabitsCount,
    required this.completedHabitsCount,
    required this.completedHabit,
    required this.selectedDate,
    required this.color,
    required this.tag,
    required this.priority,
  });

  final HabitStatus status;
  final String title;
  final String description;
  final List<int> days;
  final int numberRepetitions;
  final List<CompletedHabit> completedHabits;
  final DateTime dateAdd;
  final int missedHabitsCount;
  final int completedHabitsCount;
  final CompletedHabit? completedHabit;
  final DateTime? selectedDate;
  final Color color;
  final Tag? tag;
  final Priority? priority;

  HabitState.initial({
    String? title,
    String? description,
    List<int>? days,
    int? numberRepetitions,
    List<CompletedHabit>? completedHabits,
    DateTime? dateAdd,
    Color? color,
    this.tag,
    this.priority,
    this.completedHabit,
    this.selectedDate,
  })  : title = title ?? '',
        description = description ?? '',
        days = days ?? List.generate(7, (index) => index + 1),
        completedHabits = completedHabits ?? <CompletedHabit>[],
        numberRepetitions = numberRepetitions ?? 1,
        dateAdd = dateAdd ??
            DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
        missedHabitsCount = 0,
        completedHabitsCount = 0,
        color = color ?? const Palette.light().iconPrimary,
        status = HabitStatus.initial;

  HabitState copyWith({
    HabitStatus? status,
    String? title,
    String? description,
    List<int>? days,
    int? numberRepetitions,
    List<CompletedHabit>? completedHabits,
    DateTime? dateAdd,
    int? missedHabitsCount,
    int? completedHabitsCount,
    CompletedHabit? completedHabit,
    DateTime? selectedDate,
    Color? color,
    Tag? tag,
    Priority? priority,
  }) {
    return HabitState(
      status: status ?? this.status,
      title: title ?? this.title,
      description: description ?? this.description,
      days: days ?? this.days,
      completedHabits: completedHabits ?? this.completedHabits,
      numberRepetitions: numberRepetitions ?? this.numberRepetitions,
      dateAdd: dateAdd ?? this.dateAdd,
      missedHabitsCount: missedHabitsCount ?? this.missedHabitsCount,
      completedHabitsCount: completedHabitsCount ?? this.completedHabitsCount,
      completedHabit: completedHabit ?? this.completedHabit,
      selectedDate: selectedDate ?? this.selectedDate,
      color: color ?? this.color,
      tag: tag ?? this.tag,
      priority: priority ?? this.priority,
    );
  }

  @override
  List<Object?> get props => [
        status,
        title,
        description,
        days,
        numberRepetitions,
        completedHabits,
        dateAdd,
        missedHabitsCount,
        completedHabitsCount,
        completedHabit,
        selectedDate,
        color,
        tag,
        priority,
      ];
}
