import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({
    required TasksRepository tasksRepository,
  })  : _tasksRepository = tasksRepository,
        super(const TasksState.initial()) {
    on<DelTasksEvent>(_onDelTasks);
    on<FinishTaskEvent>(_onFinishTasks);
  }

  final TasksRepository _tasksRepository;

  Future<void> _onDelTasks(
    DelTasksEvent event,
    Emitter<TasksState> emit,
  ) async {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
      ),
    );

    try {
      await _tasksRepository.delTasks(
        index: event.index,
      );

      emit(
        state.copyWith(
          tasksStatus: TasksStatus.success,
        ),
      );
    } catch (error) {
      debugPrint(
        error.toString(),
      );
    }
  }

  Future<void> _onFinishTasks(
    FinishTaskEvent event,
    Emitter<TasksState> emit,
  ) async {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
      ),
    );

    try {
      await _tasksRepository.finishTasks(
        index: event.index,
        finish: event.finish,
      );

      emit(
        state.copyWith(
          tasksStatus: TasksStatus.success,
        ),
      );
    } catch (error) {
      debugPrint(
        error.toString(),
      );
    }
  }

}
