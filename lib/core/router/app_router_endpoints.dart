class AppRouterEndpoint {
  const AppRouterEndpoint({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;
}

class AppRouterEndpoints {
  static const home = AppRouterEndpoint(
    name: 'Home',
    path: '/',
  );

  static const favorites = AppRouterEndpoint(
    name: 'Favorites',
    path: '/favorites',
  );
}
