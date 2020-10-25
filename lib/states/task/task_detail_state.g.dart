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
    isError: json['isError'] as bool ?? false,
    errorStatusCode: json['errorStatusCode'] as int ?? 0,
    errorBody: json['errorBody'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_TaskDetailStateToJson(_$_TaskDetailState instance) =>
    <String, dynamic>{
      'task': instance.task,
      'isFetching': instance.isFetching,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
    };
