import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({
    required TasksRepository tasksRepository,
    TypeTask? type,
    String? title,
    String? description,
    PriorityTask? priority,
    Tag? tag,
    DateTime? dateStart,
    DateTime? dateEnd,
    TimeOfDay? timeStart,
    TimeOfDay? timeEnd,
    List<Subtask>? subtasks,
    List<int>? days,
    bool? finish,
  })  : _tasksRepository = tasksRepository,
        super(
          TaskState.initial(
            type: type,
            title: title,
            description: description,
            priority: priority,
            tag: tag,
            dateStart: dateStart,
            dateEnd: dateEnd,
            timeStart: timeStart,
            timeEnd: timeEnd,
            subtasks: subtasks,
            days: days,
            finish: finish,
          ),
        ) {
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
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        type: event.type,
      ),
    );
  }

  void _onChangeTitleTask(
    ChangeTitleTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onChangeDescriptionTask(
    ChangeDescriptionTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _onChangePriorityTask(
    ChangePriorityTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        priority: event.priority,
      ),
    );
  }

  void _onChangeTagTask(
    ChangeTagTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.tag == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delTag,
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
    Emitter<TaskState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateFirst,
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
    Emitter<TaskState> emit,
  ) {
    if (event.time == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delTimeFirst,
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
    Emitter<TaskState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateEnd,
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
    Emitter<TaskState> emit,
  ) {
    if (event.time == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delTimeEnd,
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
    Emitter<TaskState> emit,
  ) {
    final subtasks = state.subtasks;

    if (event.subtask == null) {
      if (event.index != null) {
        subtasks.removeAt(event.index!);
        emit(
          state.copyWith(
            status: TaskStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      }
    } else {
      if (event.index == null) {
        subtasks.add(event.subtask!);
        emit(
          state.copyWith(
            status: TaskStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      } else {
        subtasks[event.index!] = event.subtask!;
        emit(
          state.copyWith(
            status: TaskStatus.changeSubtask,
            subtasks: subtasks,
          ),
        );
      }
    }

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onAddTask(
    AddTaskEvent event,
    Emitter<TaskState> emit,
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
