import 'package:hive_flutter/hive_flutter.dart';

import '../../app/hive_boxes.dart';
import '../../domain/domain.dart';

abstract class LocaleHabitsDataSource {
  const LocaleHabitsDataSource();

  Future<void> addHabit({
    required Habit? previousHabit,
    required Habit currentHabit,
  });

  Future<void> delHabit({
    required Habit habit,
  });

  Future<List<Habit>> getHabits();
}

class LocaleHabitsDataSourceImpl implements LocaleHabitsDataSource {
  const LocaleHabitsDataSourceImpl._internal({
    required Box<Habit> habitsBox,
  }) : _habitsBox = habitsBox;

  static Future<LocaleHabitsDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final habitsBox = await hive.openBox<Habit>(HiveBoxes.habitsBox);

    final localeHabitsDataSourceImpl = LocaleHabitsDataSourceImpl._internal(
      habitsBox: habitsBox,
    );

    return localeHabitsDataSourceImpl;
  }

  final Box<Habit> _habitsBox;

  @override
  Future<void> addHabit({
    required Habit? previousHabit,
    required Habit currentHabit,
  }) async {
    if (previousHabit != null && _habitsBox.values.contains(previousHabit)) {
      final index = _habitsBox.values.toList().indexOf(
            previousHabit,
          );

      await _habitsBox.putAt(
        index,
        currentHabit,
      );
    } else {
      await _habitsBox.add(currentHabit);
    }
  }

  @override
  Future<void> delHabit({
    required Habit habit,
  }) async {

    final index = _habitsBox.values.toList().indexOf(
      habit,
    );
    await _habitsBox.deleteAt(index);
  }

  @override
  Future<List<Habit>> getHabits() async {
    final habits = _habitsBox.values.toList();

    return habits;
  }
}
