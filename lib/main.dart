import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'core/service_locator/service_locator.dart';
import 'features/favorites/presentation/bloc/favorite_characters_bloc/favorite_characters_bloc.dart';
import 'features/main/presentation/bloc/characters_bloc/characters_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator.configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<CharactersBloc>()..initialize(),
        ),
        BlocProvider(
          create: (_) => getIt<FavoriteCharactersBloc>()..getFavorites(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>().router;

    return MaterialApp.router(
      title: 'Rick and Morty',
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: router,
    );
  }
}
