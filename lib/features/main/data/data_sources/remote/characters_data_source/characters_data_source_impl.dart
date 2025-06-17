import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/bloc/pagination_bloc/pagination_result.dart';
import '../../../../../../core/utils/constants/endpoints.dart';
import '../../../models/character_model/character_model.dart';
import 'characters_data_source.dart';

@Singleton(as: CharactersDataSource)
class CharactersDataSourceImpl implements CharactersDataSource {
  CharactersDataSourceImpl(this._client);

  final Dio _client;

  @override
  Future<PaginationResult<CharacterModel>> fetchCharacters({
    required int page,
  }) async {
    try {
      final res = await _client.get<Map<String, dynamic>>(
        Endpoints.characters,
        queryParameters: {'page': page},
      );

      await Future.delayed(const Duration(seconds: 3), () {});

      return PaginationResult.fromJson(
        res.data!,
        CharacterModel.fromJson,
      );
    } catch (error) {
      rethrow;
    }
  }
}
