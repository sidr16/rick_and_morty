import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/character_entity/character_entity.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String gender,
    required String image,
    required DateTime created,
    String? type,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
}

extension CharacterModelX on CharacterModel {
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
      type: type,
    );
  }
}
