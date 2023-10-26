import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';

class NotifyButton extends StatelessWidget {
  const NotifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
      },
      icon: FaIcon(
        FontAwesomeIcons.bell,
        color: theme.palette.buttonPrimary,
      ),
    );
  }
}
