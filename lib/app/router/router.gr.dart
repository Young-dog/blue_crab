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
    TrackRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TrackPage(),
      );
    }
  };
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
