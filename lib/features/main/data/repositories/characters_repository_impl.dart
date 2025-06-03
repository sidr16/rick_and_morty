import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/pagination_bloc/pagination_result.dart';
import '../../domain/entities/character_entity/character_entity.dart';
import '../../domain/repositories/characters_repository.dart';
import '../data_sources/remote/characters_data_source/characters_data_source.dart';
import '../models/character_model/character_model.dart';

@Singleton(as: CharactersRepository)
class CharactersRepositoryImpl extends CharactersRepository {
  CharactersRepositoryImpl(this._dataSource);

  final CharactersDataSource _dataSource;

  @override
  Future<Either<Exception, PaginationResult<CharacterEntity>>> fetchCharacters({
    required int page,
  }) async {
    try {
      final data = await _dataSource.fetchCharacters(
        page: page,
      );

      final results = data.results.map((item) => item.toEntity()).toList();

      return Right(
        PaginationResult(
          info: data.info,
          results: results,
        ),
      );
    } on Exception catch (error) {
      return Left(error);
    }
  }
}
