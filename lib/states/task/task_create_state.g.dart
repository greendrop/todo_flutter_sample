// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_create_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskCreateState _$_$_TaskCreateStateFromJson(Map<String, dynamic> json) {
  return _$_TaskCreateState(
    authToken: json['authToken'] == null
        ? null
        : OAuth2Token.fromJson(json['authToken'] as Map<String, dynamic>),
    authUser: json['authUser'] == null
        ? null
        : User.fromJson(json['authUser'] as Map<String, dynamic>),
    isCreating: json['isCreating'] as bool ?? false,
    isError: json['isError'] as bool ?? false,
    errorStatusCode: json['errorStatusCode'] as int ?? 0,
    errorBody: json['errorBody'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_TaskCreateStateToJson(_$_TaskCreateState instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'authUser': instance.authUser,
      'isCreating': instance.isCreating,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
    };