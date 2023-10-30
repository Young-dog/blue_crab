import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    this.index,
    super.key,
  });

  final int? index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        context.read<TasksBloc>().add(
              AddTaskEvent(
                index: index,
              ),
            );
      },
      icon: Icon(
        Icons.add_circle,
        color: theme.palette.iconPrimary,
      ),
    );
  }
}
