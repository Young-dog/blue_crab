import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class Subtasks extends StatefulWidget {
  const Subtasks({
    required this.subtasks,
    super.key,
  });

  final List<Task> subtasks;

  @override
  State<Subtasks> createState() => _SubtasksState();
}

class _SubtasksState extends State<Subtasks> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.subtasks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (
            context,
            index,
          ) {
            final subtask = widget.subtasks[index];
            return SubtaskInput(
              finish: subtask.finish,
              title: subtask.title,
              onChanged: (value) {},
              onSaved: () {},
            );
          },
        ),
        SubtaskInput(
          controller: _controller,
          onSaved: () {},
        ),
      ],
    );
  }
}
