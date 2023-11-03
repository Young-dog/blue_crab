import 'package:flutter/material.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class DateTimeInformation extends StatelessWidget {
  const DateTimeInformation({
    required this.dateStart,
    required this.dateEnd,
    required this.timeStart,
    required this.timeEnd,
    super.key,
  });

  final DateTime? dateStart;

  final TimeOfDay? timeStart;

  final DateTime? dateEnd;

  final TimeOfDay? timeEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        if (dateStart != null || timeStart != null)
          DateTimePin(date: dateStart, time: timeStart,),
        if (dateEnd != null || timeEnd != null)
          Icon(
            Icons.navigate_next,
            color: theme.palette.iconPrimary,
          ),
        if (dateEnd != null || timeEnd != null)
          DateTimePin(date: dateEnd,time: timeEnd,),
      ],
    );
  }
}
