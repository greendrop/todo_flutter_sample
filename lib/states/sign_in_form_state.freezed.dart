// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SignInFormState _$SignInFormStateFromJson(Map<String, dynamic> json) {
  return _SignInFormState.fromJson(json);
}

class _$SignInFormStateTearOff {
  const _$SignInFormStateTearOff();

// ignore: unused_element
  _SignInFormState call({SignInForm signInForm}) {
    return _SignInFormState(
      signInForm: signInForm,
    );
  }
}

// ignore: unused_element
const $SignInFormState = _$SignInFormStateTearOff();

mixin _$SignInFormState {
  SignInForm get signInForm;

  Map<String, dynamic> toJson();
  $SignInFormStateCopyWith<SignInFormState> get copyWith;
}

abstract class $SignInFormStateCopyWith<$Res> {
  factory $SignInFormStateCopyWith(
          SignInFormState value, $Res Function(SignInFormState) then) =
      _$SignInFormStateCopyWithImpl<$Res>;
  $Res call({SignInForm signInForm});
}

class _$SignInFormStateCopyWithImpl<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  _$SignInFormStateCopyWithImpl(this._value, this._then);

  final SignInFormState _value;
  // ignore: unused_field
  final $Res Function(SignInFormState) _then;

  @override
  $Res call({
    Object signInForm = freezed,
  }) {
    return _then(_value.copyWith(
      signInForm:
          signInForm == freezed ? _value.signInForm : signInForm as SignInForm,
    ));
  }
}

abstract class _$SignInFormStateCopyWith<$Res>
    implements $SignInFormStateCopyWith<$Res> {
  factory _$SignInFormStateCopyWith(
          _SignInFormState value, $Res Function(_SignInFormState) then) =
      __$SignInFormStateCopyWithImpl<$Res>;
  @override
  $Res call({SignInForm signInForm});
}

class __$SignInFormStateCopyWithImpl<$Res>
    extends _$SignInFormStateCopyWithImpl<$Res>
    implements _$SignInFormStateCopyWith<$Res> {
  __$SignInFormStateCopyWithImpl(
      _SignInFormState _value, $Res Function(_SignInFormState) _then)
      : super(_value, (v) => _then(v as _SignInFormState));

  @override
  _SignInFormState get _value => super._value as _SignInFormState;

  @override
  $Res call({
    Object signInForm = freezed,
  }) {
    return _then(_SignInFormState(
      signInForm:
          signInForm == freezed ? _value.signInForm : signInForm as SignInForm,
    ));
  }
}

@JsonSerializable()
class _$_SignInFormState implements _SignInFormState {
  const _$_SignInFormState({this.signInForm});

  factory _$_SignInFormState.fromJson(Map<String, dynamic> json) =>
      _$_$_SignInFormStateFromJson(json);

  @override
  final SignInForm signInForm;

  @override
  String toString() {
    return 'SignInFormState(signInForm: $signInForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInFormState &&
            (identical(other.signInForm, signInForm) ||
                const DeepCollectionEquality()
                    .equals(other.signInForm, signInForm)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(signInForm);

  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith =>
      __$SignInFormStateCopyWithImpl<_SignInFormState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignInFormStateToJson(this);
  }
}

abstract class _SignInFormState implements SignInFormState {
  const factory _SignInFormState({SignInForm signInForm}) = _$_SignInFormState;

  factory _SignInFormState.fromJson(Map<String, dynamic> json) =
      _$_SignInFormState.fromJson;

  @override
  SignInForm get signInForm;
  @override
  _$SignInFormStateCopyWith<_SignInFormState> get copyWith;
}
