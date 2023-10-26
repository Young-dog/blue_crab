import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../presentation.dart';

class DescriptionsInput extends StatelessWidget {
  const DescriptionsInput({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledInput(
      onChanged: (value) {
        context.read<TasksBloc>().add(
              ChangeDescriptionTaskEvent(
                description: value,
              ),
            );
      },
      labelText: 'Описание',
    );
  }
}
