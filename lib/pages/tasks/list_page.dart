import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/molecules/task_list_item.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:todo_flutter_sample/components/organisms/task_list_body.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/states/task_list_state.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  bool isInitialized = false;

  @override
  Widget build(BuildContext context) {
    if (isInitialized == false) {
      Timer(const Duration(), () {
        context.read<TaskListStateNotifier>().fetchTasks({});
        setState(() {
          isInitialized = true;
        });
      });
    }

    const title = 'Task list';
    final tasks =
        context.select<TaskListState, List<Task>>((state) => state.tasks);
    final isFetching =
        context.select<TaskListState, bool>((state) => state.isFetching);

    final children = <Widget>[];
    if (tasks != null) {
      children.addAll(tasks.map((item) => TaskListItem(item)));
    }
    if (isFetching) {}

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: DrawerContent(),
      body: TaskListBody(),
    );
  }
}
