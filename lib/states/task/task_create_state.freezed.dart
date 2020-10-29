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
  _TaskCreateState call({bool isCreating = false}) {
    return _TaskCreateState(
      isCreating: isCreating,
    );
  }
}

// ignore: unused_element
const $TaskCreateState = _$TaskCreateStateTearOff();

mixin _$TaskCreateState {
  bool get isCreating;

  Map<String, dynamic> toJson();
  $TaskCreateStateCopyWith<TaskCreateState> get copyWith;
}

abstract class $TaskCreateStateCopyWith<$Res> {
  factory $TaskCreateStateCopyWith(
          TaskCreateState value, $Res Function(TaskCreateState) then) =
      _$TaskCreateStateCopyWithImpl<$Res>;
  $Res call({bool isCreating});
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
  }) {
    return _then(_value.copyWith(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
    ));
  }
}

abstract class _$TaskCreateStateCopyWith<$Res>
    implements $TaskCreateStateCopyWith<$Res> {
  factory _$TaskCreateStateCopyWith(
          _TaskCreateState value, $Res Function(_TaskCreateState) then) =
      __$TaskCreateStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isCreating});
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
  }) {
    return _then(_TaskCreateState(
      isCreating:
          isCreating == freezed ? _value.isCreating : isCreating as bool,
    ));
  }
}

@JsonSerializable()
class _$_TaskCreateState implements _TaskCreateState {
  const _$_TaskCreateState({this.isCreating = false})
      : assert(isCreating != null);

  factory _$_TaskCreateState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskCreateStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isCreating;

  @override
  String toString() {
    return 'TaskCreateState(isCreating: $isCreating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskCreateState &&
            (identical(other.isCreating, isCreating) ||
                const DeepCollectionEquality()
                    .equals(other.isCreating, isCreating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isCreating);

  @override
  _$TaskCreateStateCopyWith<_TaskCreateState> get copyWith =>
      __$TaskCreateStateCopyWithImpl<_TaskCreateState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskCreateStateToJson(this);
  }
}

abstract class _TaskCreateState implements TaskCreateState {
  const factory _TaskCreateState({bool isCreating}) = _$_TaskCreateState;

  factory _TaskCreateState.fromJson(Map<String, dynamic> json) =
      _$_TaskCreateState.fromJson;

  @override
  bool get isCreating;
  @override
  _$TaskCreateStateCopyWith<_TaskCreateState> get copyWith;
}
