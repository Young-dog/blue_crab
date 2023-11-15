import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../domain/domain.dart';

part 'habit_event.dart';

part 'habit_state.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc({
    required HabitsRepository habitsRepository,
    String? title,
    String? description,
    List<int>? days,
    int? numberRepetitions,
    List<CompletedHabit>? completedHabits,
    DateTime? dateAdd,
    DateTime? selectedDate,
    Color? color,
    Tag? tag,
    Priority? priority,
  })  : _habitsRepository = habitsRepository,
        super(
          HabitState.initial(
            title: title,
            description: description,
            days: days,
            completedHabits: completedHabits,
            numberRepetitions: numberRepetitions,
            dateAdd: dateAdd,
            selectedDate: selectedDate,
            color: color,
            tag: tag,
            priority: priority,
          ),
        ) {
    on<ChangeTitleHabitEvent>(_onChangeTitle);
    on<ChangeDescriptionHabitEvent>(_onChangeDescription);
    on<ChangeDaysHabitEvent>(_onChangeDays);
    on<ChangeCountRepHabitEvent>(_onChangeCount);
    on<AddHabitEvent>(_onAddHabit);
    on<InitHabitEvent>(_onInit);
    on<ChangeColorHabitEvent>(_onChangeColor);
    on<ChangeTagHabitEvent>(_onChangeTag);
    on<ChangePriorityHabitEvent>(_onChangePriority);
    add(const InitHabitEvent());
  }

  final HabitsRepository _habitsRepository;

  void _onInit(
    InitHabitEvent event,
    Emitter<HabitState> emit,
  ) {
    if (state.selectedDate != null) {
      final data = state.completedHabits
          .where(
            (element) =>
                element.date.year == state.selectedDate!.year &&
                element.date.month == state.selectedDate!.month &&
                element.date.day == state.selectedDate!.day,
          )
          .toList();
      final completedHabit = data.isNotEmpty
          ? data.first
          : CompletedHabit(
              date: state.selectedDate!,
            );

      final completedHabitsCount = state.completedHabits.length;

      var countHabits = 0;

      var date = state.dateAdd;

      final dateEnd = DateTime(
        state.selectedDate!.year,
        state.selectedDate!.month,
        state.selectedDate!.day,
      );

      while (date.isBefore(dateEnd)) {
        state.days.forEach((element) {
          if (date.weekday == element) {
            countHabits++;
          }
        });
        date = date.add(
          const Duration(
            days: 1,
          ),
        );
      }

      final missedHabitsCount = countHabits - completedHabitsCount;

      emit(
        state.copyWith(
          completedHabit: completedHabit,
          missedHabitsCount: missedHabitsCount,
          completedHabitsCount: completedHabitsCount,
        ),
      );
    } else {
      return;
    }
  }

  void _onChangeTitle(
    ChangeTitleHabitEvent event,
    Emitter<HabitState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onChangeColor(
      ChangeColorHabitEvent event,
      Emitter<HabitState> emit,
      ) {
    emit(
      state.copyWith(
        color: event.color,
      ),
    );
  }

  void _onChangeTag(
      ChangeTagHabitEvent event,
      Emitter<HabitState> emit,
      ) {
    emit(
      state.copyWith(
        tag: event.tag,
      ),
    );
  }

  void _onChangePriority(
      ChangePriorityHabitEvent event,
      Emitter<HabitState> emit,
      ) {
    emit(
      state.copyWith(
        priority: event.priority,
      ),
    );
  }

  void _onChangeDescription(
    ChangeDescriptionHabitEvent event,
    Emitter<HabitState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _onChangeDays(
    ChangeDaysHabitEvent event,
    Emitter<HabitState> emit,
  ) {
    emit(
      state.copyWith(
        status: HabitStatus.add,
        days: event.days,
      ),
    );
    emit(
      state.copyWith(
        status: HabitStatus.added,
        days: event.days,
      ),
    );
  }

  void _onChangeCount(
    ChangeCountRepHabitEvent event,
    Emitter<HabitState> emit,
  ) {
    emit(
      state.copyWith(
        numberRepetitions: event.count,
      ),
    );
  }

  Future<void> _onAddHabit(
    AddHabitEvent event,
    Emitter<HabitState> emit,
  ) async {
    await _habitsRepository.addHabits(
      title: state.title,
      description: state.description,
      days: state.days,
      previousHabit: event.previousHabit,
      numberRepetitions: state.numberRepetitions,
      completedHabits: state.completedHabits,
      dateAdd: state.dateAdd,
      color: state.color,
    );
  }
}
