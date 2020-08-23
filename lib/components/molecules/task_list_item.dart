import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/helpers/filter.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/pages/task/detail_page.dart';
import 'package:todo_flutter_sample/states/task/task_list_state.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final title = task.title ?? '';
    final description = Filter.truncate(
        (task.description ?? '').replaceAll(RegExp(r'\n|\r|\r\n'), ''));
    ListTile listTile;
    if (description != '') {
      listTile = ListTile(title: Text(title), subtitle: Text(description));
    } else {
      listTile = ListTile(title: Text(title));
    }

    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          listTile,
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: const Text('DETAIL'),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(TaskDetailPage.routeName,
                          arguments: TaskDetailArguments(task.id))
                      .then((value) {
                    context.read<TaskListStateNotifier>().fetchTasks({});
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
