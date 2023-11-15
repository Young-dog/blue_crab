import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';
import 'widgets.dart';

class TaskBox extends StatelessWidget {
  const TaskBox({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final tasks = state.tasksList;

        return TrackBox(
          finishElements: state.finishCount,
          countElements: tasks.length,
          icon: AssetNames.taskIcon,
          title: t.track_location.track_page.tasks_box_title,
          colorIcon: theme.palette.iconPrimary,
          onPressedAdd: () {
            context.router.push(
              TaskRoute(),
            );
          },
          child: tasks.isNotEmpty
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final task = tasks.elementAt(index);
                    var finish = false;
                    if (task.type == TypeTask.task) {
                      task as Task;
                      finish = task.finish;
                    } else {
                      task as Event;
                      finish = task.finishDates.contains(
                        state.selectedDate,
                      );
                    }
                    return TaskButton(
                      task: task,
                      index: index,
                      finish: finish,
                    );
                  },
                )
              : Container(),
        );
      },
    );
  }
}
