import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class EventsRepository {
  const EventsRepository();

  Stream<List<Event>> get eventsChanges;

  List<Event> get events;

  Future<void> addEvent({
    required Event? previousEvent,
    required TypeTask type,
    required String title,
    required String description,
    required PriorityTask? priority,
    required List<Subtask> subtasks,
    required Tag? tag,
    required DateTime? dateStart,
    required TimeOfDay? timeStart,
    required List<int> days,
    required List<DateTime> finishDates,
  });

  Future<void> delEvent({
    required Event event,
  });
}

class EventsRepositoryImpl implements EventsRepository, Disposable {
  EventsRepositoryImpl._internal({
    required List<Event> events,
    required LocaleEventsDataSource localeEventsDataSource,
  })  : _localeEventsDataSource = localeEventsDataSource,
        _events = events,
        _eventsController = StreamController<List<Event>>.broadcast();

  static Future<EventsRepositoryImpl> create({
    required LocaleEventsDataSource localeEventsDataSource,
  }) async {
    final events = await localeEventsDataSource.getEvents();

    final eventsRepositoryImpl = EventsRepositoryImpl._internal(
      events: events,
      localeEventsDataSource: localeEventsDataSource,
    );

    return eventsRepositoryImpl;
  }

  final LocaleEventsDataSource _localeEventsDataSource;

  final StreamController<List<Event>> _eventsController;

  List<Event> _events;

  @override
  Future<void> addEvent({
    required Event? previousEvent,
    required TypeTask type,
    required String title,
    required String description,
    required PriorityTask? priority,
    required List<Subtask> subtasks,
    required Tag? tag,
    required DateTime? dateStart,
    required TimeOfDay? timeStart,
    required List<int> days,
    required List<DateTime> finishDates,
  }) async {
    final event = Event(
      title: title,
      description: description,
      priority: priority,
      subtasks: subtasks,
      tag: tag,
      dateStart: dateStart,
      timeStart: timeStart,
      days: days,
      finishDates: finishDates, type: type,
    );

    await _localeEventsDataSource.addEvent(
      previousEvent: previousEvent,
      currentEvent: event,
    );

    await changeEvents();
  }

  @override
  Future<void> delEvent({required Event event}) async {
    await _localeEventsDataSource.delEvent(
      event: event,
    );

    await changeEvents();
  }

  @override
  List<Event> get events => _events;

  @override
  Stream<List<Event>> get eventsChanges => _eventsController.stream;

  Future<void> changeEvents() async {
    _events = await _localeEventsDataSource.getEvents();

    _eventsController.add(_events);
  }

  @override
  FutureOr onDispose() {
    _eventsController.close();
  }
}
