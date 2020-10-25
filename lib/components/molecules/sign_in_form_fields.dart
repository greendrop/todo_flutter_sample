import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_flutter_sample/models/sign_in_form.dart';

class SignInFormFields extends HookWidget {
  const SignInFormFields(
      this.signInForm, this.handleChangeEmail, this.handleChangePassword);

  final SignInForm signInForm;
  final Function handleChangeEmail;
  final Function handleChangePassword;

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();

    useEffect(() {
      emailTextEditingController
        ..text = signInForm.email ?? ''
        ..addListener(() {
          handleChangeEmail(emailTextEditingController.value.text);
        });
      passwordTextEditingController
        ..text = signInForm.password ?? ''
        ..addListener(() {
          handleChangePassword(passwordTextEditingController.value.text);
        });
      isInitialized.value = true;

      return () {};
    }, []);

    if (isInitialized.value == false) {
      return Container();
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: emailTextEditingController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: SignInForm.emailValidator),
          TextFormField(
            controller: passwordTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: SignInForm.passwordValidator,
            obscureText: true,
          ),
        ]);
  }
}
