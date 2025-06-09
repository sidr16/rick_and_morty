import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../features/favorites/presentation/bloc/favorite_characters_bloc/favorite_characters_bloc.dart';
import '../../../features/favorites/presentation/bloc/favorite_characters_bloc/favorite_characters_event.dart';
import '../../../features/favorites/presentation/bloc/favorite_characters_bloc/favorite_characters_state.dart';
import '../../../features/main/domain/entities/character_entity/character_entity.dart';
import '../../utils/extensions/context_extension.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    super.key,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final type = character.type;

    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Banner(
                  message: character.status,
                  location: BannerLocation.topStart,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: character.image,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: context.textTheme.titleLarge,
                  ),
                  if (type != null) ...[
                    Text(
                      type,
                      style: context.textTheme.labelLarge,
                    ),
                    const Gap(12),
                  ],
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.colorScheme.surfaceBright,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Species: ${character.species}',
                          style: context.textTheme.bodyLarge,
                        ),
                        const Divider(),
                        Text(
                          'Gender: ${character.gender}',
                          style: context.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Gap(12),
                  ),
                  _FavoriteButton(
                    character: character,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({required this.character});

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<FavoriteCharactersBloc>();

    return BlocBuilder<FavoriteCharactersBloc, FavoriteCharactersState>(
      builder: (context, state) {
        return switch (state) {
          FavoriteCharactersInitialState() => const SizedBox(),
          final FavoriteCharactersDataState data => Builder(
            builder: (context) {
              final isFavorite = data.characters.contains(
                character,
              );

              return Align(
                alignment: Alignment.bottomRight,
                child: IconButton.filledTonal(
                  onPressed: () {
                    if (isFavorite) {
                      notifier.add(
                        FavoriteCharactersRemoveEvent(
                          character.id,
                        ),
                      );
                    } else {
                      notifier.add(
                        FavoriteCharactersAddEvent(character),
                      );
                    }
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                  ),
                ),
              );
            },
          ),
        };
      },
    );
  }
}
