import 'dart:async';
import 'dart:ui';

import 'package:get_it/get_it.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class HabitsRepository {
  const HabitsRepository();

  Stream<List<Habit>> get habitsChanges;

  List<Habit> get habits;

  Future<void> addHabits({
    required String title,
    required String description,
    required List<int> days,
    required int numberRepetitions,
    required List<CompletedHabit> completedHabits,
    required DateTime dateAdd,
    required Habit? previousHabit,
    required Color color,
  });

  Future<void> delHabit({
    required Habit habit,
  });
}

class HabitsRepositoryImpl implements HabitsRepository, Disposable {
  HabitsRepositoryImpl._internal({
    required List<Habit> habits,
    required LocaleHabitsDataSource localeHabitsDataSource,
  })  : _habits = habits,
        _localeHabitsDataSource = localeHabitsDataSource,
        _habitsController = StreamController<List<Habit>>.broadcast();

  static Future<HabitsRepositoryImpl> create({
    required LocaleHabitsDataSource localeHabitsDataSource,
  }) async {
    final habits = await localeHabitsDataSource.getHabits();

    final localeHabitsRepositoryImpl = HabitsRepositoryImpl._internal(
      habits: habits,
      localeHabitsDataSource: localeHabitsDataSource,
    );

    return localeHabitsRepositoryImpl;
  }

  final LocaleHabitsDataSource _localeHabitsDataSource;

  List<Habit> _habits;

  final StreamController<List<Habit>> _habitsController;

  @override
  Future<void> addHabits({
    required String title,
    required String description,
    required List<int> days,
    required int numberRepetitions,
    required List<CompletedHabit> completedHabits,
    required DateTime dateAdd,
    required Habit? previousHabit,
    required Color color,
  }) async {
    final currentHabit = Habit(
      title: title,
      description: description,
      days: days,
      numberRepetitions: numberRepetitions,
      completedHabits: completedHabits,
      dateAdd: dateAdd,
      color: color,
    );

    await _localeHabitsDataSource.addHabit(
      previousHabit: previousHabit,
      currentHabit: currentHabit,
    );

    await _getHabits();
  }

  @override
  Future<void> delHabit({
    required Habit habit,
  }) async {
    await _localeHabitsDataSource.delHabit(
      habit: habit,
    );

    await _getHabits();
  }

  Future<void> _getHabits() async {
    _habits = await _localeHabitsDataSource.getHabits();

    _habitsController.add(_habits);
  }

  @override
  List<Habit> get habits => _habits;

  @override
  Stream<List<Habit>> get habitsChanges => _habitsController.stream;

  @override
  FutureOr onDispose() {
    _habitsController.close();
  }
}
