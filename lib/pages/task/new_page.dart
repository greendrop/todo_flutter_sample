import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/organisms/task_new_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/task_create_state.dart';
import 'package:todo_flutter_sample/states/task_form_state.dart';

class TaskNewPage extends StatefulWidget {
  static String routeName = '/task/new';

  @override
  _TaskNewPageState createState() => _TaskNewPageState();
}

class _TaskNewPageState extends State<TaskNewPage> {
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      Timer(const Duration(), () {
        context.read<TaskFormStateNotifier>().initialize();
        context.read<TaskCreateStateNotifier>().initialize();
        setState(() {
          isInitialized = true;
        });
      });
    }

    const title = 'New Task';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: PageTemplate(body: isInitialized ? TaskNewBody() : Container()),
    );
  }
}
