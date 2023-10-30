import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({required TasksRepository tasksRepository})
      : _tasksRepository = tasksRepository,
        super(TasksState.initial()) {
    on<ChangeTypeTaskEvent>(_onChangeTypeTask);
    on<ChangeTitleTaskEvent>(_onChangeTitleTask);
    on<ChangeDescriptionTaskEvent>(_onChangeDescriptionTask);
    on<ChangePriorityTaskEvent>(_onChangePriorityTask);
    on<ChangeTagTaskEvent>(_onChangeTagTask);
    on<ChangeDateStartTaskEvent>(_onChangeDateFirstTask);
    on<ChangeTimeStartTaskEvent>(_onChangeTimeFirstTask);
    on<ChangeDateEndTaskEvent>(_onChangeDateEndTask);
    on<ChangeTimeEndTaskEvent>(_onChangeTimeEndTask);
    on<ChangeSubtasksTaskEvent>(_onChangeSubtasksTasks);
    on<AddTaskEvent>(_onAddTask);
  }

  final TasksRepository _tasksRepository;

  void _onChangeTypeTask(
    ChangeTypeTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    emit(
      state.copyWith(
        type: event.type,
      ),
    );
  }

  void _onChangeTitleTask(
    ChangeTitleTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onChangeDescriptionTask(
    ChangeDescriptionTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _onChangePriorityTask(
    ChangePriorityTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    emit(
      state.copyWith(
        priority: event.priority,
      ),
    );
  }

  void _onChangeTagTask(
    ChangeTagTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    if (event.tag == null) {
      emit(
        state.copyWith(
          status: TasksStatus.delTag,
        ),
      );
    } else {
      emit(
        state.copyWith(
          tag: event.tag,
        ),
      );
    }
  }

  void _onChangeDateFirstTask(
    ChangeDateStartTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TasksStatus.delDateFirst,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateStart: event.date,
        ),
      );
    }
  }

  void _onChangeTimeFirstTask(
    ChangeTimeStartTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    if (event.time == null) {
      emit(
        state.copyWith(
          status: TasksStatus.delTimeFirst,
        ),
      );
    } else {
      emit(
        state.copyWith(
          timeStart: event.time,
        ),
      );
    }
  }

  void _onChangeDateEndTask(
    ChangeDateEndTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TasksStatus.delDateEnd,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateEnd: event.date,
        ),
      );
    }
  }

  void _onChangeTimeEndTask(
    ChangeTimeEndTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    if (event.time == null) {
      emit(
        state.copyWith(
          status: TasksStatus.delTimeEnd,
        ),
      );
    } else {
      emit(
        state.copyWith(
          timeEnd: event.time,
        ),
      );
    }
  }

  void _onChangeSubtasksTasks(
    ChangeSubtasksTaskEvent event,
    Emitter<TasksState> emit,
  ) {
    final subtasks = state.subtasks;

    if (event.subtask == null) {
      if (event.index != null) {
        subtasks.removeAt(event.index!);
        emit(
          state.copyWith(
            status: TasksStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      }
    } else {
      if (event.index == null) {
        subtasks.add(event.subtask!);
        emit(
          state.copyWith(
            status: TasksStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      } else {
        subtasks[event.index!] = event.subtask!;
        emit(
          state.copyWith(
            status: TasksStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      }
    }

    emit(
      state.copyWith(
        status: TasksStatus.success,
      ),
    );
  }

  Future<void> _onAddTask(
    AddTaskEvent event,
    Emitter<TasksState> emit,
  ) async {
    if (state.type == TypeTask.task) {
      await _tasksRepository.addTask(
        title: state.title,
        description: state.description,
        priority: state.priority,
        dateStart: state.dateStart,
        dateEnd: state.dateEnd,
        timeStart: state.timeStart,
        timeEnd: state.timeEnd,
        subtasks: state.subtasks,
        tag: state.tag,
        finish: state.finish,
        index: event.index,
      );
    }
  }
}
