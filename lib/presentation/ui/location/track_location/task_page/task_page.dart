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
    super.key,
  });

  final TaskModel? task;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) {
        if (task?.type == TypeTask.task) {
          final taskM = task as Task;
          return TaskBloc(
            type: taskM.type,
            title: taskM.title,
            description: taskM.description,
            priority: taskM.priority,
            tag: taskM.tag,
            dateStart: taskM.dateStart,
            dateEnd: taskM.dateEnd,
            timeStart: taskM.timeStart,
            timeEnd: taskM.timeEnd,
            subtasks: taskM.subtasks,
            finish: taskM.finish,
            tasksRepository: GetIt.instance<TasksRepository>(),
            eventsRepository: GetIt.instance<EventsRepository>(),
          );
        } else if (task?.type == TypeTask.event) {
          final event = task as Event;
          return TaskBloc(
            type: event.type,
            title: event.title,
            description: event.description,
            priority: event.priority,
            tag: event.tag,
            dateStart: event.dateStart,
            timeStart: event.timeStart,
            subtasks: event.subtasks,
            days: event.days,
            finishDates: event.finishDates,
            tasksRepository: GetIt.instance<TasksRepository>(),
            eventsRepository: GetIt.instance<EventsRepository>(),
          );
        } else {
          return TaskBloc(
            tasksRepository: GetIt.instance<TasksRepository>(),
            eventsRepository: GetIt.instance<EventsRepository>(),
          );
        }
      },
      child: TaskView(
        taskModel: task,
      ),
    );
  }
}
