import '../../../../main/domain/entities/character_entity/character_entity.dart';

abstract class FavoriteCharacterRepository {
  List<CharacterEntity> getFavoriteCharacters();

  List<int> getFavoriteCharactersIds();

  void addCharacterToFavorites(CharacterEntity character);

  void removeCharacterFromFavorites(int id);

  void cleanFavoriteCharacters();
}
