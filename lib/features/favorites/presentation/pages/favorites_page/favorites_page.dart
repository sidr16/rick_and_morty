import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/widgets/cards/character_card.dart';
import '../../../../main/domain/entities/character_entity/character_entity.dart';
import '../../bloc/favorite_characters_bloc/favorite_characters_bloc.dart';
import '../../bloc/favorite_characters_bloc/favorite_characters_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteCharactersBloc, FavoriteCharactersState>(
        builder: (context, state) {
          return switch (state) {
            FavoriteCharactersInitialState() => const Center(
              child: CircularProgressIndicator(),
            ),
            final FavoriteCharactersDataState state => _BuildCharactersList(
              characters: state.characters,
            ),
          };
        },
      ),
    );
  }
}

class _BuildCharactersList extends StatelessWidget {
  const _BuildCharactersList({
    required this.characters,
  });

  final List<CharacterEntity> characters;

  @override
  Widget build(BuildContext context) {
    if (characters.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.star_border_rounded,
              size: 50,
            ),
            const Gap(8),
            Text(
              'No Favorite characters',
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (_, index) {
        return CharacterCard(
          character: characters[index],
        );
      },
      separatorBuilder: (_, _) {
        return const Gap(16);
      },
      itemCount: characters.length,
    );
  }
}
