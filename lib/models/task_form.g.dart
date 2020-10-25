// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskForm _$_$_TaskFormFromJson(Map<String, dynamic> json) {
  return _$_TaskForm(
    title: json['title'] as String,
    description: json['description'] as String,
    done: json['done'] as bool,
  );
}

Map<String, dynamic> _$_$_TaskFormToJson(_$_TaskForm instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'done': instance.done,
    };
