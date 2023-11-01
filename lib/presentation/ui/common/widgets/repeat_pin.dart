import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../app/app.dart';

class RepeatPin extends StatelessWidget {
  const RepeatPin({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: theme.spacings.x2,),
      child: FaIcon(
        FontAwesomeIcons.repeat,
        color: theme.palette.iconPrimary,
        size: theme.spacings.x5,
      ),
    );
  }
}
