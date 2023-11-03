import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    this.taskModel,
    super.key,
  });

  final TaskModel? taskModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: TaskAppBar(task: taskModel,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x2,
        ),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                TitleInput(
                  title: state.title,
                ),
                Subtasks(
                  subtasks: state.subtasks,
                ),
                DescriptionsInput(
                  title: state.description,
                ),
                SizedBox(height: theme.spacings.x4,),
                DateTimeInformation(
                  dateStart: state.dateStart,
                  dateEnd: state.dateEnd,
                  timeStart: state.timeStart,
                  timeEnd: state.timeEnd,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const TaskBottomBar(),
    );
  }
}
