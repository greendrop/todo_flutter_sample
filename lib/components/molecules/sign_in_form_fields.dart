import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/models/sign_in_form.dart';
import 'package:todo_flutter_sample/states/sign_in_form_state.dart';

class SignInFormFields extends StatefulWidget {
  @override
  _SignInFormFieldsState createState() => _SignInFormFieldsState();
}

class _SignInFormFieldsState extends State<SignInFormFields> {
  bool isInitialized = false;
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  void _handleEmail() {
    context
        .read<SignInFormStateNotifier>()
        .handleEmail(_emailTextEditingController.text);
  }

  void _handlePassword() {
    context
        .read<SignInFormStateNotifier>()
        .handlePassword(_passwordTextEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    final signInForm = context.select<SignInFormState, SignInForm>(
        (state) => state.signInForm ?? SignInForm());

    if (isInitialized == false) {
      Timer.run(() {
        _emailTextEditingController.text = signInForm.email ?? '';
        _passwordTextEditingController.text = signInForm.password ?? '';
        _emailTextEditingController.addListener(_handleEmail);
        _passwordTextEditingController.addListener(_handlePassword);
        setState(() {
          isInitialized = true;
        });
      });

      return Container();
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: _emailTextEditingController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              validator: SignInForm.emailValidator),
          TextFormField(
            controller: _passwordTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: SignInForm.passwordValidator,
            obscureText: true,
          ),
        ]);
  }
}
