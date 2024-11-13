// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'title'],
  );
  return Todo(
    (json['id'] as num).toInt(),
    json['title'] as String,
  )
    ..note = json['note'] as String
    ..isCompleted = json['isCompleted'] as bool;
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'isCompleted': instance.isCompleted,
    };
