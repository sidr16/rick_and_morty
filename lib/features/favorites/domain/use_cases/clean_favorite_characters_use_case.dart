import 'package:injectable/injectable.dart';

import '../repositories/favorite_character_repository/favorite_character_repository.dart';

@injectable
class CleanFavoriteCharactersUseCase {
  const CleanFavoriteCharactersUseCase(this._repository);

  final FavoriteCharacterRepository _repository;

  void execute() {
    return _repository.cleanFavoriteCharacters();
  }
}
