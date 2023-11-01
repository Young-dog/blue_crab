import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../app/app.dart';
import '../../../presentation.dart';

class RepeatDaysModal extends StatefulWidget {
  const RepeatDaysModal({
    required this.days,
    super.key,
  });

  final List<int> days;

  @override
  State<RepeatDaysModal> createState() => _RepeatDaysModalState();
}

class _RepeatDaysModalState extends State<RepeatDaysModal> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final daysChar = DateFormat.EEEE(LocaleSettings.currentLocale.languageCode)
        .dateSymbols
        .SHORTWEEKDAYS;

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(theme.spacings.x4),
          ),
          color: theme.palette.bgPrimary,
        ),
        constraints: BoxConstraints(
          minHeight: theme.spacings.x20,
          maxHeight: theme.spacings.x20 * 5,
        ),
        padding: const EdgeInsets.only(top: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysChar.map(
            (e) {
              final day = daysChar.indexOf(e) == 0 ? 7 : daysChar.indexOf(e);
              return GestureDetector(
                onTap: () {
                  if (widget.days.contains(day)) {
                    setState(() {
                      widget.days.remove(day);
                    });
                  } else {
                    setState(() {
                      widget.days.add(day);
                    });
                  }

                  context.read<TaskBloc>().add(
                        ChangeDaysTaskEvent(
                          days: widget.days,
                        ),
                      );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: theme.spacings.x2,
                  ),
                  padding: EdgeInsets.all(
                    theme.spacings.x2,
                  ),
                  decoration: BoxDecoration(
                    color: widget.days.contains(
                      day,
                    )
                        ? theme.palette.buttonPrimary
                        : theme.palette.buttonContrast,
                    borderRadius: BorderRadius.all(
                      theme.radius.x4,
                    ),
                    border: Border.all(
                      width: 1,
                      color: theme.palette.iconPrimary,
                    ),
                  ),
                  child: Text(
                    e,
                    style: theme.textTheme.bodySmall!.copyWith(
                      color: theme.palette.textPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
