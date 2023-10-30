import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../presentation.dart';

class DescriptionsInput extends StatelessWidget {
  const DescriptionsInput({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledInput(
      initialValue: title,
      onChanged: (value) {
        context.read<TaskBloc>().add(
              ChangeDescriptionTaskEvent(
                description: value,
              ),
            );
      },
      labelText: 'Описание',
    );
  }
}
