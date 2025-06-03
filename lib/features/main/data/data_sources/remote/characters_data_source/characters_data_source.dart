import '../../../../../../core/bloc/pagination_bloc/pagination_result.dart';
import '../../../models/character_model/character_model.dart';

abstract class CharactersDataSource {
  Future<PaginationResult<CharacterModel>> fetchCharacters({
    required int page,
  });
}
