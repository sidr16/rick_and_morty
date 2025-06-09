import 'package:injectable/injectable.dart';

import '../repositories/favorite_character_repository/favorite_character_repository.dart';

@injectable
class RemoveCharacterFromFavoritesUseCase {
  const RemoveCharacterFromFavoritesUseCase(this._repository);

  final FavoriteCharacterRepository _repository;

  void execute(int id) {
    return _repository.removeCharacterFromFavorites(id);
  }
}
