import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../../../../common/widgets/subtasks.dart';
import '../widgets/widgets.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const TaskAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x2,
        ),
        child: BlocBuilder<TasksBloc, TasksState>(
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    Expanded(child: TitleInput(title: state.title,),),
                    if (state.title.isNotEmpty)
                      const AddTaskButton(),
                  ],
                ),
                Subtasks(subtasks: state.subtasks,),
                DescriptionsInput(title: state.description,),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const TaskBottomBar(),
    );
  }
}
