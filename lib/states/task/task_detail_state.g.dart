// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDetailState _$_$_TaskDetailStateFromJson(Map<String, dynamic> json) {
  return _$_TaskDetailState(
    authToken: json['authToken'] == null
        ? null
        : OAuth2Token.fromJson(json['authToken'] as Map<String, dynamic>),
    authUser: json['authUser'] == null
        ? null
        : User.fromJson(json['authUser'] as Map<String, dynamic>),
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
      'authToken': instance.authToken,
      'authUser': instance.authUser,
      'task': instance.task,
      'isFetching': instance.isFetching,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
    };
