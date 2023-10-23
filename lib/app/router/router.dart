import 'package:auto_route/auto_route.dart';
import '../../presentation/presentation.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: TrackRoute.page,
        ),
      ];
}
