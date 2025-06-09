// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/core/router/app_router.dart' as _i1004;
import 'package:rick_and_morty/core/service_locator/service_locator.modules.dart'
    as _i77;
import 'package:rick_and_morty/features/favorites/data/data_sources/local/favorite_character_data_source/favorite_character_data_source.dart'
    as _i1023;
import 'package:rick_and_morty/features/favorites/data/data_sources/local/favorite_character_data_source/favorite_character_data_source_impl.dart'
    as _i750;
import 'package:rick_and_morty/features/favorites/data/models/favorite_character_model/favorite_character_model.dart'
    as _i589;
import 'package:rick_and_morty/features/favorites/data/repositories/favorite_character_repository_impl/favorite_character_repository_impl.dart'
    as _i872;
import 'package:rick_and_morty/features/favorites/domain/repositories/favorite_character_repository/favorite_character_repository.dart'
    as _i887;
import 'package:rick_and_morty/features/favorites/domain/use_cases/add_character_to_favorites_use_case.dart'
    as _i684;
import 'package:rick_and_morty/features/favorites/domain/use_cases/clean_favorite_characters_use_case.dart'
    as _i245;
import 'package:rick_and_morty/features/favorites/domain/use_cases/get_favorite_characters_ids_use_case.dart'
    as _i682;
import 'package:rick_and_morty/features/favorites/domain/use_cases/get_favorite_characters_use_case.dart'
    as _i380;
import 'package:rick_and_morty/features/favorites/domain/use_cases/remove_character_from_favorites_use_case.dart'
    as _i1059;
import 'package:rick_and_morty/features/favorites/presentation/bloc/favorite_characters_bloc/favorite_characters_bloc.dart'
    as _i804;
import 'package:rick_and_morty/features/main/data/data_sources/remote/characters_data_source/characters_data_source.dart'
    as _i641;
import 'package:rick_and_morty/features/main/data/data_sources/remote/characters_data_source/characters_data_source_impl.dart'
    as _i869;
import 'package:rick_and_morty/features/main/data/repositories/characters_repository_impl.dart'
    as _i758;
import 'package:rick_and_morty/features/main/domain/repositories/characters_repository.dart'
    as _i663;
import 'package:rick_and_morty/features/main/domain/use_cases/get_characters_use_case.dart'
    as _i765;
import 'package:rick_and_morty/features/main/presentation/bloc/characters_bloc/characters_bloc.dart'
    as _i436;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceLocatorModules = _$ServiceLocatorModules();
    await gh.factoryAsync<_i986.Box<_i589.FavoriteCharacterModel>>(
      () => serviceLocatorModules.cartBox(),
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => serviceLocatorModules.dioClient());
    gh.lazySingleton<_i1004.AppRouter>(() => _i1004.AppRouter());
    gh.singleton<_i1023.FavoriteCharacterDataSource>(
      () => _i750.FavoriteCharacterDataSourceImpl(
        gh<_i979.Box<_i589.FavoriteCharacterModel>>(),
      ),
    );
    gh.singleton<_i641.CharactersDataSource>(
      () => _i869.CharactersDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i663.CharactersRepository>(
      () => _i758.CharactersRepositoryImpl(gh<_i641.CharactersDataSource>()),
    );
    gh.singleton<_i887.FavoriteCharacterRepository>(
      () => _i872.FavoriteCharacterRepositoryImpl(
        gh<_i1023.FavoriteCharacterDataSource>(),
      ),
    );
    gh.factory<_i765.GetCharactersUseCase>(
      () => _i765.GetCharactersUseCase(gh<_i663.CharactersRepository>()),
    );
    gh.factory<_i682.GetFavoriteCharactersIdsUseCase>(
      () => _i682.GetFavoriteCharactersIdsUseCase(
        gh<_i887.FavoriteCharacterRepository>(),
      ),
    );
    gh.factory<_i245.CleanFavoriteCharactersUseCase>(
      () => _i245.CleanFavoriteCharactersUseCase(
        gh<_i887.FavoriteCharacterRepository>(),
      ),
    );
    gh.factory<_i1059.RemoveCharacterFromFavoritesUseCase>(
      () => _i1059.RemoveCharacterFromFavoritesUseCase(
        gh<_i887.FavoriteCharacterRepository>(),
      ),
    );
    gh.factory<_i684.AddCharacterToFavoritesUseCase>(
      () => _i684.AddCharacterToFavoritesUseCase(
        gh<_i887.FavoriteCharacterRepository>(),
      ),
    );
    gh.factory<_i380.GetFavoriteCharactersUseCase>(
      () => _i380.GetFavoriteCharactersUseCase(
        gh<_i887.FavoriteCharacterRepository>(),
      ),
    );
    gh.factory<_i804.FavoriteCharactersBloc>(
      () => _i804.FavoriteCharactersBloc(
        gh<_i380.GetFavoriteCharactersUseCase>(),
        gh<_i684.AddCharacterToFavoritesUseCase>(),
        gh<_i1059.RemoveCharacterFromFavoritesUseCase>(),
        gh<_i245.CleanFavoriteCharactersUseCase>(),
      ),
    );
    gh.factory<_i436.CharactersBloc>(
      () => _i436.CharactersBloc(gh<_i765.GetCharactersUseCase>()),
    );
    return this;
  }
}

class _$ServiceLocatorModules extends _i77.ServiceLocatorModules {}
