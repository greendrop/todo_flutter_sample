import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/organisms/task_detail_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/task/task_delete_state.dart';
import 'package:todo_flutter_sample/states/task/task_detail_state.dart';

class TaskDetailPage extends StatefulWidget {
  static String routeName = '/task/detail';

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  bool isInitialized = false;
  TaskDetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      arguments =
          ModalRoute.of(context).settings.arguments as TaskDetailArguments;
      Timer.run(() {
        context.read<TaskDetailStateNotifier>().clear();
        context.read<TaskDeleteStateNotifier>().clear();
        context.read<TaskDetailStateNotifier>().fetchTaskById(arguments.id);
        setState(() {
          isInitialized = true;
        });
      });
    }

    const title = 'Task detail';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: PageTemplate(body: TaskDetailBody()),
    );
  }
}

class TaskDetailArguments {
  TaskDetailArguments(this.id);

  int id;
}
