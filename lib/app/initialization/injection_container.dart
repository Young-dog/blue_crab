import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';
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
    )
    ..registerLazySingleton<HiveInterface>(
      () => Hive,
    );
}

Future<void> _registerDataSources() async {
  _getIt
    ..registerSingletonAsync<LocaleTagsDataSource>(
      () async => LocaleTagsDataSourceImpl.create(
        hive: _getIt(),
      ),
    )
    ..registerSingletonAsync<LocaleTasksDataSource>(
      () async => LocaleTasksDataSourceImpl.create(
        hive: _getIt(),
      ),
    )
    ..registerSingletonAsync<LocaleEventsDataSource>(
      () async => LocaleEventsDataSourceImpl.create(
        hive: _getIt(),
      ),
    );
}

Future<void> _registerRepositories() async {
  _getIt
    ..registerLazySingleton<TagsRepository>(
      () => TagsRepositoryImpl(
        localeTagsDataSource: _getIt(),
      ),
    )
    ..registerSingletonAsync<TasksRepository>(
      () async => TasksRepositoryImpl.create(
        localeTasksDataSource: _getIt(),
      ),
      dependsOn: [
        LocaleTasksDataSource,
      ],
    )
    ..registerSingletonAsync<EventsRepository>(
      () async => EventsRepositoryImpl.create(
        localeEventsDataSource: _getIt(),
      ),
      dependsOn: [
        LocaleEventsDataSource,
      ],
    );
}

Future<void> _registerBlocs() async {
  _getIt.registerFactory(
      TrackBloc.new,
    );
}
