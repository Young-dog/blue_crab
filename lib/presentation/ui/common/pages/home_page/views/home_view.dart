import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../app/app.dart';
import '../../../../ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        TrackRoute(),
        FinanceRoute(),
        NewsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: NavigateBottomBar(tabsRouter: tabsRouter,),
        );
      },
    );
  }
}
