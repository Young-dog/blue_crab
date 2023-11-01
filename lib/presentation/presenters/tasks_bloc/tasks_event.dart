part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class DelTasksEvent extends TasksEvent {
  const DelTasksEvent({
    required this.task,
    required this.type,
  });

  final TypeTask type;

  final TaskModel task;

  @override
  List<Object?> get props => [
        task,
        type,
      ];
}

class ChangeTasksEvent extends TasksEvent {
  const ChangeTasksEvent({
    this.tasks,
    this.events,
  });

  final List<Event>? events;

  final List<Task>? tasks;

  @override
  List<Object?> get props => [
        tasks,
        events,
      ];
}

class ChangeDateEvent extends TasksEvent {
  const ChangeDateEvent({
    required this.date,
  });

  final DateTime date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class FinishTaskEvent extends TasksEvent {
  const FinishTaskEvent({
    required this.task,
    required this.type,
  });

  final TypeTask type;

  final TaskModel task;

  @override
  List<Object?> get props => [
        task,
        type,
      ];
}
