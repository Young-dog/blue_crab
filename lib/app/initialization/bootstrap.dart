import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../app.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {


  final talker = TalkerFlutter.init();

  final talkerBloc = TalkerBlocObserver(talker: talker,);

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

      await registerDependencies();

      await GetIt.instance.allReady();

      Bloc.observer = talkerBloc;

      runApp(
        TranslationProvider(
          child: await builder(),
        ),
      );
    },
    talker.handle,
  );
}
