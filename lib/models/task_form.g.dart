// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskForm _$TaskFormFromJson(Map<String, dynamic> json) {
  return TaskForm()
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..done = json['done'] as bool ?? false;
}

Map<String, dynamic> _$TaskFormToJson(TaskForm instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'done': instance.done,
    };
