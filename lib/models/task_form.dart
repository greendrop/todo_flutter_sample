import 'package:json_annotation/json_annotation.dart';

part 'task_form.g.dart';

@JsonSerializable()
class TaskForm {
  TaskForm();

  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'done', defaultValue: false)
  bool done;

  // ignore: sort_constructors_first
  factory TaskForm.fromJson(Map<String, dynamic> json) =>
      _$TaskFormFromJson(json);
  Map<String, dynamic> toJson() => _$TaskFormToJson(this);

  static String titleValidator(String value) {
    if (value.isEmpty) {
      return "Title can't be blank";
    }
    if (value.length > 255) {
      return 'Title is too long (maximum is 255 characters)';
    }
    return null;
  }

  static String descriptionValidator(String value) {
    return null;
  }
}
