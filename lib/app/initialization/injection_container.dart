import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../app.dart';

final _getIt = GetIt.instance;

Future<void> registerDependencies() async {
  await _registerServices();
  await _registerDataSources();
  await _registerRepositories();
  await _registerBlocs();
}

Future<void> _registerServices() async {
  _getIt
    ..registerLazySingleton<Talker>(
      TalkerFlutter.init,
    )
    ..registerLazySingleton<TalkerBlocObserver>(
      () => TalkerBlocObserver(talker: _getIt()),
    )
    ..registerLazySingleton<AppRouter>(
      AppRouter.new,
    );
}

Future<void> _registerDataSources() async {}

Future<void> _registerRepositories() async {}

Future<void> _registerBlocs() async {}
