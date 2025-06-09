import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/favorites/data/models/favorite_character_model/favorite_character_model.dart';
import '../utils/constants/endpoints.dart';

@module
abstract class ServiceLocatorModules {
  @preResolve
  Future<Box<FavoriteCharacterModel>> cartBox() async {
    final dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    Hive.registerAdapter<FavoriteCharacterModel>(
      FavoriteCharacterModelAdapter(),
    );
    return Hive.openBox<FavoriteCharacterModel>('favoritesBox');
  }

  @lazySingleton
  Dio dioClient() =>
      Dio(BaseOptions(baseUrl: Endpoints.baseUrl))
        ..interceptors.add(
          DioCacheInterceptor(
            options: CacheOptions(
              store: MemCacheStore(),
              maxStale: const Duration(minutes: 15),
            ),
          ),
        );
}
