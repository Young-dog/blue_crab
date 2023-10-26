import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class TitleInput extends StatelessWidget {
  const TitleInput({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return FilledInput(
      onChanged: (value) {
        context.read<TasksBloc>().add(
              ChangeTitleTaskEvent(
                title: value,
              ),
            );
      },
      style: theme.textTheme.titleMedium,
      autoFocus: true,
      hintText: t.task_page.title_label,
    );
  }
}
