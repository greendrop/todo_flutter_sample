// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_create_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskCreateState _$TaskCreateStateFromJson(Map<String, dynamic> json) {
  return _TaskCreateState.fromJson(json);
}

class _$TaskCreateStateTearOff {
  const _$TaskCreateStateTearOff();

// ignore: unused_element
  _TaskCreateState call(
      {bool isCreating = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = ''}) {
    return _TaskCreateState(
      isCreating: isCreating,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
    );
  }
}

// ignore: unused_element
const $TaskCreateState = _$TaskCreateStateTearOff();

mixin _$TaskCreateState {
  bool get isCreating;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;

  Map<String, dynamic> toJson();
  $TaskCreateStateCopyWith<TaskCreateState> get copyWith;
}

abstract class $TaskCreateStateCopyWith<$Res> {
  factory $TaskCreateStateCopyWith(
          TaskCreateState value, $Res Function(TaskCreateState) then) =
      _$TaskCreateStateCopyWithImpl<$Res>;
  $Res call(
      {bool isCreating, bool isError, int errorStatusCode, String errorBody});
}

class _$TaskCreateStateCopyWithImpl<$Res>
    implements $TaskCreateStateCopyWith<$Res> {
  _$TaskCreateStateCopyWithImpl(this._value, this._then);

  final TaskCreateState _value;
  // ignore: unused_field
  final $Res Function(TaskCreateState) _then;

  @override
  $Res call({
    Object isCreating = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_value.copyWith(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

abstract class _$TaskCreateStateCopyWith<$Res>
    implements $TaskCreateStateCopyWith<$Res> {
  factory _$TaskCreateStateCopyWith(
          _TaskCreateState value, $Res Function(_TaskCreateState) then) =
      __$TaskCreateStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isCreating, bool isError, int errorStatusCode, String errorBody});
}

class __$TaskCreateStateCopyWithImpl<$Res>
    extends _$TaskCreateStateCopyWithImpl<$Res>
    implements _$TaskCreateStateCopyWith<$Res> {
  __$TaskCreateStateCopyWithImpl(
      _TaskCreateState _value, $Res Function(_TaskCreateState) _then)
      : super(_value, (v) => _then(v as _TaskCreateState));

  @override
  _TaskCreateState get _value => super._value as _TaskCreateState;

  @override
  $Res call({
    Object isCreating = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_TaskCreateState(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskCreateState implements _TaskCreateState {
  const _$_TaskCreateState(
      {this.isCreating = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = ''})
      : assert(isCreating != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null);

  factory _$_TaskCreateState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskCreateStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isCreating;
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
    return 'TaskCreateState(isCreating: $isCreating, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskCreateState &&
            (identical(other.isCreating, isCreating) ||
                const DeepCollectionEquality()
                    .equals(other.isCreating, isCreating)) &&
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
      const DeepCollectionEquality().hash(isCreating) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody);

  @override
  _$TaskCreateStateCopyWith<_TaskCreateState> get copyWith =>
      __$TaskCreateStateCopyWithImpl<_TaskCreateState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskCreateStateToJson(this);
  }
}

abstract class _TaskCreateState implements TaskCreateState {
  const factory _TaskCreateState(
      {bool isCreating,
      bool isError,
      int errorStatusCode,
      String errorBody}) = _$_TaskCreateState;

  factory _TaskCreateState.fromJson(Map<String, dynamic> json) =
      _$_TaskCreateState.fromJson;

  @override
  bool get isCreating;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  _$TaskCreateStateCopyWith<_TaskCreateState> get copyWith;
}
