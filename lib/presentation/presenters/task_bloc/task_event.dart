part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTypeTaskEvent extends TaskEvent {
  const ChangeTypeTaskEvent({
    required this.type,
  });

  final TypeTask type;

  @override
  List<Object?> get props => [
        type,
      ];
}

class ChangeTitleTaskEvent extends TaskEvent {
  const ChangeTitleTaskEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [
        title,
      ];
}

class ChangeDescriptionTaskEvent extends TaskEvent {
  const ChangeDescriptionTaskEvent({
    required this.description,
  });

  final String description;

  @override
  List<Object?> get props => [
        description,
      ];
}

class ChangePriorityTaskEvent extends TaskEvent {
  const ChangePriorityTaskEvent({
    required this.priority,
  });

  final PriorityTask priority;

  @override
  List<Object?> get props => [
        priority,
      ];
}

class ChangeTagTaskEvent extends TaskEvent {
  const ChangeTagTaskEvent({
    required this.tag,
  });

  final Tag? tag;

  @override
  List<Object?> get props => [
        tag,
      ];
}

class ChangeDateStartTaskEvent extends TaskEvent {
  const ChangeDateStartTaskEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class ChangeTimeStartTaskEvent extends TaskEvent {
  const ChangeTimeStartTaskEvent({
    required this.time,
  });

  final TimeOfDay? time;

  @override
  List<Object?> get props => [
        time,
      ];
}

class ChangeDateEndTaskEvent extends TaskEvent {
  const ChangeDateEndTaskEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class ChangeTimeEndTaskEvent extends TaskEvent {
  const ChangeTimeEndTaskEvent({
    required this.time,
  });

  final TimeOfDay? time;

  @override
  List<Object?> get props => [
        time,
      ];
}

class ChangeSubtasksTaskEvent extends TaskEvent {
  const ChangeSubtasksTaskEvent({
    required this.subtask,
    this.index,
  });

  final int? index;
  final Subtask? subtask;

  @override
  List<Object?> get props => [
        subtask,
        index,
      ];
}

class AddTaskEvent extends TaskEvent {
  const AddTaskEvent({
    this.index,
  });

  final int? index;

  @override
  List<Object?> get props => [
    index,
  ];
}
