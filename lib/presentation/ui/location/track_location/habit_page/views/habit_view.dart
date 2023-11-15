import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class HabitView extends StatelessWidget {
  const HabitView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x2,
        ),
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                HabitTitle(
                  title: state.title,
                  color: state.color,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const HabitBottomBar(),
    );
  }
}

/*
Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x2,
        ),
        child: BlocBuilder<HabitBloc, HabitState>(
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                HabitTitle(
                  title: state.title,
                  color: state.color,
                ),
                RepeatDaysHabit(days: state.days,
                ),
                SizedBox(
                  height: theme.spacings.x2,
                ),
                HabitInformationBox(
                  countCompleted: 0,
                  countMissed: 0,
                  completedHabit: state.completedHabit,
                  countRepetitions: state.numberRepetitions,
                ),
                DescriptionsInput(
                  title: state.description,
                  onChanged: (value) {
                    context.read<HabitBloc>().add(
                          ChangeDescriptionHabitEvent(
                            description: value,
                          ),
                        );
                  },
                ),
              ],
            );
          },
        ),
      ),
 */
