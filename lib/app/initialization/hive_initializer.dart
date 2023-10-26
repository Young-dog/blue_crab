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
      TagAdapter(),
    )
    ..registerAdapter(
      EventAdapter(),
    )
    ..registerAdapter(
      HabitAdapter(),
    )
    ..registerAdapter(
      PurposeAdapter(),
    )
    ..registerAdapter(
      ColorAdapter(),
    );
}
