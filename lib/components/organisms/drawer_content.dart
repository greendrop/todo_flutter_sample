import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/pages/home_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_page.dart';
import 'package:todo_flutter_sample/pages/sign_in_web_view_page.dart';
import 'package:todo_flutter_sample/pages/task/list_page.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

class DrawerContent extends StatelessWidget {
  final _appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    final token =
        context.select<AuthState, OAuth2Token>((state) => state.token);
    final user = context.select<AuthState, User>((state) => state.user);
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
            context.read<AuthStateNotifier>().signOut();
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
