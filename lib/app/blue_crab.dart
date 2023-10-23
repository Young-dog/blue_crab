import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'app.dart';

class BlueCrab extends StatelessWidget {
  BlueCrab({super.key});

  final _appRouter = GetIt.instance<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return GlobalBlocInjector(
      child: MaterialApp.router(
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(GetIt.I<Talker>()),
          ],
        ),
        //TODO: Поставить Bloc для изменения языка в реальном времени
        locale: const Locale.fromSubtags(languageCode: 'ru'),
        supportedLocales: AppLocaleUtils.supportedLocales,
        //TODO: Поставить Bloc для изменения темы в реальном времени
        theme: const LightThemeBuilder().build(),
      ),
    );
  }
}
