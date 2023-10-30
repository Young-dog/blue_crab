import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';
import 'views/views.dart';

@RoutePage()
class TaskPage extends StatelessWidget {
  const TaskPage({
    this.task,
    this.event,
    this.index,
    super.key,
  });

  final Task? task;

  final int? index;

  final Event? event;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (event != null ) {
          return TaskBloc(
            type: TypeTask.event,
            title: event?.title,
            description: event?.description,
            priority: event?.priority,
            tag: event?.tag,
            days: event?.days,
            timeStart: event?.timeStart,
            timeEnd: event?.timeEnd,
            subtasks: event?.subtasks,
            tasksRepository: GetIt.instance<TasksRepository>(),
          );
        }
        return TaskBloc(
          title: task?.title,
          description: task?.description,
          priority: task?.priority,
          tag: task?.tag,
          dateStart: task?.dateStart,
          dateEnd: task?.dateEnd,
          timeStart: task?.timeStart,
          timeEnd: task?.timeEnd,
          subtasks: task?.subtasks,
          finish: task?.finish,
          tasksRepository: GetIt.instance<TasksRepository>(),
        );
      },
      child: TaskView(index: index,),
    );
  }
}
