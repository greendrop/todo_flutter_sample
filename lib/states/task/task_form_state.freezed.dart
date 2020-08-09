// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskFormState _$TaskFormStateFromJson(Map<String, dynamic> json) {
  return _TaskFormState.fromJson(json);
}

class _$TaskFormStateTearOff {
  const _$TaskFormStateTearOff();

// ignore: unused_element
  _TaskFormState call({TaskForm taskForm}) {
    return _TaskFormState(
      taskForm: taskForm,
    );
  }
}

// ignore: unused_element
const $TaskFormState = _$TaskFormStateTearOff();

mixin _$TaskFormState {
  TaskForm get taskForm;

  Map<String, dynamic> toJson();
  $TaskFormStateCopyWith<TaskFormState> get copyWith;
}

abstract class $TaskFormStateCopyWith<$Res> {
  factory $TaskFormStateCopyWith(
          TaskFormState value, $Res Function(TaskFormState) then) =
      _$TaskFormStateCopyWithImpl<$Res>;
  $Res call({TaskForm taskForm});
}

class _$TaskFormStateCopyWithImpl<$Res>
    implements $TaskFormStateCopyWith<$Res> {
  _$TaskFormStateCopyWithImpl(this._value, this._then);

  final TaskFormState _value;
  // ignore: unused_field
  final $Res Function(TaskFormState) _then;

  @override
  $Res call({
    Object taskForm = freezed,
  }) {
    return _then(_value.copyWith(
      taskForm: taskForm == freezed ? _value.taskForm : taskForm as TaskForm,
    ));
  }
}

abstract class _$TaskFormStateCopyWith<$Res>
    implements $TaskFormStateCopyWith<$Res> {
  factory _$TaskFormStateCopyWith(
          _TaskFormState value, $Res Function(_TaskFormState) then) =
      __$TaskFormStateCopyWithImpl<$Res>;
  @override
  $Res call({TaskForm taskForm});
}

class __$TaskFormStateCopyWithImpl<$Res>
    extends _$TaskFormStateCopyWithImpl<$Res>
    implements _$TaskFormStateCopyWith<$Res> {
  __$TaskFormStateCopyWithImpl(
      _TaskFormState _value, $Res Function(_TaskFormState) _then)
      : super(_value, (v) => _then(v as _TaskFormState));

  @override
  _TaskFormState get _value => super._value as _TaskFormState;

  @override
  $Res call({
    Object taskForm = freezed,
  }) {
    return _then(_TaskFormState(
      taskForm: taskForm == freezed ? _value.taskForm : taskForm as TaskForm,
    ));
  }
}

@JsonSerializable()
class _$_TaskFormState implements _TaskFormState {
  const _$_TaskFormState({this.taskForm});

  factory _$_TaskFormState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFormStateFromJson(json);

  @override
  final TaskForm taskForm;

  @override
  String toString() {
    return 'TaskFormState(taskForm: $taskForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskFormState &&
            (identical(other.taskForm, taskForm) ||
                const DeepCollectionEquality()
                    .equals(other.taskForm, taskForm)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(taskForm);

  @override
  _$TaskFormStateCopyWith<_TaskFormState> get copyWith =>
      __$TaskFormStateCopyWithImpl<_TaskFormState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskFormStateToJson(this);
  }
}

abstract class _TaskFormState implements TaskFormState {
  const factory _TaskFormState({TaskForm taskForm}) = _$_TaskFormState;

  factory _TaskFormState.fromJson(Map<String, dynamic> json) =
      _$_TaskFormState.fromJson;

  @override
  TaskForm get taskForm;
  @override
  _$TaskFormStateCopyWith<_TaskFormState> get copyWith;
}
