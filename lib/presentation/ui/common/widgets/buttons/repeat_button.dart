import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';
import '../../../../presentation.dart';

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
        return BlocProvider.value(
          value: BlocProvider.of<TaskBloc>(ctx),
          child:
          RepeatDaysModal(
days: days,
          ),
        );
      },
    );
  }
}
