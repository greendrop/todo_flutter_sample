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
  _TaskUpdateState call({bool isUpdating = false}) {
    return _TaskUpdateState(
      isUpdating: isUpdating,
    );
  }
}

// ignore: unused_element
const $TaskUpdateState = _$TaskUpdateStateTearOff();

mixin _$TaskUpdateState {
  bool get isUpdating;

  Map<String, dynamic> toJson();
  $TaskUpdateStateCopyWith<TaskUpdateState> get copyWith;
}

abstract class $TaskUpdateStateCopyWith<$Res> {
  factory $TaskUpdateStateCopyWith(
          TaskUpdateState value, $Res Function(TaskUpdateState) then) =
      _$TaskUpdateStateCopyWithImpl<$Res>;
  $Res call({bool isUpdating});
}

class _$TaskUpdateStateCopyWithImpl<$Res>
    implements $TaskUpdateStateCopyWith<$Res> {
  _$TaskUpdateStateCopyWithImpl(this._value, this._then);

  final TaskUpdateState _value;
  // ignore: unused_field
  final $Res Function(TaskUpdateState) _then;

  @override
  $Res call({
    Object isUpdating = freezed,
  }) {
    return _then(_value.copyWith(
      isUpdating:
          isUpdating == freezed ? _value.isUpdating : isUpdating as bool,
    ));
  }
}

abstract class _$TaskUpdateStateCopyWith<$Res>
    implements $TaskUpdateStateCopyWith<$Res> {
  factory _$TaskUpdateStateCopyWith(
          _TaskUpdateState value, $Res Function(_TaskUpdateState) then) =
      __$TaskUpdateStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isUpdating});
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
    Object isUpdating = freezed,
  }) {
    return _then(_TaskUpdateState(
      isUpdating:
          isUpdating == freezed ? _value.isUpdating : isUpdating as bool,
    ));
  }
}

@JsonSerializable()
class _$_TaskUpdateState implements _TaskUpdateState {
  const _$_TaskUpdateState({this.isUpdating = false})
      : assert(isUpdating != null);

  factory _$_TaskUpdateState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskUpdateStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isUpdating;

  @override
  String toString() {
    return 'TaskUpdateState(isUpdating: $isUpdating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskUpdateState &&
            (identical(other.isUpdating, isUpdating) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdating, isUpdating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isUpdating);

  @override
  _$TaskUpdateStateCopyWith<_TaskUpdateState> get copyWith =>
      __$TaskUpdateStateCopyWithImpl<_TaskUpdateState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskUpdateStateToJson(this);
  }
}

abstract class _TaskUpdateState implements TaskUpdateState {
  const factory _TaskUpdateState({bool isUpdating}) = _$_TaskUpdateState;

  factory _TaskUpdateState.fromJson(Map<String, dynamic> json) =
      _$_TaskUpdateState.fromJson;

  @override
  bool get isUpdating;
  @override
  _$TaskUpdateStateCopyWith<_TaskUpdateState> get copyWith;
}
