import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../app.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {

  await registerDependencies();

  final talker = GetIt.instance<Talker>();

  final talkerBloc = GetIt.instance<TalkerBlocObserver>();

  FlutterError.onError = (details) => talker.handle(
        details.exception,
        details.stack,
      );

  await await runTalkerZonedGuarded(
    talker,
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      LocaleSettings.useDeviceLocale();

      await initializeHive();

      await GetIt.instance.allReady();

      Bloc.observer = talkerBloc;

      runApp(await builder());
    },
    talker.handle,
  );
}
