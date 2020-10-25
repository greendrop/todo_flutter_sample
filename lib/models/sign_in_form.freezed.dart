// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sign_in_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
SignInForm _$SignInFormFromJson(Map<String, dynamic> json) {
  return _SignInForm.fromJson(json);
}

class _$SignInFormTearOff {
  const _$SignInFormTearOff();

// ignore: unused_element
  _SignInForm call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password}) {
    return _SignInForm(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $SignInForm = _$SignInFormTearOff();

mixin _$SignInForm {
  @JsonKey(name: 'email')
  String get email;
  @JsonKey(name: 'password')
  String get password;

  Map<String, dynamic> toJson();
  $SignInFormCopyWith<SignInForm> get copyWith;
}

abstract class $SignInFormCopyWith<$Res> {
  factory $SignInFormCopyWith(
          SignInForm value, $Res Function(SignInForm) then) =
      _$SignInFormCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password});
}

class _$SignInFormCopyWithImpl<$Res> implements $SignInFormCopyWith<$Res> {
  _$SignInFormCopyWithImpl(this._value, this._then);

  final SignInForm _value;
  // ignore: unused_field
  final $Res Function(SignInForm) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

abstract class _$SignInFormCopyWith<$Res> implements $SignInFormCopyWith<$Res> {
  factory _$SignInFormCopyWith(
          _SignInForm value, $Res Function(_SignInForm) then) =
      __$SignInFormCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password});
}

class __$SignInFormCopyWithImpl<$Res> extends _$SignInFormCopyWithImpl<$Res>
    implements _$SignInFormCopyWith<$Res> {
  __$SignInFormCopyWithImpl(
      _SignInForm _value, $Res Function(_SignInForm) _then)
      : super(_value, (v) => _then(v as _SignInForm));

  @override
  _SignInForm get _value => super._value as _SignInForm;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_SignInForm(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

@JsonSerializable()
class _$_SignInForm implements _SignInForm {
  const _$_SignInForm(
      {@JsonKey(name: 'email') this.email,
      @JsonKey(name: 'password') this.password});

  factory _$_SignInForm.fromJson(Map<String, dynamic> json) =>
      _$_$_SignInFormFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'SignInForm(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInForm &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$SignInFormCopyWith<_SignInForm> get copyWith =>
      __$SignInFormCopyWithImpl<_SignInForm>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignInFormToJson(this);
  }
}

abstract class _SignInForm implements SignInForm {
  const factory _SignInForm(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password}) = _$_SignInForm;

  factory _SignInForm.fromJson(Map<String, dynamic> json) =
      _$_SignInForm.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  _$SignInFormCopyWith<_SignInForm> get copyWith;
}
