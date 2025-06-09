import 'package:injectable/injectable.dart';

import '../repositories/favorite_character_repository/favorite_character_repository.dart';

@injectable
class GetFavoriteCharactersIdsUseCase {
  const GetFavoriteCharactersIdsUseCase(this._repository);

  final FavoriteCharacterRepository _repository;

  List<int> execute() {
    return _repository.getFavoriteCharactersIds();
  }
}
