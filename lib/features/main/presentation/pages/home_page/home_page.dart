import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../../../core/widgets/cards/character_card.dart';
import '../../../domain/entities/character_entity/character_entity.dart';
import '../../bloc/characters_bloc/characters_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.read<CharactersBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty: Characters'),
      ),
      body: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          return state.when(
            loading: CircularProgressIndicator.new,
            data: (data) {
              return _BuildCharactersList(
                characters: data,
                onItemBuildIndex: notifier.onLoadItemAtIndex,
              );
            },
            loadingWithData: (data) {
              return _BuildCharactersList(
                characters: data,
              );
            },
            error: (error) {
              return Text(error.toString());
            },
            errorWithData: (data, error) {
              return _BuildCharactersList(
                characters: data,
              );
            },
          );
        },
      ),
    );
  }
}

class _BuildCharactersList extends StatelessWidget {
  const _BuildCharactersList({
    required this.characters,
    this.onItemBuildIndex,
  });

  final List<CharacterEntity> characters;
  final void Function(int index)? onItemBuildIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (_, index) {
        onItemBuildIndex?.call(index);

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
