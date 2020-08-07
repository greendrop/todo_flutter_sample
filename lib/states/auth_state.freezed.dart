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
      bool isUnauthorized = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = '',
      bool isRefreshFetching = false}) {
    return _AuthState(
      token: token,
      user: user,
      isFetching: isFetching,
      isUnauthorized: isUnauthorized,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
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
  bool get isUnauthorized;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;
  bool get isRefreshFetching;

  Map<String, dynamic> toJson();
  $AuthStateCopyWith<AuthState> get copyWith;
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {OAuth2Token token,
      User user,
      bool isFetching,
      bool isUnauthorized,
      bool isError,
      int errorStatusCode,
      String errorBody,
      bool isRefreshFetching});
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
    Object isUnauthorized = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
    Object isRefreshFetching = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as OAuth2Token,
      user: user == freezed ? _value.user : user as User,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isUnauthorized: isUnauthorized == freezed
          ? _value.isUnauthorized
          : isUnauthorized as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
      isRefreshFetching: isRefreshFetching == freezed
          ? _value.isRefreshFetching
          : isRefreshFetching as bool,
    ));
  }
}

abstract class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(
          _AuthState value, $Res Function(_AuthState) then) =
      __$AuthStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuth2Token token,
      User user,
      bool isFetching,
      bool isUnauthorized,
      bool isError,
      int errorStatusCode,
      String errorBody,
      bool isRefreshFetching});
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
    Object isUnauthorized = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
    Object isRefreshFetching = freezed,
  }) {
    return _then(_AuthState(
      token: token == freezed ? _value.token : token as OAuth2Token,
      user: user == freezed ? _value.user : user as User,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isUnauthorized: isUnauthorized == freezed
          ? _value.isUnauthorized
          : isUnauthorized as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
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
      this.isUnauthorized = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = '',
      this.isRefreshFetching = false})
      : assert(isFetching != null),
        assert(isUnauthorized != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null),
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
  final bool isUnauthorized;
  @JsonKey(defaultValue: false)
  @override
  final bool isError;
  @JsonKey(defaultValue: 0)
  @override
  final int errorStatusCode;
  @JsonKey(defaultValue: '')
  @override
  final String errorBody;
  @JsonKey(defaultValue: false)
  @override
  final bool isRefreshFetching;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(token: $token, user: $user, isFetching: $isFetching, isUnauthorized: $isUnauthorized, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody, isRefreshFetching: $isRefreshFetching)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('isFetching', isFetching))
      ..add(DiagnosticsProperty('isUnauthorized', isUnauthorized))
      ..add(DiagnosticsProperty('isError', isError))
      ..add(DiagnosticsProperty('errorStatusCode', errorStatusCode))
      ..add(DiagnosticsProperty('errorBody', errorBody))
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
            (identical(other.isUnauthorized, isUnauthorized) ||
                const DeepCollectionEquality()
                    .equals(other.isUnauthorized, isUnauthorized)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality()
                    .equals(other.isError, isError)) &&
            (identical(other.errorStatusCode, errorStatusCode) ||
                const DeepCollectionEquality()
                    .equals(other.errorStatusCode, errorStatusCode)) &&
            (identical(other.errorBody, errorBody) ||
                const DeepCollectionEquality()
                    .equals(other.errorBody, errorBody)) &&
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
      const DeepCollectionEquality().hash(isUnauthorized) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody) ^
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
      bool isUnauthorized,
      bool isError,
      int errorStatusCode,
      String errorBody,
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
  bool get isUnauthorized;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  bool get isRefreshFetching;
  @override
  _$AuthStateCopyWith<_AuthState> get copyWith;
}
