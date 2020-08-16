import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/sign_in_form.dart';

part 'sign_in_form_state.freezed.dart';
part 'sign_in_form_state.g.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    SignInForm signInForm,
  }) = _SignInFormState;
  factory SignInFormState.fromJson(Map<String, dynamic> json) {
    return _$SignInFormStateFromJson(json);
  }
}

class SignInFormStateNotifier extends StateNotifier<SignInFormState> {
  SignInFormStateNotifier() : super(const SignInFormState());

  SignInFormState setSignInForm(SignInForm signInForm) {
    return state = state.copyWith(signInForm: signInForm);
  }

  SignInFormState clear() {
    setSignInForm(SignInForm());
    return state;
  }

  void handleEmail(String value) {
    final signInForm = SignInForm.fromJson(state.signInForm.toJson())
      ..email = value;
    setSignInForm(signInForm);
  }

  void handlePassword(String value) {
    final signInForm = SignInForm.fromJson(state.signInForm.toJson())
      ..password = value;
    setSignInForm(signInForm);
  }
}
