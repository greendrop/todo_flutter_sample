import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final token =
        context.select<AuthState, OAuth2Token>((state) => state.token);
    final user = context.select<AuthState, User>((state) => state.user);
    final children = <Widget>[
      DrawerHeader(
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
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
    ];
    if (token != null && token.isSignedIn(user)) {
      children.addAll([
        ListTile(
          title: const Text('Sign out'),
          onTap: () {
            context.read<AuthStateNotifier>().signOut();
            Navigator.of(context).pushReplacementNamed('/');
          },
        )
      ]);
    } else {
      children.addAll([
        ListTile(
          title: const Text('Sign in'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/sign_in');
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
