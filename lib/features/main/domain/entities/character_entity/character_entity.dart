class CharacterEntity {
  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.created,
    this.type,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final DateTime created;
  final String? type;
}
