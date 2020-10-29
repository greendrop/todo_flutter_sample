// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDetailState _$_$_TaskDetailStateFromJson(Map<String, dynamic> json) {
  return _$_TaskDetailState(
    task: json['task'] == null
        ? null
        : Task.fromJson(json['task'] as Map<String, dynamic>),
    isFetching: json['isFetching'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_TaskDetailStateToJson(_$_TaskDetailState instance) =>
    <String, dynamic>{
      'task': instance.task,
      'isFetching': instance.isFetching,
    };
