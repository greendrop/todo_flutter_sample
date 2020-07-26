// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth2_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuth2Token _$OAuth2TokenFromJson(Map<String, dynamic> json) {
  return OAuth2Token()
    ..accessToken = json['access_token'] as String
    ..refreshToken = json['refresh_token'] as String
    ..createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String)
    ..expiresAt = json['expires_at'] == null
        ? null
        : DateTime.parse(json['expires_at'] as String);
}

Map<String, dynamic> _$OAuth2TokenToJson(OAuth2Token instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
    };
