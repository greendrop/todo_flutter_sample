import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/sign_in_form_fields.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/sign_in_form.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';
import 'package:todo_flutter_sample/states/sign_in_form_state.dart';

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _appConfig = AppConfig();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final signInForm = context
        .select<SignInFormState, SignInForm>((state) => state.signInForm);

    final isFetching =
        context.select<AuthState, bool>((state) => state.isFetching);

    if (isFetching) {
      return CenterCircularProgressIndicator();
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SignInFormFields(),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              final authState = await context
                                  .read<AuthStateNotifier>()
                                  .fetchTokenAndUserByUsernameAndCode(
                                      signInForm.email, signInForm.password);

                              if (!authState.isError) {
                                await Fluttertoast.showToast(
                                  msg: 'Signed in.',
                                  backgroundColor:
                                      _appConfig.toastBackgroundColor,
                                  textColor: _appConfig.toastTextColor,
                                );
                                await Navigator.of(context)
                                    .pushReplacementNamed(HomePage.routeName);
                              }
                            }
                          },
                          child: const Text('SIGN IN'),
                        ))
                  ]))
            ]));
  }
}
