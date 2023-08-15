import 'package:auto_route/auto_route.dart';
import 'package:wiredash_preserve_state/main.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Tab,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MyHomeRoute.page,
        ),
      ];
}
