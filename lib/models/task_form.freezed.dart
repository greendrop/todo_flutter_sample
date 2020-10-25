// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'task_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
TaskForm _$TaskFormFromJson(Map<String, dynamic> json) {
  return _TaskForm.fromJson(json);
}

class _$TaskFormTearOff {
  const _$TaskFormTearOff();

// ignore: unused_element
  _TaskForm call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'done') bool done = false}) {
    return _TaskForm(
      title: title,
      description: description,
      done: done,
    );
  }
}

// ignore: unused_element
const $TaskForm = _$TaskFormTearOff();

mixin _$TaskForm {
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'description')
  String get description;
  @JsonKey(name: 'done')
  bool get done;

  Map<String, dynamic> toJson();
  $TaskFormCopyWith<TaskForm> get copyWith;
}

abstract class $TaskFormCopyWith<$Res> {
  factory $TaskFormCopyWith(TaskForm value, $Res Function(TaskForm) then) =
      _$TaskFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'done') bool done});
}

class _$TaskFormCopyWithImpl<$Res> implements $TaskFormCopyWith<$Res> {
  _$TaskFormCopyWithImpl(this._value, this._then);

  final TaskForm _value;
  // ignore: unused_field
  final $Res Function(TaskForm) _then;

  @override
  $Res call({
    Object title = freezed,
    Object description = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

abstract class _$TaskFormCopyWith<$Res> implements $TaskFormCopyWith<$Res> {
  factory _$TaskFormCopyWith(_TaskForm value, $Res Function(_TaskForm) then) =
      __$TaskFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'done') bool done});
}

class __$TaskFormCopyWithImpl<$Res> extends _$TaskFormCopyWithImpl<$Res>
    implements _$TaskFormCopyWith<$Res> {
  __$TaskFormCopyWithImpl(_TaskForm _value, $Res Function(_TaskForm) _then)
      : super(_value, (v) => _then(v as _TaskForm));

  @override
  _TaskForm get _value => super._value as _TaskForm;

  @override
  $Res call({
    Object title = freezed,
    Object description = freezed,
    Object done = freezed,
  }) {
    return _then(_TaskForm(
      title: title == freezed ? _value.title : title as String,
      description:
          description == freezed ? _value.description : description as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

@JsonSerializable()
class _$_TaskForm implements _TaskForm {
  const _$_TaskForm(
      {@JsonKey(name: 'title') this.title,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'done') this.done = false})
      : assert(done != null);

  factory _$_TaskForm.fromJson(Map<String, dynamic> json) =>
      _$_$_TaskFormFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'done')
  final bool done;

  @override
  String toString() {
    return 'TaskForm(title: $title, description: $description, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TaskForm &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(done);

  @override
  _$TaskFormCopyWith<_TaskForm> get copyWith =>
      __$TaskFormCopyWithImpl<_TaskForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TaskFormToJson(this);
  }
}

abstract class _TaskForm implements TaskForm {
  const factory _TaskForm(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'done') bool done}) = _$_TaskForm;

  factory _TaskForm.fromJson(Map<String, dynamic> json) = _$_TaskForm.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'done')
  bool get done;
  @override
  _$TaskFormCopyWith<_TaskForm> get copyWith;
}
