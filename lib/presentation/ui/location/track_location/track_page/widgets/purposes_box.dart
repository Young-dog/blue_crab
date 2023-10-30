import 'package:flutter/material.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class PurposesBox extends StatelessWidget {
  const PurposesBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return TrackBox(
      icon: AssetNames.cupIcon,
      title: t.track_page.purposes_box_title,
      colorIcon: theme.palette.iconAccentThird,
      onPressedAdd: () {}, child: Container(),
    );
  }
}
