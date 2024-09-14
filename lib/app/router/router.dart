import 'package:auto_route/auto_route.dart';
import 'package:hack_yeah_2k24/app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: CounterRoute.page,
          path: '/',
        ),
      ];

  @override
  late final List<AutoRouteGuard> guards = [];
}
