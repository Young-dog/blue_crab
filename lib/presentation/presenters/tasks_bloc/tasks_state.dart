part of 'tasks_bloc.dart';

enum TasksStatus {
  initial,
  changeTasksList,
  success;
}

class TasksState extends Equatable {
  const TasksState({
    required this.tasksStatus,
    required this.task,
  });

  const TasksState.initial({
    this.task,
  }) : tasksStatus = TasksStatus.initial;

  final TasksStatus tasksStatus;

  final Task? task;

  TasksState copyWith({
    TasksStatus? tasksStatus,
    Task? task,
  }) {
    return TasksState(
      tasksStatus: tasksStatus ?? this.tasksStatus,
      task: task ?? this.task,
    );
  }

  @override
  List<Object?> get props => [
        tasksStatus,
        task,
      ];
}
