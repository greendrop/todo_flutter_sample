import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_form.freezed.dart';
part 'sign_in_form.g.dart';

@freezed
abstract class SignInForm with _$SignInForm {
  const factory SignInForm({
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'password') String password,
  }) = _SignInForm;
  factory SignInForm.fromJson(Map<String, dynamic> json) {
    return _$SignInFormFromJson(json);
  }

  static String emailValidator(String value) {
    if (value.isEmpty) {
      return "Email can't be blank";
    }
    return null;
  }

  static String passwordValidator(String value) {
    if (value.isEmpty) {
      return "Password can't be blank";
    }
    return null;
  }
}
