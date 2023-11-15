import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';

class CompletedInfoHabit extends StatelessWidget {
  const CompletedInfoHabit({
    required this.countCom,
    super.key,
  });

  final int countCom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          countCom.toString(),
          style: theme.textTheme.titleMedium,
        ),
        Text(t.track_location.habit_page.completed_habit_title),
      ],
    );
  }
}
