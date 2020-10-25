// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_delete_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskDeleteState _$_$_TaskDeleteStateFromJson(Map<String, dynamic> json) {
  return _$_TaskDeleteState(
    isDeleting: json['isDeleting'] as bool ?? false,
    isError: json['isError'] as bool ?? false,
    errorStatusCode: json['errorStatusCode'] as int ?? 0,
    errorBody: json['errorBody'] as String ?? '',
  );
}

Map<String, dynamic> _$_$_TaskDeleteStateToJson(_$_TaskDeleteState instance) =>
    <String, dynamic>{
      'isDeleting': instance.isDeleting,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
    };
