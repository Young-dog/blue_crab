import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';

class CalendarButton extends StatelessWidget {
  const CalendarButton({
    required this.type,
    required this.date,
    required this.time,
    required this.onChangedTime,
    required this.onChangedDate,
    super.key,
  });

  final DateTime? date;

  final TimeOfDay? time;

  final void Function(DateTime? date) onChangedDate;

  final void Function(TimeOfDay? time) onChangedTime;

  final TypeTask type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () async {
        type == TypeTask.task
            ? await _openDateTimeModal(context)
            : _openTimeModal(context);
      },
      icon: FaIcon(
        FontAwesomeIcons.calendar,
        color: theme.palette.buttonPrimary,
      ),
    );
  }

  Future<void> _openDateTimeModal(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<TasksBloc>(ctx),
          child: SafeArea(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: theme.spacings.x20 * 5,
              ),
              child: DateTimeModal(
                date: date,
                onChangedDate: onChangedDate,
                time: time,
                onChangedTime: onChangedTime,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _openTimeModal(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,

      context: ctx,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: BlocProvider.of<TasksBloc>(ctx),
          child: TimeModel(
            onChangedTime: onChangedTime,
            duration: time == null
                ? null
                : Duration(
                    hours: time!.hour,
                    minutes: time!.minute,
                  ),
          ),
        );
      },
    );
  }
}
