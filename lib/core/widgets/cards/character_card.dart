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

class _FavoriteButton extends StatefulWidget {
  const _FavoriteButton({required this.character});

  final CharacterEntity character;

  @override
  State<_FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<_FavoriteButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _animationTween;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.short4,
      value: 1,
    );

    _animationTween = Tween<double>(
      begin: 1.3,
      end: 1,
    ).animate(
      CurvedAnimation(
        curve: Curves.easeOut,
        parent: _animationController,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
                widget.character,
              );

              return Align(
                alignment: Alignment.bottomRight,
                child: ScaleTransition(
                  scale: _animationTween,
                  child: IconButton.filledTonal(
                    onPressed: () async {
                      if (isFavorite) {
                        notifier.add(
                          FavoriteCharactersRemoveEvent(
                            widget.character.id,
                          ),
                        );
                      } else {
                        notifier.add(
                          FavoriteCharactersAddEvent(widget.character),
                        );
                      }
                      await _animationController.reverse();
                      await _animationController.forward();
                    },
                    icon: ScaleTransition(
                      scale: _animationTween,
                      child: Icon(
                        isFavorite
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                      ),
                    ),
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
