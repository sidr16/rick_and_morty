import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/pagination_bloc/pagination_bloc.dart';
import '../../../../../core/bloc/pagination_bloc/pagination_state.dart';
import '../../../domain/entities/character_entity/character_entity.dart';
import '../../../domain/use_cases/get_characters_use_case.dart';

typedef CharactersState = PaginationState<CharacterEntity>;

@injectable
class CharactersBloc extends PaginationBloc<CharacterEntity, dynamic> {
  CharactersBloc(
    GetCharactersUseCase getNews,
  ) : super(
        onFetchData: (page, pageSize, args) {
          return getNews.fetch(
            page: page,
          );
        },
      );
}
