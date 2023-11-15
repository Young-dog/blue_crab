import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../app/app.dart';

class RepeatDaysModal extends StatefulWidget {
  const RepeatDaysModal({
    required this.days,
    required this.onChanged,
    super.key,
  });

  final List<int> days;

  final void Function(List<int> days) onChanged;

  @override
  State<RepeatDaysModal> createState() => _RepeatDaysModalState();
}

class _RepeatDaysModalState extends State<RepeatDaysModal> {

  final _daysChar = DateFormat.EEEE(LocaleSettings.currentLocale.languageCode)
      .dateSymbols
      .SHORTWEEKDAYS.toList();

  @override
  void initState() {
    final sun = _daysChar.removeAt(0);

    _daysChar.add(sun);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        child: Padding(
          padding: EdgeInsets.all(theme.spacings.x4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.onChanged(List.generate(7, (index) => index+1));
                  Navigator.pop(context);
                },
                child: Text(
                  t.common.repeat_days_modal.every_day_title,
                ),
              ),
              SizedBox(width: theme.spacings.x6,),
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _daysChar.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: theme.spacings.x3,
                    crossAxisCount: 2,
                    mainAxisExtent: theme.spacings.x10,
                  ),
                  itemBuilder: (
                      context,
                      index,
                      ) {

                    final day = _daysChar[index];

                    return GestureDetector(
                      onTap: () {
                        if (widget.days.contains(index+1)) {
                          setState(() {
                            widget.days.remove(index+1);
                          });
                        } else {
                          setState(() {
                            widget.days.add(index+1);
                          });
                        }

                        widget.onChanged(widget.days);
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
                            index+1,
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
                        child: Center(
                          child: Text(
                            day,
                            style: theme.textTheme.bodySmall!.copyWith(
                              color: theme.palette.textPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}