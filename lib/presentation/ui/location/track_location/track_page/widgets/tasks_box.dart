import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return TrackBox(
      icon: AssetNames.taskIcon,
      title: t.track_page.tasks_box_title,
      colorIcon: theme.palette.iconPrimary,
      onPressedAdd: () {
        context.router.push(
          const TaskRoute(),
        );
      },
    );
  }
}
