import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../presentation/presentation.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'track',
              page: TrackRoute.page,
            ),
            AutoRoute(
              path: 'finance',
              page: FinanceRoute.page,
            ),
            AutoRoute(
              path: 'news',
              page: NewsRoute.page,
            ),
            AutoRoute(
              path: 'settings',
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: TaskRoute.page,
          path: '/task',
        ),
        AutoRoute(
          page: HabitRoute.page,
          path: '/habit',
        ),
      ];
}
