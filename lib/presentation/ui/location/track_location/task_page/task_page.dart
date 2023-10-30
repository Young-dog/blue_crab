import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../domain/repositories/tasks_repositories.dart';
import '../../../../presentation.dart';
import 'views/views.dart';

@RoutePage()
class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(
        tasksRepository: GetIt.instance<TasksRepository>(),
      ),
      child: const TaskView(),
    );
  }
}
