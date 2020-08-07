// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthState _$_$_AuthStateFromJson(Map<String, dynamic> json) {
  return _$_AuthState(
    token: json['token'] == null
        ? null
        : OAuth2Token.fromJson(json['token'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    isFetching: json['isFetching'] as bool ?? false,
    isUnauthorized: json['isUnauthorized'] as bool ?? false,
    isError: json['isError'] as bool ?? false,
    errorStatusCode: json['errorStatusCode'] as int ?? 0,
    errorBody: json['errorBody'] as String ?? '',
    isRefreshFetching: json['isRefreshFetching'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_AuthStateToJson(_$_AuthState instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'isFetching': instance.isFetching,
      'isUnauthorized': instance.isUnauthorized,
      'isError': instance.isError,
      'errorStatusCode': instance.errorStatusCode,
      'errorBody': instance.errorBody,
      'isRefreshFetching': instance.isRefreshFetching,
    };
