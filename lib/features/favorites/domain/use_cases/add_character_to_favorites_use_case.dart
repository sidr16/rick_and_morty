import 'package:injectable/injectable.dart';

import '../../../main/domain/entities/character_entity/character_entity.dart';
import '../repositories/favorite_character_repository/favorite_character_repository.dart';

@injectable
class AddCharacterToFavoritesUseCase {
  const AddCharacterToFavoritesUseCase(this._repository);

  final FavoriteCharacterRepository _repository;

  void execute(CharacterEntity character) {
    return _repository.addCharacterToFavorites(character);
  }
}
