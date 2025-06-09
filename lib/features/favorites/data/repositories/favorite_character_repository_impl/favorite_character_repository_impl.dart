import 'package:injectable/injectable.dart';

import '../../../../main/domain/entities/character_entity/character_entity.dart';
import '../../../domain/repositories/favorite_character_repository/favorite_character_repository.dart';
import '../../data_sources/local/favorite_character_data_source/favorite_character_data_source.dart';
import '../../models/favorite_character_model/favorite_character_model.dart';

@Singleton(as: FavoriteCharacterRepository)
class FavoriteCharacterRepositoryImpl implements FavoriteCharacterRepository {
  const FavoriteCharacterRepositoryImpl(this._dataSource);

  final FavoriteCharacterDataSource _dataSource;

  @override
  List<CharacterEntity> getFavoriteCharacters() {
    final characters = _dataSource.getFavoriteCharacters();

    return characters.map((item) => item.toEntity()).toList();
  }

  @override
  List<int> getFavoriteCharactersIds() {
    return _dataSource.getFavoriteCharactersIds();
  }

  @override
  void addCharacterToFavorites(CharacterEntity character) {
    return _dataSource.addCharacterToFavorites(
      FavoriteCharacterModel.fromEntity(character),
    );
  }

  @override
  void removeCharacterFromFavorites(int id) {
    return _dataSource.removeCharacterFromFavorites(id);
  }

  @override
  void cleanFavoriteCharacters() {
    return _dataSource.cleanFavoriteCharacters();
  }
}
