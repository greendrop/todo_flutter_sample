import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:todo_flutter_sample/components/organisms/sign_in_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/sign_in_form_state.dart';

class SignInPage extends StatefulWidget {
  static String routeName = '/sign_in';

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      Timer.run(() {
        context.read<SignInFormStateNotifier>().clear();
        setState(() {
          isInitialized = true;
        });
      });
    }

    const title = 'Sign in';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: DrawerContent(),
      body: PageTemplate(body: isInitialized ? SignInBody() : Container()),
    );
  }
}
