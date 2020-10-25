import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_web_view_page.dart';
import 'package:todo_flutter_sample/pages/task/list_page.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class DrawerContent extends HookWidget {
  final _appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    final authStateNotifier = useProvider(authStateProvider);
    final authState = useProvider(authStateProvider.state);
    final token = authState.token;
    final user = authState.user;

    final children = <Widget>[
      const DrawerHeader(
        child: Center(
          child: Text(
            'ToDo Flutter Sample',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: const Text('Home'),
        onTap: () {
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        },
      ),
    ];
    if (token != null && token.isSignedIn(user)) {
      children.addAll([
        ListTile(
          title: const Text('Tasks'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(TaskListPage.routeName);
          },
        ),
        ListTile(
          title: const Text('Sign out'),
          onTap: () {
            authStateNotifier.signOut();
            Fluttertoast.showToast(
              msg: 'Signed out.',
              backgroundColor: _appConfig.toastBackgroundColor,
              textColor: _appConfig.toastTextColor,
            );
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          },
        )
      ]);
    } else {
      children.addAll([
        ListTile(
          title: const Text('Sign in'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SignInPage.routeName);
          },
        ),
        ListTile(
          title: const Text('Sign in(WebView)'),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(SignInWebViewPage.routeName);
          },
        )
      ]);
    }

    return Drawer(
      child: ListView(
        children: children,
      ),
    );
  }
}
