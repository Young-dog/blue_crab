import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc({
    required TasksRepository tasksRepository,
    required EventsRepository eventsRepository,
  })
      : _tasksRepository = tasksRepository,
        _eventsRepository = eventsRepository,
        super(TasksState.initial()) {
    on<DelTasksEvent>(_onDelTasks);
    on<FinishTaskEvent>(_onFinishTasks);
    on<ChangeTasksEvent>(_onChangeTasks);
    on<ChangeDateEvent>(_onChangeDate);
    _init();
    add(ChangeDateEvent(date: DateTime.now()));
  }

  final TasksRepository _tasksRepository;

  final EventsRepository _eventsRepository;

  late final StreamSubscription<List<Task>> _tasksSubscription;

  late final StreamSubscription<List<Event>> _eventsSubscription;

  void _init() {
    _tasksSubscription = _tasksRepository.tasksChanges.listen((tasks) {
      final tasksLists = _getTasks(tasks: tasks);
      final events = _getEvents(events: _eventsRepository.events);

      add(
        ChangeTasksEvent(tasks: tasksLists, events: events),
      );
    });

    _eventsSubscription = _eventsRepository.eventsChanges.listen((events) {
      final eventsList = _getEvents(events: events);
      final tasks = _getTasks(tasks: _tasksRepository.tasks);

      add(
        ChangeTasksEvent(
          events: eventsList,
          tasks: tasks,
        ),
      );
    });
  }

  void _onChangeTasks(ChangeTasksEvent event,
      Emitter<TasksState> emit,) {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
        events: event.events,
        tasks: event.tasks,
      ),
    );

    final finishEvents = event.events
        .where(
          (element) =>
          element.finishDates.contains(
            state.selectedDate,
          ),
    )
        .length;
    final finishTasks = event.tasks
        .where((element) => element.finish)
        .length;

    final tasksList = <TaskModel>[
      ...event.tasks,
      ...event.events,
    ];

    emit(
      state.copyWith(
        tasksStatus: TasksStatus.success,
        tasksList: tasksList,
        finishCount: finishEvents + finishTasks,
      ),
    );
  }

  void _onChangeDate(ChangeDateEvent event,
      Emitter<TasksState> emit,) {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
        selectedDate: event.date,
      ),
    );

    final tasks = _getTasks(tasks: _tasksRepository.tasks);

    final events = _getEvents(events: _eventsRepository.events);

    final tasksLists = <TaskModel>[
      ...tasks,
      ...events,
    ];

    final finishCountTasks = tasks
        .where(
          (e) => e.finish,
    )
        .toList();

    final finishCountEvents = events
        .where(
          (e) =>
          e.finishDates.contains(
            state.selectedDate,
          ),
    )
        .toList();

    final finishCount = finishCountTasks.length + finishCountEvents.length;

    emit(
      state.copyWith(
        tasksList: tasksLists,
        finishCount: finishCount,
      ),
    );
  }

  Future<void> _onDelTasks(DelTasksEvent event,
      Emitter<TasksState> emit,) async {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
      ),
    );

    try {
      if (event.type == TypeTask.task) {
        await _tasksRepository.delTasks(
          task: event.task as Task,
        );
      } else {
        await _eventsRepository.delEvent(
          event: event.task as Event,
        );
      }

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

  Future<void> _onFinishTasks(FinishTaskEvent event,
      Emitter<TasksState> emit,) async {
    emit(
      state.copyWith(
        tasksStatus: TasksStatus.changeTasksList,
      ),
    );

    try {
      if (event.type == TypeTask.task) {
        final task = event.task as Task;
        await _tasksRepository.finishTasks(
          task: task,
          finish: !task.finish,
        );
      } else {
        final eventTask = event.task as Event;

        final date = DateTime(
          state.selectedDate.year,
          state.selectedDate.month,
          state.selectedDate.day,
        );
        if (eventTask.finishDates.contains(date)) {
          eventTask.finishDates.remove(date);
        } else {
          eventTask.finishDates.add(date);
        }
        await _eventsRepository.addEvent(
          type: eventTask.type,
          title: eventTask.title,
          description: eventTask.description,
          priority: eventTask.priority,
          subtasks: eventTask.subtasks,
          tag: eventTask.tag,
          dateStart: eventTask.dateStart,
          timeStart: eventTask.timeStart,
          days: eventTask.days,
          finishDates: eventTask.finishDates,
          previousEvent: event.task as Event,
        );
      }

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

  @override
  Future<void> close() {
    _tasksSubscription.cancel();
    _eventsSubscription.cancel();
    return super.close();
  }

  List<Task> _getTasks({
    required List<Task> tasks,
  }) {
    final tasksList = tasks.where(
          (e) {
        final dateNull = (e.dateStart == null) &&
            (state.selectedDate.year == DateTime
                .now()
                .year &&
                state.selectedDate.month == DateTime
                    .now()
                    .month &&
                state.selectedDate.day == DateTime
                    .now()
                    .day);

        final dateEndNull = (e.dateStart != null && e.dateEnd == null) &&
            (e.dateStart!.year == state.selectedDate.year &&
                e.dateStart!.month == state.selectedDate.month &&
                e.dateStart!.day == state.selectedDate.day);

        final dateNotNull = !e.finish
            ? (e.dateStart != null && e.dateEnd != null) &&
            (e.dateStart!.year <= state.selectedDate.year &&
                e.dateStart!.month <= state.selectedDate.month &&
                e.dateStart!.day <= state.selectedDate.day) &&
            (e.dateEnd!.year >= state.selectedDate.year &&
                e.dateEnd!.month >= state.selectedDate.month &&
                e.dateEnd!.day >= state.selectedDate.day) &&
            (state.selectedDate.year == DateTime
                .now()
                .year &&
                state.selectedDate.month == DateTime
                    .now()
                    .month &&
                state.selectedDate.day == DateTime
                    .now()
                    .day)
            : (e.dateStart != null && e.dateEnd != null) &&
            (e.dateStart!.year == state.selectedDate.year &&
                e.dateStart!.month == state.selectedDate.month &&
                e.dateStart!.day == state.selectedDate.day);

        return dateNull || dateEndNull || dateNotNull;
      },
    ).toList();

    return tasksList;
  }

  List<Event> _getEvents({
    required List<Event> events,
  }) {
    final eventsList = events
        .where(
            (e) {
          final date = DateTime(
            state.selectedDate.year, state.selectedDate.month,
            state.selectedDate.day,);

          return ((e.dateStart?.year == state.selectedDate.year &&
              e.dateStart?.month == state.selectedDate.month &&
              e.dateStart?.day == state.selectedDate.day) ||
              (e.days.contains(
                state.selectedDate.weekday,
              )) ||
              (state.selectedDate.year == DateTime
                  .now()
                  .year &&
                  state.selectedDate.month == DateTime
                      .now()
                      .month &&
                  state.selectedDate.day == DateTime
                      .now()
                      .day)) &&
              (!e.finishDates.contains(date));
        }
    )
        .toList();

    return eventsList;
  }
}
