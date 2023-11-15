import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/app.dart';

class DateTimePin extends StatelessWidget {
  const DateTimePin({
    required this.date,
    required this.time,
    super.key,
  });

  final DateTime? date;
  final TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
        t.common.date_time_pin.date(
              day: date?.day ?? '',
              month: date != null
                  ? DateFormat.MMM(LocaleSettings.currentLocale.languageCode)
                      .format(date!)
                  : '',
            ) + (time != null ?
            t.common.date_time_pin.time(
              hours: time!.hour,
              minutes: time!.minute / 10 < 1 ? '0${time!.minute}' : time!.minute,
            ) : ''),
        style: theme.textTheme.labelSmall!.copyWith(
          color: theme.palette.textPrimary,
        ),
      ),
    );
  }
}
