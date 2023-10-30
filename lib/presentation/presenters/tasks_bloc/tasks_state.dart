part of 'tasks_bloc.dart';

enum TasksStatus {
  initial,
  delDateFirst,
  delTimeFirst,
  delDateEnd,
  delTimeEnd,
  delTag,
  delPriorityTask,
  changeSubtask,
  success;

  bool get isDelDateFirst => this == delDateFirst;

  bool get isDelTimeFirst => this == delTimeFirst;

  bool get isDelDateEnd => this == delDateEnd;

  bool get isDelTimeEnd => this == delTimeEnd;

  bool get isDelTag => this == delTag;

  bool get isDelPriorityTask => this == delPriorityTask;

  bool get isAddSubtask => this == changeSubtask;

  bool get isInitial => this == delDateEnd;

  bool get isSuccess => this == delTimeEnd;
}

class TasksState extends Equatable {
  const TasksState({
    required this.status,
    required this.type,
    required this.title,
    required this.description,
    required this.priority,
    required this.tag,
    required this.dateStart,
    required this.dateEnd,
    required this.timeStart,
    required this.timeEnd,
    required this.subtasks,
    required this.days,
    required this.finish,
  });

  TasksState.initial({
    this.priority,
    this.tag,
    this.dateStart,
    this.dateEnd,
    this.timeStart,
    this.timeEnd,
  })  : status = TasksStatus.initial,
        type = TypeTask.task,
        title = '',
        description = '',
        subtasks = <Subtask>[],
        days = <int>[],
        finish = false;

  final TasksStatus status;
  final TypeTask type;
  final String title;
  final String description;
  final PriorityTask? priority;
  final Tag? tag;
  final DateTime? dateStart;
  final DateTime? dateEnd;
  final TimeOfDay? timeStart;
  final TimeOfDay? timeEnd;
  final List<Subtask> subtasks;
  final List<int> days;
  final bool finish;

  TasksState copyWith({
    TasksStatus? status,
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
  }) {
    return TasksState(
      status: status ?? this.status,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: (status?.isDelPriorityTask ?? false)
          ? null
          : priority ?? this.priority,
      tag: (status?.isDelTag ?? false) ? null : tag ?? this.tag,
      dateStart: (status?.isDelDateFirst ?? false)
          ? null
          : dateStart ?? this.dateStart,
      dateEnd: (status?.isDelDateEnd ?? false) ? null : dateEnd ?? this.dateEnd,
      timeStart: (status?.isDelTimeFirst ?? false)
          ? null
          : timeStart ?? this.timeStart,
      timeEnd: (status?.isDelTimeEnd ?? false) ? null : timeEnd ?? this.timeEnd,
      subtasks: subtasks ?? this.subtasks,
      days: days ?? this.days,
      finish: finish ?? this.finish,
    );
  }

  @override
  List<Object?> get props => [
        status,
        type,
        title,
        description,
        priority,
        tag,
        dateStart,
        dateEnd,
        timeStart,
        timeEnd,
        subtasks,
        days,
        finish
      ];
}
