import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/organisms/task_edit_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/task/task_detail_state.dart';
import 'package:todo_flutter_sample/states/task/task_form_state.dart';
import 'package:todo_flutter_sample/states/task/task_update_state.dart';

class TaskEditPage extends StatefulWidget {
  static String routeName = '/task/edit';

  @override
  _TaskEditPageState createState() => _TaskEditPageState();
}

class _TaskEditPageState extends State<TaskEditPage> {
  bool isInitialized = false;
  TaskEditArguments arguments;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      arguments =
          ModalRoute.of(context).settings.arguments as TaskEditArguments;
      Timer(const Duration(), () async {
        context.read<TaskFormStateNotifier>().clear();
        context.read<TaskUpdateStateNotifier>().clear();
        setState(() {
          isInitialized = true;
        });

        final taskDetailState = await context
            .read<TaskDetailStateNotifier>()
            .fetchTaskById(arguments.id);
        final task = taskDetailState.task;
        if (task != null) {
          context
              .read<TaskFormStateNotifier>()
              .setTaskForm(TaskForm.fromJson(task.toJson()));
        }
      });
    }

    const title = 'Edit Task';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: PageTemplate(body: isInitialized ? TaskEditBody() : Container()),
    );
  }
}

class TaskEditArguments {
  TaskEditArguments(this.id);

  int id;
}
