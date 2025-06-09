import '../../../models/favorite_character_model/favorite_character_model.dart';

abstract class FavoriteCharacterDataSource {
  List<FavoriteCharacterModel> getFavoriteCharacters();

  List<int> getFavoriteCharactersIds();

  void addCharacterToFavorites(FavoriteCharacterModel character);

  void removeCharacterFromFavorites(int id);

  void cleanFavoriteCharacters();
}
