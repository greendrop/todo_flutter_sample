// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_update_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskUpdateState _$TaskUpdateStateFromJson(Map<String, dynamic> json) {
  return _TaskUpdateState.fromJson(json);
}

class _$TaskUpdateStateTearOff {
  const _$TaskUpdateStateTearOff();

// ignore: unused_element
  _TaskUpdateState call(
      {OAuth2Token authToken,
      User authUser,
      bool isUpdating = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = ''}) {
    return _TaskUpdateState(
      authToken: authToken,
      authUser: authUser,
      isUpdating: isUpdating,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
    );
  }
}

// ignore: unused_element
const $TaskUpdateState = _$TaskUpdateStateTearOff();

mixin _$TaskUpdateState {
  OAuth2Token get authToken;
  User get authUser;
  bool get isUpdating;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;

  Map<String, dynamic> toJson();
  $TaskUpdateStateCopyWith<TaskUpdateState> get copyWith;
}

abstract class $TaskUpdateStateCopyWith<$Res> {
  factory $TaskUpdateStateCopyWith(
          TaskUpdateState value, $Res Function(TaskUpdateState) then) =
      _$TaskUpdateStateCopyWithImpl<$Res>;
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      bool isUpdating,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class _$TaskUpdateStateCopyWithImpl<$Res>
    implements $TaskUpdateStateCopyWith<$Res> {
  _$TaskUpdateStateCopyWithImpl(this._value, this._then);

  final TaskUpdateState _value;
  // ignore: unused_field
  final $Res Function(TaskUpdateState) _then;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object isUpdating = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_value.copyWith(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      isUpdating:
          isUpdating == freezed ? _value.isUpdating : isUpdating as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

abstract class _$TaskUpdateStateCopyWith<$Res>
    implements $TaskUpdateStateCopyWith<$Res> {
  factory _$TaskUpdateStateCopyWith(
          _TaskUpdateState value, $Res Function(_TaskUpdateState) then) =
      __$TaskUpdateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {OAuth2Token authToken,
      User authUser,
      bool isUpdating,
      bool isError,
      int errorStatusCode,
      String errorBody});
}

class __$TaskUpdateStateCopyWithImpl<$Res>
    extends _$TaskUpdateStateCopyWithImpl<$Res>
    implements _$TaskUpdateStateCopyWith<$Res> {
  __$TaskUpdateStateCopyWithImpl(
      _TaskUpdateState _value, $Res Function(_TaskUpdateState) _then)
      : super(_value, (v) => _then(v as _TaskUpdateState));

  @override
  _TaskUpdateState get _value => super._value as _TaskUpdateState;

  @override
  $Res call({
    Object authToken = freezed,
    Object authUser = freezed,
    Object isUpdating = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_TaskUpdateState(
      authToken:
          authToken == freezed ? _value.authToken : authToken as OAuth2Token,
      authUser: authUser == freezed ? _value.authUser : authUser as User,
      isUpdating:
          isUpdating == freezed ? _value.isUpdating : isUpdating as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskUpdateState implements _TaskUpdateState {
  const _$_TaskUpdateState(
      {this.authToken,
      this.authUser,
      this.isUpdating = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = ''})
      : assert(isUpdating != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null);

  factory _$_TaskUpdateState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskUpdateStateFromJson(json);

  @override
  final OAuth2Token authToken;
  @override
  final User authUser;
  @JsonKey(defaultValue: false)
  @override
  final bool isUpdating;
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
    return 'TaskUpdateState(authToken: $authToken, authUser: $authUser, isUpdating: $isUpdating, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskUpdateState &&
            (identical(other.authToken, authToken) ||
                const DeepCollectionEquality()
                    .equals(other.authToken, authToken)) &&
            (identical(other.authUser, authUser) ||
                const DeepCollectionEquality()
                    .equals(other.authUser, authUser)) &&
            (identical(other.isUpdating, isUpdating) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdating, isUpdating)) &&
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
      const DeepCollectionEquality().hash(isUpdating) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody);

  @override
  _$TaskUpdateStateCopyWith<_TaskUpdateState> get copyWith =>
      __$TaskUpdateStateCopyWithImpl<_TaskUpdateState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskUpdateStateToJson(this);
  }
}

abstract class _TaskUpdateState implements TaskUpdateState {
  const factory _TaskUpdateState(
      {OAuth2Token authToken,
      User authUser,
      bool isUpdating,
      bool isError,
      int errorStatusCode,
      String errorBody}) = _$_TaskUpdateState;

  factory _TaskUpdateState.fromJson(Map<String, dynamic> json) =
      _$_TaskUpdateState.fromJson;

  @override
  OAuth2Token get authToken;
  @override
  User get authUser;
  @override
  bool get isUpdating;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  _$TaskUpdateStateCopyWith<_TaskUpdateState> get copyWith;
}
