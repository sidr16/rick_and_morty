import 'package:either_dart/either.dart';

import '../../../../core/bloc/pagination_bloc/pagination_result.dart';
import '../entities/character_entity/character_entity.dart';

abstract class CharactersRepository {
  Future<Either<Exception, PaginationResult<CharacterEntity>>> fetchCharacters({
    required int page,
  });
}
