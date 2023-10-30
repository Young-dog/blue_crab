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
      title: t.track_page.habits_box_title,
      colorIcon: theme.palette.iconAccentFirst,
      onPressedAdd: () {}, child: Container(),
    );
  }
}
