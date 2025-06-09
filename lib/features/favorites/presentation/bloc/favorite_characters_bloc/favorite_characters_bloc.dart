import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/add_character_to_favorites_use_case.dart';
import '../../../domain/use_cases/clean_favorite_characters_use_case.dart';
import '../../../domain/use_cases/get_favorite_characters_use_case.dart';
import '../../../domain/use_cases/remove_character_from_favorites_use_case.dart';
import 'favorite_characters_event.dart';
import 'favorite_characters_state.dart';

@injectable
class FavoriteCharactersBloc
    extends Bloc<FavoriteCharactersEvent, FavoriteCharactersState> {
  FavoriteCharactersBloc(
    this._getFavoriteCharactersUseCase,
    this._addCharacterToFavoritesUseCase,
    this._removeCharacterFromFavoritesUseCase,
    this._cleanFavoriteCharactersUseCase,
  ) : super(FavoriteCharactersInitialState()) {
    on<FavoriteCharactersGetEvent>(_onGetFavorites);
    on<FavoriteCharactersAddEvent>(_onAddFavorite);
    on<FavoriteCharactersRemoveEvent>(_onRemoveFavorite);
    on<FavoriteCharactersCleanEvent>(_onCleanFavorites);
  }

  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase;
  final AddCharacterToFavoritesUseCase _addCharacterToFavoritesUseCase;
  final RemoveCharacterFromFavoritesUseCase
  _removeCharacterFromFavoritesUseCase;
  final CleanFavoriteCharactersUseCase _cleanFavoriteCharactersUseCase;

  void getFavorites() {
    add(FavoriteCharactersGetEvent());
  }

  void _onGetFavorites(
    FavoriteCharactersGetEvent event,
    Emitter<FavoriteCharactersState> emit,
  ) {
    final favorites = _getFavoriteCharactersUseCase.execute();
    emit(FavoriteCharactersDataState(favorites));
  }

  void _onAddFavorite(
    FavoriteCharactersAddEvent event,
    Emitter<FavoriteCharactersState> emit,
  ) {
    _addCharacterToFavoritesUseCase.execute(event.character);
    final updated = _getFavoriteCharactersUseCase.execute();
    emit(FavoriteCharactersDataState(updated));
  }

  void _onRemoveFavorite(
    FavoriteCharactersRemoveEvent event,
    Emitter<FavoriteCharactersState> emit,
  ) {
    _removeCharacterFromFavoritesUseCase.execute(event.id);
    final updated = _getFavoriteCharactersUseCase.execute();
    emit(FavoriteCharactersDataState(updated));
  }

  void _onCleanFavorites(
    FavoriteCharactersCleanEvent event,
    Emitter<FavoriteCharactersState> emit,
  ) {
    _cleanFavoriteCharactersUseCase.execute();
    emit(FavoriteCharactersDataState(const []));
  }
}
