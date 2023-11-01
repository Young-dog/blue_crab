import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../app/app.dart';
import '../../../presentation.dart';

class DateTimeModal extends StatefulWidget {
  const DateTimeModal({
    super.key,
    required this.date,
    required this.time,
    required this.onChangedDate,
    required this.onChangedTime,
  });

  final DateTime? date;
  final TimeOfDay? time;
  final void Function(DateTime? date) onChangedDate;
  final void Function(TimeOfDay? time) onChangedTime;

  @override
  State<DateTimeModal> createState() => _BottomDateTimePickerState();
}

class _BottomDateTimePickerState extends State<DateTimeModal> {
  late DateTime _selectedDate;
  Duration? _duration;
  late DateTime _focusedDay;

  final _firstDay = DateTime(
    DateTime.now().year - 1,
    12,
    31,
  );

  final _lastDay = DateTime(
    DateTime.now().year + 2,
    12,
    31,
  );

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.date ?? DateTime.now();
    _duration = _addDuration(widget.time);
    _focusedDay = widget.date ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (widget.date != null)
                IconButton(
                  onPressed: () {
                    widget.onChangedDate(null);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: theme.palette.iconSecondary,
                  ),
                ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: theme.spacings.x4,
                ),
                padding: EdgeInsets.all(theme.spacings.x4),
                decoration: BoxDecoration(
                  color: theme.palette.bgContrast,
                  borderRadius: BorderRadius.all(theme.radius.x4),
                ),
                child: TableCalendar(
                  locale: AppLocaleUtils.findDeviceLocale().languageCode,
                  rowHeight: theme.spacings.x9,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    weekendStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    headerPadding: EdgeInsets.zero,
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: theme.textTheme.bodySmall!,
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: theme.palette.iconSecondary,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: theme.palette.iconSecondary,
                    ),
                  ),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                    setState(() {});
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: _firstDay,
                  lastDay: _lastDay,
                  focusedDay: _focusedDay,
                  daysOfWeekHeight: theme.spacings.x6,
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    cellMargin: EdgeInsets.zero,
                    rangeEndTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    rangeStartTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    withinRangeTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                    ),
                    outsideTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    disabledTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    holidayTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.iconPrimary,
                    ),
                    selectedTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textContrast,
                    ),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.palette.iconPrimary,
                    ),
                    defaultTextStyle: theme.textTheme.bodySmall!,
                    weekendTextStyle: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textTertiary,
                    ),
                    weekNumberTextStyle: theme.textTheme.bodySmall!,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.palette.bgContrast,
                        ),
                      ),
                      onPressed: () {
                        _showDialog(context);
                      },
                      child: Text(
                        t.calendar_button.time,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.palette.textPrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: theme.spacings.x6,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          theme.palette.buttonPrimary,
                        ),
                      ),
                      onPressed: () {
                        widget.onChangedDate(_selectedDate);
                        Navigator.pop(context);
                      },
                      child: Text(
                        t.calendar_button.add,
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: theme.palette.textContrast,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext ctx) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return TimeModal(
          onChangedTime: widget.onChangedTime,
          duration: _duration,
        );
      },
    );
  }

  Duration? _addDuration(TimeOfDay? time) {
    final dur = Duration(
      hours: time?.hour ?? 0,
      minutes: time?.minute ?? 0,
    );

    return dur.inHours > 0 && dur.inMinutes > 0 ? dur : null;
  }
}
