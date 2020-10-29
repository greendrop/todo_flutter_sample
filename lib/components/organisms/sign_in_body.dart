import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/sign_in_form_fields.dart';
import 'package:todo_flutter_sample/models/sign_in_form.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class SignInBody extends HookWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authStateNotifier = useProvider(authStateProvider);
    final authState = useProvider(authStateProvider.state);
    final isFetching = authState.isFetching;
    final signInForm = useState(const SignInForm());

    void handleChangeEmail(String value) {
      signInForm.value = signInForm.value.copyWith(email: value);
    }

    void handleChangePassword(String value) {
      signInForm.value = signInForm.value.copyWith(password: value);
    }

    if (isFetching) {
      return CenterCircularProgressIndicator();
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SignInFormFields(
                  signInForm.value, handleChangeEmail, handleChangePassword),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              try {
                                await authStateNotifier
                                    .fetchTokenAndUserByUsernameAndPassword(
                                        signInForm.value.email,
                                        signInForm.value.password);

                                await Navigator.of(context)
                                    .pushReplacementNamed(HomePage.routeName);
                              } on openapi.ApiException catch (_) {}
                            }
                          },
                          child: const Text('SIGN IN'),
                        ))
                  ]))
            ]));
  }
}
