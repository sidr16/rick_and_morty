import 'package:hive/hive.dart';

import '../../../../main/domain/entities/character_entity/character_entity.dart';

part 'favorite_character_model.g.dart';

@HiveType(typeId: 0)
class FavoriteCharacterModel extends HiveObject {
  FavoriteCharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.type,
  });

  factory FavoriteCharacterModel.fromEntity(CharacterEntity entity) {
    return FavoriteCharacterModel(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      gender: entity.gender,
      image: entity.image,
      type: entity.type,
    );
  }

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String image;

  @HiveField(6)
  final String? type;

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
