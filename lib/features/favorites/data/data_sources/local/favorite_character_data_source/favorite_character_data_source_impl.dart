import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../models/favorite_character_model/favorite_character_model.dart';
import 'favorite_character_data_source.dart';

@Singleton(as: FavoriteCharacterDataSource)
class FavoriteCharacterDataSourceImpl implements FavoriteCharacterDataSource {
  const FavoriteCharacterDataSourceImpl(this._favoritesBox);

  final Box<FavoriteCharacterModel> _favoritesBox;

  @override
  List<FavoriteCharacterModel> getFavoriteCharacters() {
    return _favoritesBox.values.toList();
  }

  @override
  List<int> getFavoriteCharactersIds() {
    return _favoritesBox.values.map((e) => e.id).toList();
  }

  @override
  void addCharacterToFavorites(FavoriteCharacterModel character) {
    _favoritesBox.put(character.id, character);
  }

  @override
  void removeCharacterFromFavorites(int id) {
    _favoritesBox.delete(id);
  }

  @override
  void cleanFavoriteCharacters() {
    _favoritesBox.clear();
  }
}
