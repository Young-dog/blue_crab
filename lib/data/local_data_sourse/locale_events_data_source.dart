import 'package:hive_flutter/hive_flutter.dart';
import '../../app/app.dart';
import '../../domain/domain.dart';

abstract class LocaleEventsDataSource {
  const LocaleEventsDataSource();

  Future<void> addEvent({
    required Event event,
  });

  Future<List<Event>> getEvents();

  Future<void> delEvent({
    required Event event,
  });

}

class LocaleEventsDataSourceImpl implements LocaleEventsDataSource {
  const LocaleEventsDataSourceImpl._internal({
    required Box<Event> eventsBox,
  }) : _eventsBox = eventsBox;

  static Future<LocaleEventsDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final eventsBox = await hive.openBox<Event>(
      HiveBoxes.eventsBox,
    );

    final localeEventsDataSourceImpl = LocaleEventsDataSourceImpl._internal(
      eventsBox: eventsBox,
    );

    return localeEventsDataSourceImpl;
  }

  final Box<Event> _eventsBox;

  @override
  Future<void> addEvent({
    required Event event,
  }) async {
    if (_eventsBox.values.toList().contains(event)) {
      final index = _eventsBox.values.toList().indexOf(event);

      Event? updateTask;

      await _eventsBox.putAt(
        index,
        updateTask ?? event,
      );
    } else {
      await _eventsBox.add(
        event,
      );
    }
  }

  @override
  Future<void> delEvent({
    required Event event,
  }) async {
    final index = _eventsBox.values.toList().indexOf(event);

    await _eventsBox.deleteAt(index);
  }

  @override
  Future<List<Event>> getEvents() async {
    final events = _eventsBox.values.toList();

    return events;
  }
}
