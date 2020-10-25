// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskDetailState _$TaskDetailStateFromJson(Map<String, dynamic> json) {
  return _TaskDetailState.fromJson(json);
}

class _$TaskDetailStateTearOff {
  const _$TaskDetailStateTearOff();

// ignore: unused_element
  _TaskDetailState call(
      {Task task,
      bool isFetching = false,
      bool isError = false,
      int errorStatusCode = 0,
      String errorBody = ''}) {
    return _TaskDetailState(
      task: task,
      isFetching: isFetching,
      isError: isError,
      errorStatusCode: errorStatusCode,
      errorBody: errorBody,
    );
  }
}

// ignore: unused_element
const $TaskDetailState = _$TaskDetailStateTearOff();

mixin _$TaskDetailState {
  Task get task;
  bool get isFetching;
  bool get isError;
  int get errorStatusCode;
  String get errorBody;

  Map<String, dynamic> toJson();
  $TaskDetailStateCopyWith<TaskDetailState> get copyWith;
}

abstract class $TaskDetailStateCopyWith<$Res> {
  factory $TaskDetailStateCopyWith(
          TaskDetailState value, $Res Function(TaskDetailState) then) =
      _$TaskDetailStateCopyWithImpl<$Res>;
  $Res call(
      {Task task,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody});

  $TaskCopyWith<$Res> get task;
}

class _$TaskDetailStateCopyWithImpl<$Res>
    implements $TaskDetailStateCopyWith<$Res> {
  _$TaskDetailStateCopyWithImpl(this._value, this._then);

  final TaskDetailState _value;
  // ignore: unused_field
  final $Res Function(TaskDetailState) _then;

  @override
  $Res call({
    Object task = freezed,
    Object isFetching = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_value.copyWith(
      task: task == freezed ? _value.task : task as Task,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }

  @override
  $TaskCopyWith<$Res> get task {
    if (_value.task == null) {
      return null;
    }
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

abstract class _$TaskDetailStateCopyWith<$Res>
    implements $TaskDetailStateCopyWith<$Res> {
  factory _$TaskDetailStateCopyWith(
          _TaskDetailState value, $Res Function(_TaskDetailState) then) =
      __$TaskDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Task task,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody});

  @override
  $TaskCopyWith<$Res> get task;
}

class __$TaskDetailStateCopyWithImpl<$Res>
    extends _$TaskDetailStateCopyWithImpl<$Res>
    implements _$TaskDetailStateCopyWith<$Res> {
  __$TaskDetailStateCopyWithImpl(
      _TaskDetailState _value, $Res Function(_TaskDetailState) _then)
      : super(_value, (v) => _then(v as _TaskDetailState));

  @override
  _TaskDetailState get _value => super._value as _TaskDetailState;

  @override
  $Res call({
    Object task = freezed,
    Object isFetching = freezed,
    Object isError = freezed,
    Object errorStatusCode = freezed,
    Object errorBody = freezed,
  }) {
    return _then(_TaskDetailState(
      task: task == freezed ? _value.task : task as Task,
      isFetching:
          isFetching == freezed ? _value.isFetching : isFetching as bool,
      isError: isError == freezed ? _value.isError : isError as bool,
      errorStatusCode: errorStatusCode == freezed
          ? _value.errorStatusCode
          : errorStatusCode as int,
      errorBody: errorBody == freezed ? _value.errorBody : errorBody as String,
    ));
  }
}

@JsonSerializable()
class _$_TaskDetailState implements _TaskDetailState {
  const _$_TaskDetailState(
      {this.task,
      this.isFetching = false,
      this.isError = false,
      this.errorStatusCode = 0,
      this.errorBody = ''})
      : assert(isFetching != null),
        assert(isError != null),
        assert(errorStatusCode != null),
        assert(errorBody != null);

  factory _$_TaskDetailState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskDetailStateFromJson(json);

  @override
  final Task task;
  @JsonKey(defaultValue: false)
  @override
  final bool isFetching;
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
    return 'TaskDetailState(task: $task, isFetching: $isFetching, isError: $isError, errorStatusCode: $errorStatusCode, errorBody: $errorBody)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskDetailState &&
            (identical(other.task, task) ||
                const DeepCollectionEquality().equals(other.task, task)) &&
            (identical(other.isFetching, isFetching) ||
                const DeepCollectionEquality()
                    .equals(other.isFetching, isFetching)) &&
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
      const DeepCollectionEquality().hash(task) ^
      const DeepCollectionEquality().hash(isFetching) ^
      const DeepCollectionEquality().hash(isError) ^
      const DeepCollectionEquality().hash(errorStatusCode) ^
      const DeepCollectionEquality().hash(errorBody);

  @override
  _$TaskDetailStateCopyWith<_TaskDetailState> get copyWith =>
      __$TaskDetailStateCopyWithImpl<_TaskDetailState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskDetailStateToJson(this);
  }
}

abstract class _TaskDetailState implements TaskDetailState {
  const factory _TaskDetailState(
      {Task task,
      bool isFetching,
      bool isError,
      int errorStatusCode,
      String errorBody}) = _$_TaskDetailState;

  factory _TaskDetailState.fromJson(Map<String, dynamic> json) =
      _$_TaskDetailState.fromJson;

  @override
  Task get task;
  @override
  bool get isFetching;
  @override
  bool get isError;
  @override
  int get errorStatusCode;
  @override
  String get errorBody;
  @override
  _$TaskDetailStateCopyWith<_TaskDetailState> get copyWith;
}
