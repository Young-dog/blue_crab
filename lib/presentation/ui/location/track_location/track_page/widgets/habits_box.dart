import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class HabitsBox extends StatelessWidget {
  const HabitsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return TrackBox(
      icon: AssetNames.habitsIcon,
      title: t.track_location.track_page.habits_box_title,
      colorIcon: theme.palette.iconAccentFirst,
      onPressedAdd: () {
        context.router.push(
          HabitRoute(),
        );
      }, child: Container(),
    );
  }
}
