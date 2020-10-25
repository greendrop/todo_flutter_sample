// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'oauth2_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
OAuth2Token _$OAuth2TokenFromJson(Map<String, dynamic> json) {
  return _OAuth2Token.fromJson(json);
}

class _$OAuth2TokenTearOff {
  const _$OAuth2TokenTearOff();

// ignore: unused_element
  _OAuth2Token call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt}) {
    return _OAuth2Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      createdAt: createdAt,
      expiresAt: expiresAt,
    );
  }
}

// ignore: unused_element
const $OAuth2Token = _$OAuth2TokenTearOff();

mixin _$OAuth2Token {
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;

  Map<String, dynamic> toJson();
  $OAuth2TokenCopyWith<OAuth2Token> get copyWith;
}

abstract class $OAuth2TokenCopyWith<$Res> {
  factory $OAuth2TokenCopyWith(
          OAuth2Token value, $Res Function(OAuth2Token) then) =
      _$OAuth2TokenCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt});
}

class _$OAuth2TokenCopyWithImpl<$Res> implements $OAuth2TokenCopyWith<$Res> {
  _$OAuth2TokenCopyWithImpl(this._value, this._then);

  final OAuth2Token _value;
  // ignore: unused_field
  final $Res Function(OAuth2Token) _then;

  @override
  $Res call({
    Object accessToken = freezed,
    Object refreshToken = freezed,
    Object createdAt = freezed,
    Object expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      expiresAt:
          expiresAt == freezed ? _value.expiresAt : expiresAt as DateTime,
    ));
  }
}

abstract class _$OAuth2TokenCopyWith<$Res>
    implements $OAuth2TokenCopyWith<$Res> {
  factory _$OAuth2TokenCopyWith(
          _OAuth2Token value, $Res Function(_OAuth2Token) then) =
      __$OAuth2TokenCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt});
}

class __$OAuth2TokenCopyWithImpl<$Res> extends _$OAuth2TokenCopyWithImpl<$Res>
    implements _$OAuth2TokenCopyWith<$Res> {
  __$OAuth2TokenCopyWithImpl(
      _OAuth2Token _value, $Res Function(_OAuth2Token) _then)
      : super(_value, (v) => _then(v as _OAuth2Token));

  @override
  _OAuth2Token get _value => super._value as _OAuth2Token;

  @override
  $Res call({
    Object accessToken = freezed,
    Object refreshToken = freezed,
    Object createdAt = freezed,
    Object expiresAt = freezed,
  }) {
    return _then(_OAuth2Token(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as String,
      refreshToken: refreshToken == freezed
          ? _value.refreshToken
          : refreshToken as String,
      createdAt:
          createdAt == freezed ? _value.createdAt : createdAt as DateTime,
      expiresAt:
          expiresAt == freezed ? _value.expiresAt : expiresAt as DateTime,
    ));
  }
}

@JsonSerializable()
class _$_OAuth2Token extends _OAuth2Token {
  const _$_OAuth2Token(
      {@JsonKey(name: 'access_token') this.accessToken,
      @JsonKey(name: 'refresh_token') this.refreshToken,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'expires_at') this.expiresAt})
      : super._();

  factory _$_OAuth2Token.fromJson(Map<String, dynamic> json) =>
      _$_$_OAuth2TokenFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;

  @override
  String toString() {
    return 'OAuth2Token(accessToken: $accessToken, refreshToken: $refreshToken, createdAt: $createdAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OAuth2Token &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.refreshToken, refreshToken) ||
                const DeepCollectionEquality()
                    .equals(other.refreshToken, refreshToken)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.expiresAt, expiresAt) ||
                const DeepCollectionEquality()
                    .equals(other.expiresAt, expiresAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(refreshToken) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(expiresAt);

  @override
  _$OAuth2TokenCopyWith<_OAuth2Token> get copyWith =>
      __$OAuth2TokenCopyWithImpl<_OAuth2Token>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OAuth2TokenToJson(this);
  }
}

abstract class _OAuth2Token extends OAuth2Token {
  const _OAuth2Token._() : super._();
  const factory _OAuth2Token(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'expires_at') DateTime expiresAt}) = _$_OAuth2Token;

  factory _OAuth2Token.fromJson(Map<String, dynamic> json) =
      _$_OAuth2Token.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  _$OAuth2TokenCopyWith<_OAuth2Token> get copyWith;
}
