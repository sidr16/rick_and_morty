import 'package:injectable/injectable.dart';

import '../../../main/domain/entities/character_entity/character_entity.dart';
import '../repositories/favorite_character_repository/favorite_character_repository.dart';

@injectable
class GetFavoriteCharactersUseCase {
  const GetFavoriteCharactersUseCase(this._repository);

  final FavoriteCharacterRepository _repository;

  List<CharacterEntity> execute() {
    return _repository.getFavoriteCharacters();
  }
}
