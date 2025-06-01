import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/favorites/presentation/pages/favorites_page/favorites_page.dart';
import '../../features/main/presentation/pages/home_page/home_page.dart';
import '../../features/main/presentation/pages/navigation_page/navigation_page.dart';
import 'app_router_endpoints.dart';

@lazySingleton
class AppRouter {
  late final router = GoRouter(
    routes: routes,
    initialLocation: AppRouterEndpoints.home.path,
  );

  final routes = [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationPage(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouterEndpoints.home.name,
              path: AppRouterEndpoints.home.path,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRouterEndpoints.favorites.name,
              path: AppRouterEndpoints.favorites.path,
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
      ],
    ),
  ];
}
