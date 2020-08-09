// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_delete_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskDeleteState _$TaskDeleteStateFromJson(Map<String, dynamic> json) {
  return _TaskDeleteState.fromJson(json);
}

class _$TaskDeleteStateTearOff {
  const _$TaskDeleteStateTearOff();

// ignore: unused_element
  _TaskDeleteState call(
      {OAuth2Token authToken,
      User authUser,
      bool isDeleting = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = ''}) {
    return _TaskDeleteState(
      authToken: authToken,
      authUser: authUser,
      isDeleting: isDeleting,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
    );
  }
}

// ignore: unused_element
const $TaskDeleteState = _$TaskDeleteStateTearOff();

mixin _$TaskDeleteState {
  OAuth2Token get authToken;
  User get authUser;
  bool get isDeleting;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;

  Map<String, dynamic> toJson();
  $TaskDeleteStateCopyWith<TaskDeleteState> get copyWith;
}

abstract class $TaskDeleteStateCopyWith<$Res> {
  factory $TaskDeleteStateCopyWith(
          TaskDeleteState value, $Res Function(TaskDeleteState) then) =
      _$TaskDeleteStateCopyWithImpl<$Res>;
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      bool isDeleting,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class _$TaskDeleteStateCopyWithImpl<$Res>
    implements $TaskDeleteStateCopyWith<$Res> {
  _$TaskDeleteStateCopyWithImpl(this._value, this._then);

  final TaskDeleteState _value;
  // ignore: unused_field
  final $Res Function(TaskDeleteState) _then;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object isDeleting = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_value.copyWith(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      isDeleting:
          isDeleting == freezed ? _value.isDeleting : isDeleting as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

abstract class _$TaskDeleteStateCopyWith<$Res>
    implements $TaskDeleteStateCopyWith<$Res> {
  factory _$TaskDeleteStateCopyWith(
          _TaskDeleteState value, $Res Function(_TaskDeleteState) then) =
      __$TaskDeleteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      bool isDeleting,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class __$TaskDeleteStateCopyWithImpl<$Res>
    extends _$TaskDeleteStateCopyWithImpl<$Res>
    implements _$TaskDeleteStateCopyWith<$Res> {
  __$TaskDeleteStateCopyWithImpl(
      _TaskDeleteState _value, $Res Function(_TaskDeleteState) _then)
      : super(_value, (v) => _then(v as _TaskDeleteState));

  @override
  _TaskDeleteState get _value => super._value as _TaskDeleteState;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object isDeleting = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_TaskDeleteState(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      isDeleting:
          isDeleting == freezed ? _value.isDeleting : isDeleting as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskDeleteState implements _TaskDeleteState {
  const _$_TaskDeleteState(
      {this.authToken,
      this.authUser,
      this.isDeleting = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = ''})
      : assert(isDeleting != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null);

  factory _$_TaskDeleteState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskDeleteStateFromJson(json);

  @override
  final OAuth2Token authToken;
  @override
  final User authUser;
  @JsonKey(defaultValue: false)
  @override
  final bool isDeleting;
  @JsonKey(defaultValue: false)
  @override
  final bool isError;
  @JsonKey(defaultValue: 0)
  @override
  final int errorStatusCode;
  @JsonKey(defaultValue: '')
  @override
  final String errorBody;

  @override
  String toString() {
    return 'TaskDeleteState(authToken: $authToken, authUser: $authUser, isDeleting: $isDeleting, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskDeleteState &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.authUser, authUser) ||
                const DeepCollectionEquality()
                    .equals(other.authUser, authUser)) &&
            (identical(other.isDeleting, isDeleting) ||
                const DeepCollectionEquality()
                    .equals(other.isDeleting, isDeleting)) &&
            (identical(other.isError, isError) ||
                const DeepCollectionEquality()
                    .equals(other.isError, isError)) &&
            (identical(other.errorStatusCode, errorStatusCode) ||
                const DeepCollectionEquality()
                    .equals(other.errorStatusCode, errorStatusCode)) &&
            (identical(other.errorBody, errorBody) ||
                const DeepCollectionEquality()
                    .equals(other.errorBody, errorBody)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(authToken) ^
      const DeepCollectionEquality().hash(authUser) ^
      const DeepCollectionEquality().hash(isDeleting) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody);

  @override
  _$TaskDeleteStateCopyWith<_TaskDeleteState> get copyWith =>
      __$TaskDeleteStateCopyWithImpl<_TaskDeleteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskDeleteStateToJson(this);
  }
}

abstract class _TaskDeleteState implements TaskDeleteState {
  const factory _TaskDeleteState(
      {OAuth2Token authToken,
      User authUser,
      bool isDeleting,
      bool isError,
      int errorStatusCode,
      String errorBody}) = _$_TaskDeleteState;

  factory _TaskDeleteState.fromJson(Map<String, dynamic> json) =
      _$_TaskDeleteState.fromJson;

  @override
  OAuth2Token get authToken;
  @override
  User get authUser;
  @override
  bool get isDeleting;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  _$TaskDeleteStateCopyWith<_TaskDeleteState> get copyWith;
}
