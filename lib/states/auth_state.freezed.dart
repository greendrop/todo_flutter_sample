// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return _AuthState.fromJson(json);
}

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  _AuthState call(
      {OAuth2Token token,
      User user,
      bool isFetching = false,
      bool isRefreshFetching = false}) {
    return _AuthState(
      token: token,
      user: user,
      isFetching: isFetching,
      isRefreshFetching: isRefreshFetching,
    );
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  OAuth2Token get token;
  User get user;
  bool get isFetching;
  bool get isRefreshFetching;

  Map<String, dynamic> toJson();
  $AuthStateCopyWith<AuthState> get copyWith;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {OAuth2Token token, User user, bool isFetching, bool isRefreshFetching});

  $OAuth2TokenCopyWith<$Res> get token;
  $UserCopyWith<$Res> get user;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object token = freezed,
    Object user = freezed,
    Object isFetching = freezed,
    Object isRefreshFetching = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as OAuth2Token,
      user: user == freezed ? _value.user : user as User,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isRefreshFetching: isRefreshFetching == freezed
          ? _value.isRefreshFetching
          : isRefreshFetching as bool,
    ));
  }

  @override
  $OAuth2TokenCopyWith<$Res> get token {
    if (_value.token == null) {
      return null;
    }
    return $OAuth2TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value));
    });
  }

  @override
  $UserCopyWith<$Res> get user {
    if (_value.user == null) {
      return null;
    }
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuth2Token token, User user, bool isFetching, bool isRefreshFetching});

  @override
  $OAuth2TokenCopyWith<$Res> get token;
  @override
  $UserCopyWith<$Res> get user;
}

class __$AuthStateCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(_AuthState _value, $Res Function(_AuthState) _then)
      : super(_value, (v) => _then(v as _AuthState));

  @override
  _AuthState get _value => super._value as _AuthState;

  @override
  $Res call({
    Object token = freezed,
    Object user = freezed,
    Object isFetching = freezed,
    Object isRefreshFetching = freezed,
  }) {
    return _then(_AuthState(
      token: token == freezed ? _value.token : token as OAuth2Token,
      user: user == freezed ? _value.user : user as User,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isRefreshFetching: isRefreshFetching == freezed
          ? _value.isRefreshFetching
          : isRefreshFetching as bool,
    ));
  }
}

@JsonSerializable()
class _$_AuthState with DiagnosticableTreeMixin implements _AuthState {
  const _$_AuthState(
      {this.token,
      this.user,
      this.isFetching = false,
      this.isRefreshFetching = false})
      : assert(isFetching != null),
        assert(isRefreshFetching != null);

  factory _$_AuthState.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthStateFromJson(json);

  @override
  final OAuth2Token token;
  @override
  final User user;
  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
  @JsonKey(defaultValue: false)
  @override
  final bool isRefreshFetching;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(token: $token, user: $user, isFetching: $isFetching, isRefreshFetching: $isRefreshFetching)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('isRefreshFetching', isRefreshFetching));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthState &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)) &&
            (identical(other.isRefreshFetching, isRefreshFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isRefreshFetching, isRefreshFetching)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(isFetching) ^
      const DeepCollectionEquality().hash(isRefreshFetching);

  @override
  _$AuthStateCopyWith<_AuthState> get copyWith =>
      __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthStateToJson(this);
  }
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {OAuth2Token token,
      User user,
      bool isFetching,
      bool isRefreshFetching}) = _$_AuthState;

  factory _AuthState.fromJson(Map<String, dynamic> json) =
      _$_AuthState.fromJson;

  @override
  OAuth2Token get token;
  @override
  User get user;
  @override
  bool get isFetching;
  @override
  bool get isRefreshFetching;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
