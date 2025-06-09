import 'package:equatable/equatable.dart';

import '../../../../main/domain/entities/character_entity/character_entity.dart';

sealed class FavoriteCharactersState extends Equatable {}

class FavoriteCharactersInitialState extends FavoriteCharactersState {
  @override
  List<Object?> get props => [];
}

class FavoriteCharactersDataState extends FavoriteCharactersState {
  FavoriteCharactersDataState(this.characters);

  final List<CharacterEntity> characters;

  @override
  List<Object?> get props => [characters];
}
