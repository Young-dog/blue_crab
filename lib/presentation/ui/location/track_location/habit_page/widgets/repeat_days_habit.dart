import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class RepeatDaysHabit extends StatelessWidget {
  const RepeatDaysHabit({
    required this.days,
    super.key,
  });

  final List<int> days;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final daysChar = DateFormat.EEEE(LocaleSettings.currentLocale.languageCode)
        .dateSymbols
        .SHORTWEEKDAYS;

    print(days);

    return TextButton(
      onPressed: () async {
        await _openRepeatModal(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.repeat_rounded,
            color: theme.palette.iconSecondary,
          ),
          SizedBox(
            width: theme.spacings.x4,
          ),
          if (days.length < 7)
            Row(
              children: days
                  .map((e) => e == 7 ? Text('${daysChar[0]}, ') : Text('${daysChar[e]}, '))
                  .toList(),
            )
          else
            Text(
            'Каждый день',
            style: theme.textTheme.titleMedium!
                .copyWith(color: theme.palette.textSecondary),
          ),
        ],
      ),
    );
  }

  Future<void> _openRepeatModal(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<HabitBloc>(ctx),
          child: RepeatDaysModal(
            days: days,
            onChanged: (List<int> days) {
              ctx.read<HabitBloc>().add(
                    ChangeDaysHabitEvent(
                      days: days,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
