import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  const CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    this.type,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final String? type;

  @override
  List<Object?> get props => [id, name, status, species, gender, image, type];
}
