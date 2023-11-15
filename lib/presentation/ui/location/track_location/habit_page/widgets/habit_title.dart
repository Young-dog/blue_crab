import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class HabitTitle extends StatelessWidget {
  const HabitTitle({
    required this.title,
    required this.color,
    super.key,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<HabitBloc, HabitState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _showColor(
                      context: context,
                      color: color,
                      onChanged: (Color color) {
                        context.read<HabitBloc>().add(
                              ChangeColorHabitEvent(
                                color: color,
                              ),
                            );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                      theme.spacings.x5,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AssetNames.habitsIcon,
                      height: theme.spacings.x12,
                      width: theme.spacings.x12,
                      color: theme.palette.iconContrast,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: theme.spacings.x4,
            ),
            FilledInput(
              onChanged: (value) {
                context.read<HabitBloc>().add(
                      ChangeTitleHabitEvent(
                        title: value,
                      ),
                    );
              },
              maxLength: 30,
              initialValue: title,
              hintText: t.track_location.title_label,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }

  void _showColor({
    required BuildContext context,
    required Color color,
    required void Function(Color color) onChanged,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: color,
              onColorChanged: (Color value) {
                onChanged(value);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}
