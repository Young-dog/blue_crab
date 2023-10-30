import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class Subtasks extends StatelessWidget {
  const Subtasks({
    required this.subtasks,
    super.key,
  });

  final List<Subtask> subtasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: subtasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (
            context,
            index,
          ) {
            final subtask = subtasks[index];
            return Dismissible(
              onDismissed: (onDismissed) {
                context.read<TasksBloc>().add(
                      ChangeSubtasksTaskEvent(
                        subtask: null,
                        index: index,
                      ),
                    );
              },
              key: Key(subtask.title),
              child: SubtaskInput(
                finish: subtask.finish,
                title: subtask.title,
                onSaved: ({
                  required checkBoxState,
                  required text,
                  required controller,
                }) {
                  context.read<TasksBloc>().add(
                        ChangeSubtasksTaskEvent(
                          subtask: Subtask(
                            finish: checkBoxState,
                            title: text,
                          ),
                          index: index,
                        ),
                      );
                },
              ),
            );
          },
        ),
        SubtaskInput(
          onSaved: ({
            required checkBoxState,
            required text,
            required controller,
          }) {
            context.read<TasksBloc>().add(
                  ChangeSubtasksTaskEvent(
                    subtask: Subtask(
                      finish: checkBoxState,
                      title: text,
                    ),
                  ),
                );
            controller.clear();
          },
        ),
      ],
    );
  }
}
