import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/pagination_bloc/pagination_extension.dart';
import '../../../../../core/widgets/list/character_list.dart';
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
            loading: () {
              return const CharacterList(
                showShimmer: true,
                characters: [],
              );
            },
            data: (data) {
              return CharacterList(
                characters: data,
                onItemBuildIndex: notifier.onLoadItemAtIndex,
              );
            },
            loadingWithData: (data) {
              return CharacterList(
                characters: data,
                showShimmer: true,
              );
            },
            error: (error) {
              return Text(error.toString());
            },
            errorWithData: (data, error) {
              return CharacterList(
                characters: data,
              );
            },
          );
        },
      ),
    );
  }
}
