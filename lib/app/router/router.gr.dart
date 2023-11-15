// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    FinanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FinancePage(),
      );
    },
    HabitRoute.name: (routeData) {
      final args = routeData.argsAs<HabitRouteArgs>(
          orElse: () => const HabitRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HabitPage(
          habit: args.habit,
          selectedDate: args.selectedDate,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    TaskRoute.name: (routeData) {
      final args =
          routeData.argsAs<TaskRouteArgs>(orElse: () => const TaskRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaskPage(
          task: args.task,
          key: args.key,
        ),
      );
    },
    TrackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrackPage(),
      );
    },
  };
}

/// generated route for
/// [FinancePage]
class FinanceRoute extends PageRouteInfo<void> {
  const FinanceRoute({List<PageRouteInfo>? children})
      : super(
          FinanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HabitPage]
class HabitRoute extends PageRouteInfo<HabitRouteArgs> {
  HabitRoute({
    Habit? habit,
    DateTime? selectedDate,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          HabitRoute.name,
          args: HabitRouteArgs(
            habit: habit,
            selectedDate: selectedDate,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HabitRoute';

  static const PageInfo<HabitRouteArgs> page = PageInfo<HabitRouteArgs>(name);
}

class HabitRouteArgs {
  const HabitRouteArgs({
    this.habit,
    this.selectedDate,
    this.key,
  });

  final Habit? habit;

  final DateTime? selectedDate;

  final Key? key;

  @override
  String toString() {
    return 'HabitRouteArgs{habit: $habit, selectedDate: $selectedDate, key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaskPage]
class TaskRoute extends PageRouteInfo<TaskRouteArgs> {
  TaskRoute({
    TaskModel? task,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TaskRoute.name,
          args: TaskRouteArgs(
            task: task,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskRoute';

  static const PageInfo<TaskRouteArgs> page = PageInfo<TaskRouteArgs>(name);
}

class TaskRouteArgs {
  const TaskRouteArgs({
    this.task,
    this.key,
  });

  final TaskModel? task;

  final Key? key;

  @override
  String toString() {
    return 'TaskRouteArgs{task: $task, key: $key}';
  }
}

/// generated route for
/// [TrackPage]
class TrackRoute extends PageRouteInfo<void> {
  const TrackRoute({List<PageRouteInfo>? children})
      : super(
          TrackRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
