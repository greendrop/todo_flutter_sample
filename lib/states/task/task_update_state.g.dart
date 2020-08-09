// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_update_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskUpdateState _$_$_TaskUpdateStateFromJson(Map<String, dynamic> json) {
  return _$_TaskUpdateState(
    authToken: json['authToken'] == null
        ? null
        : OAuth2Token.fromJson(json['authToken'] as Map<String, dynamic>),
    authUser: json['authUser'] == null
        ? null
        : User.fromJson(json['authUser'] as Map<String, dynamic>),
    isUpdating: json['isUpdating'] as bool ?? false,
    isError: json['isError'] as bool ?? false,
    errorStatusCode: json['errorStatusCode'] as int ?? 0,
    errorBody: json['errorBody'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_TaskUpdateStateToJson(_$_TaskUpdateState instance) =>
    <String, dynamic>{
      'authToken': instance.authToken,
      'authUser': instance.authUser,
      'isUpdating': instance.isUpdating,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
    };
