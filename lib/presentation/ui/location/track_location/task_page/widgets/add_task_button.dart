import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    this.taskModel,
    super.key,
  });

  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        context.read<TaskBloc>().add(
              AddTaskEvent(
                previousModel: taskModel,
              ),
            );
        context.popRoute();
      },
      icon: Icon(
        Icons.add_circle,
        color: theme.palette.iconPrimary,
      ),
    );
  }
}
