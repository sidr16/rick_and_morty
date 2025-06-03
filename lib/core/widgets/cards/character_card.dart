import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton.filledTonal(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.star_outline_rounded,
                      ),
                    ),
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
