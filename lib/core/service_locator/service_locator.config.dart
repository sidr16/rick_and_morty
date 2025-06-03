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
import 'package:injectable/injectable.dart' as _i526;
import 'package:rick_and_morty/core/router/app_router.dart' as _i1004;
import 'package:rick_and_morty/core/service_locator/service_locator.modules.dart'
    as _i77;
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
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceLocatorModules = _$ServiceLocatorModules();
    gh.lazySingleton<_i361.Dio>(() => serviceLocatorModules.dioClient());
    gh.lazySingleton<_i1004.AppRouter>(() => _i1004.AppRouter());
    gh.singleton<_i641.CharactersDataSource>(
      () => _i869.CharactersDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.singleton<_i663.CharactersRepository>(
      () => _i758.CharactersRepositoryImpl(gh<_i641.CharactersDataSource>()),
    );
    gh.factory<_i765.GetCharactersUseCase>(
      () => _i765.GetCharactersUseCase(gh<_i663.CharactersRepository>()),
    );
    gh.factory<_i436.CharactersBloc>(
      () => _i436.CharactersBloc(gh<_i765.GetCharactersUseCase>()),
    );
    return this;
  }
}

class _$ServiceLocatorModules extends _i77.ServiceLocatorModules {}
