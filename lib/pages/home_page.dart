import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';

class HomePage extends HookWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    const title = 'Home';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: DrawerContent(),
    );
  }
}
