import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';

class MissedHabit extends StatelessWidget {
  const MissedHabit({
    required this.countMis,
    super.key,
  });

  final int countMis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          countMis.toString(),
          style: theme.textTheme.titleMedium,
        ),
        Text(t.track_location.habit_page.missed_habit_title),
      ],
    );
  }
}
