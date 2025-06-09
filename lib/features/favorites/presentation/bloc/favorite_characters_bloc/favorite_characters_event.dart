import 'package:equatable/equatable.dart';

import '../../../../main/domain/entities/character_entity/character_entity.dart';

sealed class FavoriteCharactersEvent extends Equatable {}

class FavoriteCharactersGetEvent extends FavoriteCharactersEvent {
  @override
  List<Object?> get props => [];
}

class FavoriteCharactersAddEvent extends FavoriteCharactersEvent {
  FavoriteCharactersAddEvent(this.character);

  final CharacterEntity character;

  @override
  List<Object?> get props => [character];
}

class FavoriteCharactersRemoveEvent extends FavoriteCharactersEvent {
  FavoriteCharactersRemoveEvent(this.id);

  final int id;

  @override
  List<Object?> get props => [id];
}

class FavoriteCharactersCleanEvent extends FavoriteCharactersEvent {
  @override
  List<Object?> get props => [];
}
