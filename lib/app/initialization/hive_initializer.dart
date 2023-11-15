import 'package:hive_flutter/hive_flutter.dart';
import '../../data/data.dart';
import '../../domain/domain.dart';

Future<void> initializeHive() async {
  await Hive.initFlutter();

  Hive
    ..registerAdapter(
      TaskAdapter(),
    )
    ..registerAdapter(
      SubtaskAdapter(),
    )
    ..registerAdapter(
      TimeOfDayAdapter(),
    )
    ..registerAdapter(
      TagAdapter(),
    )
    ..registerAdapter(
      HabitAdapter(),
    )
    ..registerAdapter(
      PurposeAdapter(),
    )
    ..registerAdapter(
      ColorAdapter(),
    )
    ..registerAdapter(
      PriorityTaskAdapter(),
    )
    ..registerAdapter(
      TypeTaskAdapter(),
    )
    ..registerAdapter(
      EventAdapter(),
    )
    ..registerAdapter(
      CompletedHabitAdapter(),
    );


  //await Hive.deleteBoxFromDisk(HiveBoxes.tasksBox);
}
