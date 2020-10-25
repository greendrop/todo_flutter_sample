import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'done') @Default(false) bool done,
    @JsonKey(name: 'created_at') DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime updatedAt,
  }) = _Task;
  factory Task.fromJson(Map<String, dynamic> json) {
    return _$TaskFromJson(json);
  }
}
