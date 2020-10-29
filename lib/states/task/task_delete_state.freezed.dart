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
  _TaskDeleteState call({bool isDeleting = false}) {
    return _TaskDeleteState(
      isDeleting: isDeleting,
    );
  }
}

// ignore: unused_element
const $TaskDeleteState = _$TaskDeleteStateTearOff();

mixin _$TaskDeleteState {
  bool get isDeleting;

  Map<String, dynamic> toJson();
  $TaskDeleteStateCopyWith<TaskDeleteState> get copyWith;
}

abstract class $TaskDeleteStateCopyWith<$Res> {
  factory $TaskDeleteStateCopyWith(
          TaskDeleteState value, $Res Function(TaskDeleteState) then) =
      _$TaskDeleteStateCopyWithImpl<$Res>;
  $Res call({bool isDeleting});
}

class _$TaskDeleteStateCopyWithImpl<$Res>
    implements $TaskDeleteStateCopyWith<$Res> {
  _$TaskDeleteStateCopyWithImpl(this._value, this._then);

  final TaskDeleteState _value;
  // ignore: unused_field
  final $Res Function(TaskDeleteState) _then;

  @override
  $Res call({
    Object isDeleting = freezed,
  }) {
    return _then(_value.copyWith(
      isDeleting:
          isDeleting == freezed ? _value.isDeleting : isDeleting as bool,
    ));
  }
}

abstract class _$TaskDeleteStateCopyWith<$Res>
    implements $TaskDeleteStateCopyWith<$Res> {
  factory _$TaskDeleteStateCopyWith(
          _TaskDeleteState value, $Res Function(_TaskDeleteState) then) =
      __$TaskDeleteStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isDeleting});
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
    Object isDeleting = freezed,
  }) {
    return _then(_TaskDeleteState(
      isDeleting:
          isDeleting == freezed ? _value.isDeleting : isDeleting as bool,
    ));
  }
}

@JsonSerializable()
class _$_TaskDeleteState implements _TaskDeleteState {
  const _$_TaskDeleteState({this.isDeleting = false})
      : assert(isDeleting != null);

  factory _$_TaskDeleteState.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskDeleteStateFromJson(json);

  @JsonKey(defaultValue: false)
  @override
  final bool isDeleting;

  @override
  String toString() {
    return 'TaskDeleteState(isDeleting: $isDeleting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskDeleteState &&
            (identical(other.isDeleting, isDeleting) ||
                const DeepCollectionEquality()
                    .equals(other.isDeleting, isDeleting)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isDeleting);

  @override
  _$TaskDeleteStateCopyWith<_TaskDeleteState> get copyWith =>
      __$TaskDeleteStateCopyWithImpl<_TaskDeleteState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskDeleteStateToJson(this);
  }
}

abstract class _TaskDeleteState implements TaskDeleteState {
  const factory _TaskDeleteState({bool isDeleting}) = _$_TaskDeleteState;

  factory _TaskDeleteState.fromJson(Map<String, dynamic> json) =
      _$_TaskDeleteState.fromJson;

  @override
  bool get isDeleting;
  @override
  _$TaskDeleteStateCopyWith<_TaskDeleteState> get copyWith;
}
