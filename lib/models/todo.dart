import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  Todo(this.id, this.title);

  @JsonKey(required: true)
  final int id;
  @JsonKey(required: true)
  String title;
  String note = '';
  final DateTime authoredAt = DateTime.now();
  bool isCompleted = false;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$TodoToJson`.
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
