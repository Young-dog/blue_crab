part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class ChangeTypeTaskEvent extends TasksEvent {
  const ChangeTypeTaskEvent({
    required this.type,
  });

  final TypeTask type;

  @override
  List<Object?> get props => [
        type,
      ];
}

class ChangeTitleTaskEvent extends TasksEvent {
  const ChangeTitleTaskEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [
        title,
      ];
}

class ChangeDescriptionTaskEvent extends TasksEvent {
  const ChangeDescriptionTaskEvent({
    required this.description,
  });

  final String description;

  @override
  List<Object?> get props => [
        description,
      ];
}

class ChangePriorityTaskEvent extends TasksEvent {
  const ChangePriorityTaskEvent({
    required this.priority,
  });

  final PriorityTask priority;

  @override
  List<Object?> get props => [
        priority,
      ];
}

class ChangeTagTaskEvent extends TasksEvent {
  const ChangeTagTaskEvent({
    required this.tag,
  });

  final Tag? tag;

  @override
  List<Object?> get props => [
        tag,
      ];
}

class ChangeDateStartTaskEvent extends TasksEvent {
  const ChangeDateStartTaskEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class ChangeTimeStartTaskEvent extends TasksEvent {
  const ChangeTimeStartTaskEvent({
    required this.time,
  });

  final TimeOfDay? time;

  @override
  List<Object?> get props => [
    time,
  ];
}


class ChangeDateEndTaskEvent extends TasksEvent {
  const ChangeDateEndTaskEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
    date,
  ];
}


class ChangeTimeEndTaskEvent extends TasksEvent {
  const ChangeTimeEndTaskEvent({
    required this.time,
  });

  final TimeOfDay? time;

  @override
  List<Object?> get props => [
    time,
  ];
}

