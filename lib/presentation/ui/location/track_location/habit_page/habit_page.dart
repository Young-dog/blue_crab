import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';
import 'views/views.dart';

@RoutePage()
class HabitPage extends StatelessWidget {
  const HabitPage({
    this.habit,
    this.selectedDate,
    super.key,
  });

  final Habit? habit;

  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HabitBloc(
        // title: habit?.title,
        // description: habit?.description,
        // days: habit?.days,
        // completedHabits: habit?.completedHabits,
        // numberRepetitions: habit?.numberRepetitions,
        // dateAdd: habit?.dateAdd,
        habitsRepository: GetIt.instance(),
        // selectedDate: selectedDate,
        // color: habit?.color,
      ),
      child: const HabitView(),
    );
  }
}
