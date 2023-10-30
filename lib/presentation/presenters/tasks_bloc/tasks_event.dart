part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class DelTasksEvent extends TasksEvent {
  const DelTasksEvent({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}

class FinishTaskEvent extends TasksEvent {
  const FinishTaskEvent({
    required this.finish,
    required this.index,
  });

  final bool finish;

  final int index;

  @override
  List<Object?> get props => [
        finish,
        index,
      ];
}
