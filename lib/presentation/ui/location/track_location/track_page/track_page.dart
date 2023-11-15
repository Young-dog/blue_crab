import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../../domain/domain.dart';
import '../../../../presentation.dart';
import 'views/views.dart';

@RoutePage()
class TrackPage extends StatelessWidget {
  const TrackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(
            tasksRepository: GetIt.instance<TasksRepository>(),
            eventsRepository: GetIt.instance<EventsRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HabitsBloc(),
        ),
        BlocProvider(
          create: (context) => PurposesBloc(),
        ),
      ],
      child: const TrackView(),
    );
  }
}
