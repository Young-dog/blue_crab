import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class TrackAppBar extends StatelessWidget {
  const TrackAppBar({
    required this.selectDate,
    required this.focusDay,
    super.key,
  });

  final DateTime selectDate;
  final DateTime focusDay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final locale = AppLocaleUtils.findDeviceLocale();

    final monthFormat =
        DateFormat.MMMM(locale.languageCode);

    final firstDay = DateTime(
      DateTime.now().year - 1,
      12,
      31,
    );

    final lastDay = DateTime(
      DateTime.now().year + 2,
      12,
      31,
    );

    return SliverAppBar(
      title: Text(
        monthFormat.format(
          focusDay,
        ),
        style: theme.textTheme.titleMedium,
      ),
      pinned: true,
      snap: true,
      floating: true,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(
          theme.spacings.x19,
        ),
        child: TableCalendar(
          focusedDay: focusDay,
          firstDay: firstDay,
          lastDay: lastDay,
          calendarFormat: CalendarFormat.week,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: false,
          calendarStyle: CalendarStyle(
            cellMargin: EdgeInsets.zero,
            todayTextStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.palette.iconPrimary,
            ),
            todayDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            defaultTextStyle: theme.textTheme.bodyMedium!,
            defaultDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            weekendTextStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.palette.iconSecondary,
            ),
            weekNumberTextStyle: theme.textTheme.bodyMedium!,
          ),
          daysOfWeekHeight: theme.spacings.x6,
          selectedDayPredicate: (day) {
            return isSameDay(selectDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            context.read<TrackBloc>().add(
                  ChangeSelectedDayEvent(
                    selectedDay: selectedDay,
                  ),
                );
            context.read<TasksBloc>().add(
              ChangeDateEvent(
                date: selectedDay,
              ),
            );

            context.read<TrackBloc>().add(
                  ChangeFocusedDayEvent(
                    focusedDay: focusedDay,
                  ),
                );
          },
          onPageChanged: (focusedDay) {
            context.read<TrackBloc>().add(
                  ChangeFocusedDayEvent(
                    focusedDay: focusedDay,
                  ),
                );
          },
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: theme.spacings.x2,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: theme.spacings.x2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: theme.radius.x4,
                    topRight: theme.radius.x4,
                  ),
                  color: selectDate.year == day.year &&
                          selectDate.month == day.month &&
                          selectDate.day == day.day
                      ? theme.palette.iconPrimary
                      : null,
                ),
                child: Text(
                  DateFormat(
                    'EEE',
                    locale.languageCode,
                  ).format(day),
                  style: selectDate.year == day.year &&
                          selectDate.month == day.month &&
                          selectDate.day == day.day
                      ? theme.textTheme.bodyMedium!.copyWith(
                          color: theme.palette.textContrast,
                        )
                      : theme.textTheme.bodyMedium!,
                  textAlign: TextAlign.center,
                ),
              );
            },
            selectedBuilder: (context, date1, date2) {
              return Container(
                width: double.infinity,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.symmetric(
                  horizontal: theme.spacings.x2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: theme.radius.x4,
                    bottomRight: theme.radius.x4,
                  ),
                  color: theme.palette.iconPrimary,
                ),
                child: Center(
                  child: Text(
                    '${date1.day}',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.palette.textContrast,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
