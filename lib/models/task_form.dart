import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_form.freezed.dart';
part 'task_form.g.dart';

@freezed
abstract class TaskForm with _$TaskForm {
  const factory TaskForm({
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'done') @Default(false) bool done,
  }) = _TaskForm;
  factory TaskForm.fromJson(Map<String, dynamic> json) {
    return _$TaskFormFromJson(json);
  }

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
