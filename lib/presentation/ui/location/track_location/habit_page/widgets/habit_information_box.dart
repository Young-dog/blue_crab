import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import 'widgets.dart';

class HabitInformationBox extends StatelessWidget {
  const HabitInformationBox({
    required this.countCompleted,
    required this.countMissed,
    required this.completedHabit,
    required this.countRepetitions,
    super.key,
  });

  final int countCompleted;

  final int countMissed;

  final int countRepetitions;

  final CompletedHabit? completedHabit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: theme.spacings.x20,
      ),
      padding: EdgeInsets.all(
        theme.spacings.x3,
      ),
      decoration: BoxDecoration(
        color: theme.palette.bgContrast,
        borderRadius: BorderRadius.all(
          theme.radius.x4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RepetitionsHabit(
            completedHabit: completedHabit,
            countRepetitions: countRepetitions,
          ),
          MissedHabit(
            countMis: countMissed,
          ),
          CompletedInfoHabit(
            countCom: countCompleted,
          ),
        ],
      ),
    );
  }
}
