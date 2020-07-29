import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  Task();

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'done', defaultValue: false)
  bool done;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  // ignore: sort_constructors_first
  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
