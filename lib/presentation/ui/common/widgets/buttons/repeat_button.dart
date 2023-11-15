import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';
import '../../../../presentation.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({
    super.key,
    required this.days,
    required this.onChanged,
  });

  final List<int> days;
  final void Function(List<int> days) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () async {
        await _openRepeatModal(context);
      },
      icon: Icon(
        FontAwesomeIcons.repeat,
        color: theme.palette.iconPrimary,
      ),
    );
  }

  Future<void> _openRepeatModal(BuildContext ctx) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (BuildContext context) {
        return RepeatDaysModal(
          days: days,
          onChanged: onChanged,
        );
      },
    );
  }
}
