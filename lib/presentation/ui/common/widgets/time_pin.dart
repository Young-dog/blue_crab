import 'package:flutter/material.dart';

import '../../../../app/app.dart';

class TimePin extends StatelessWidget {
  const TimePin({
    required this.time,
    super.key,
  });

  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: theme.spacings.x2,
      ),
      padding: EdgeInsets.symmetric(
        vertical: theme.spacings.x1,
        horizontal: theme.spacings.x2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          theme.radius.x4,
        ),
        border: Border.all(
          color: theme.palette.buttonPrimary,
        ),
      ),
      child: Text(
        t.common.time_pin.time_tittle(
          hours: time.hour,
          minutes: time.minute / 10 < 1
              ? '0${time.minute}'
              : time.minute,
        ),
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.palette.textPrimary,
        ),
      ),
    );
  }
}
