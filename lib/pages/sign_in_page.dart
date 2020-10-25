import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:todo_flutter_sample/components/organisms/sign_in_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';

class SignInPage extends HookWidget {
  static String routeName = '/sign_in';

  @override
  Widget build(BuildContext context) {
    const title = 'Sign in';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: DrawerContent(),
      body: PageTemplate(body: SignInBody()),
    );
  }
}
