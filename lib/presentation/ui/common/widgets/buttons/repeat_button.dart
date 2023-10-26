import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({
    required this.days,
    super.key,
  });

  final List<int> days;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {},
      icon: Icon(
        FontAwesomeIcons.repeat,
        color: theme.palette.iconPrimary,
      ),
    );
  }
}
