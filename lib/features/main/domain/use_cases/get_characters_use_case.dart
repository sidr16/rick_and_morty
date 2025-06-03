import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/pagination_bloc/pagination_result.dart';
import '../entities/character_entity/character_entity.dart';
import '../repositories/characters_repository.dart';

@injectable
class GetCharactersUseCase {
  const GetCharactersUseCase(this._repository);

  final CharactersRepository _repository;

  Future<Either<Exception, PaginationResult<CharacterEntity>>> fetch({
    required int page,
  }) => _repository.fetchCharacters(page: page);
}
