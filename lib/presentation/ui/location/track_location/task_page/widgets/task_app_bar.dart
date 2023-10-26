import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class TaskAppBar extends StatelessWidget implements PreferredSizeWidget{
  const TaskAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = AppLocaleUtils.findDeviceLocale();

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return AppBar(
          title: DropdownButton<TypeTask>(
            underline: Container(),
            padding: EdgeInsets.symmetric(
              horizontal: theme.spacings.x3,
            ),
            borderRadius: BorderRadius.all(
              theme.radius.x3,
            ),
            elevation: 0,
            value: state.type,
            items: TypeTask.values
                .map(
                  (e) =>
                  DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.toText(t),
                    ),
                  ),
            )
                .toList(),
            onChanged: (TypeTask? value) {
              context.read<TasksBloc>().add(
                ChangeTypeTaskEvent(
                  type: value!,
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
