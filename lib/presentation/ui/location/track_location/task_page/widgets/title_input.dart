import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';

class TitleInput extends StatelessWidget {
  const TitleInput({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final t = Translations.of(context);

    return FilledInput(
      initialValue: title,
      onChanged: (value) {
        context.read<TaskBloc>().add(
              ChangeTitleTaskEvent(
                title: value,
              ),
            );
      },
      style: theme.textTheme.titleMedium,
      autoFocus: true,
      hintText: t.track_location.title_label,
    );
  }
}
