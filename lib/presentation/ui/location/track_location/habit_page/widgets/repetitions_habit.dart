import 'package:flutter/material.dart';
import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class RepetitionsHabit extends StatelessWidget {
  const RepetitionsHabit({
    required this.completedHabit,
    required this.countRepetitions,
    super.key,
  });

  final int countRepetitions;

  final CompletedHabit? completedHabit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.all(theme.radius.x4),
        onTap: () async {
          await _showCountModal(context);
        },
        child: Padding(
          padding: EdgeInsets.all(
            theme.spacings.x2,
          ),
          child: Column(
            children: [
              Text(
                '${completedHabit?.finishCountRepetition ?? 0}/$countRepetitions',
                style: theme.textTheme.titleMedium,
              ),
              Text(
                t.track_location.habit_page.repetitions_habit_title,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showCountModal(BuildContext ctx) async {
    await showModalBottomSheet(
      context: ctx,
      builder: (context) {
        return CountRepitModal(
        );
      },
    );
  }
}
