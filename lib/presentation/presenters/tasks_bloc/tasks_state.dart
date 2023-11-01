part of 'tasks_bloc.dart';

enum TasksStatus {
  initial,
  changeTasksList,
  success;
}

class TasksState extends Equatable {
  const TasksState({
    required this.tasks,
    required this.tasksStatus,
    required this.task,
    required this.selectedDate,
    required this.finishCount,
    required this.events,
    required this.tasksList,
  });

  TasksState.initial({
    this.task,
  })  : tasksStatus = TasksStatus.initial,
        tasks = <Task>[],
        selectedDate = DateTime.now(),
        finishCount = 0,
        events = <Event>[],
        tasksList = <TaskModel>[];

  final TasksStatus tasksStatus;

  final Task? task;

  final List<Task> tasks;

  final List<Event> events;

  final List<TaskModel> tasksList;

  final DateTime selectedDate;

  final int finishCount;

  TasksState copyWith({
    List<Task>? tasks,
    TasksStatus? tasksStatus,
    Task? task,
    DateTime? selectedDate,
    int? finishCount,
    List<Event>? events,
    List<TaskModel>? tasksList,
  }) {
    return TasksState(
      selectedDate: selectedDate ?? this.selectedDate,
      tasks: tasks ?? this.tasks,
      tasksStatus: tasksStatus ?? this.tasksStatus,
      task: task ?? this.task,
      finishCount: finishCount ?? this.finishCount,
      events: events ?? this.events,
      tasksList: tasksList ?? this.tasksList,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        tasks,
        tasksStatus,
        task,
        events,
        tasksList,
      ];
}
