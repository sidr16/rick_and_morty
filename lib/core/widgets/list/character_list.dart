import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../features/main/domain/entities/character_entity/character_entity.dart';
import '../cards/character_card.dart';
import '../shimmer/character_card_shimmer.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({
    required this.characters,
    this.onItemBuildIndex,
    this.showShimmer = false,
    super.key,
  });

  final bool showShimmer;
  final List<CharacterEntity> characters;
  final void Function(int index)? onItemBuildIndex;

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final _listKey = GlobalKey<SliverAnimatedListState>();

  @override
  void didUpdateWidget(covariant CharacterList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldCharactersLength = oldWidget.characters.length;
    final newCharactersLength = widget.characters.length;

    if (oldCharactersLength < newCharactersLength) {
      _listKey.currentState?.insertAllItems(
        oldCharactersLength,
        newCharactersLength - oldCharactersLength,
        duration: Duration.zero,
      );
    }

    if (newCharactersLength < oldCharactersLength) {
      final oldCharacters = oldWidget.characters.toList();
      final characters =
          oldCharacters..removeWhere(
            (element) => widget.characters.contains(element),
          );

      for (final item in characters) {
        final index = oldWidget.characters.indexOf(item);
        _listKey.currentState?.removeItem(
          index,
          (_, animation) => _buildItem(
            animation,
            oldWidget.characters[index],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const listPadding = EdgeInsets.symmetric(horizontal: 16);

    return CustomScrollView(
      slivers: [
        const SliverGap(16),
        SliverPadding(
          padding: listPadding,
          sliver: SliverAnimatedList(
            key: _listKey,
            itemBuilder: (_, index, animation) {
              widget.onItemBuildIndex?.call(index);

              return _buildItem(animation, widget.characters[index]);
            },

            initialItemCount: widget.characters.length,
          ),
        ),
        if (widget.characters.isNotEmpty) const SliverGap(16),
        if (widget.showShimmer) ...[
          SliverPadding(
            padding: listPadding,
            sliver: SliverList.separated(
              itemBuilder: (_, index) {
                return const CharacterCardShimmer();
              },
              separatorBuilder: (_, _) {
                return const Gap(16);
              },
              itemCount: 15,
            ),
          ),
          const SliverGap(16),
        ],
      ],
    );
  }

  Widget _buildItem(
    Animation<double> animation,
    CharacterEntity character,
  ) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CharacterCard(
            character: character,
          ),
        ),
      ),
    );
  }
}
