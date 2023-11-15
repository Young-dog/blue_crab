import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app.dart';

class TimeModal extends StatefulWidget {
  const TimeModal({
    required this.onChangedTime,
    required this.duration,
    super.key,
  });

  final void Function(TimeOfDay? time) onChangedTime;
  final Duration? duration;

  @override
  State<TimeModal> createState() => _TimeModalState();
}

class _TimeModalState extends State<TimeModal> {

  Duration _time = Duration(
    hours: DateTime.now().hour,
    minutes: DateTime.now().minute,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(theme.spacings.x4),
    ),
        color: theme.palette.bgContrast,
      ),
      constraints: BoxConstraints(
        maxHeight: theme.spacings.x20 * 5,
      ),
      padding: const EdgeInsets.only(top: 6.0),
      child: CupertinoTheme(
        data: CupertinoThemeData(
          scaffoldBackgroundColor: theme.palette.bgContrast,
          textTheme: CupertinoTextThemeData(
            tabLabelTextStyle: theme.textTheme.bodyMedium!.copyWith(
              color: theme.palette.textPrimary,
            ),
            pickerTextStyle: theme.textTheme.titleMedium!.copyWith(
              color: theme.palette.textPrimary,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x6,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoTimerPicker(
                mode: CupertinoTimerPickerMode.hm,
                initialTimerDuration: widget.duration ?? _time,
                onTimerDurationChanged: (Duration newDuration) {
                  setState(() {
                    _time = newDuration;
                  });
                },
              ),
              Row(
                children: [
                  if (widget.duration != null)
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black.withOpacity(0.3),
                          ),
                        ),
                        onPressed: () {
                          widget.onChangedTime(null);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          t.common.date_time_model.calendar_button.delete,
                          style: theme.textTheme.titleMedium!.copyWith(
                            color: theme.palette.textContrast,
                          ),
                        ),
                      ),
                    ),
                  if (widget.duration != null)
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
                        final value = TimeOfDay(
                          hour: _time.inHours,
                          minute: _time.inMinutes.remainder(60),
                        );
                        widget.onChangedTime(
                          value,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        t.common.date_time_model.calendar_button.add,
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
}
