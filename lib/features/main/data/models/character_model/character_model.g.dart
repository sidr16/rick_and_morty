// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterModelImpl _$$CharacterModelImplFromJson(Map<String, dynamic> json) =>
    _$CharacterModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      created: DateTime.parse(json['created'] as String),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$CharacterModelImplToJson(
  _$CharacterModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'species': instance.species,
  'gender': instance.gender,
  'image': instance.image,
  'created': instance.created.toIso8601String(),
  'type': instance.type,
};
