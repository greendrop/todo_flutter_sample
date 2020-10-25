import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/molecules/task_list_item.dart';
import 'package:todo_flutter_sample/components/organisms/drawer_content.dart';
import 'package:todo_flutter_sample/components/organisms/task_list_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

import 'new_page.dart';

class TaskListPage extends HookWidget {
  static String routeName = '/task/list';

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final taskListStateNotifier = useProvider(taskListStateProvider);
    final taskListState = useProvider(taskListStateProvider.state);

    useEffect(() {
      Timer.run(() {
        taskListStateNotifier.fetchTasks({});
        isInitialized.value = true;
      });
      return () {};
    }, []);

    const title = 'Task list';
    final tasks = taskListState.tasks;

    final children = <Widget>[];
    if (tasks != null) {
      children.addAll(tasks.map((item) => TaskListItem(item)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      drawer: DrawerContent(),
      body: PageTemplate(body: TaskListBody()),
      floatingActionButton: _NewFloatingActionButton(),
    );
  }
}

class _NewFloatingActionButton extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final taskListStateNotifier = useProvider(taskListStateProvider);

    return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(TaskNewPage.routeName).then((value) {
            taskListStateNotifier.fetchTasks({});
          });
        },
        tooltip: 'Create',
        child: const Icon(Icons.add));
  }
}
