import 'package:auto_route/auto_route.dart';
import 'package:hack_yeah_2k24/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: UiPreviewRoute.page,
          path: '/ui=kit',
        ),
        AutoRoute(
          page: GoogleMapRoute.page,
          path: '/map',
        ),
      ];

  @override
  late final List<AutoRouteGuard> guards = [];
}
