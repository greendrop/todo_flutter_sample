import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_detail_fields.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/pages/task/edit_page.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskDetailBody extends HookWidget {
  final _appConfig = AppConfig();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskDetailStateNotifier = useProvider(taskDetailStateProvider);
    final taskDetailState = useProvider(taskDetailStateProvider.state);
    final taskDeleteStateNotifier = useProvider(taskDeleteStateProvider);
    final taskDeleteState = useProvider(taskDeleteStateProvider.state);
    final task = taskDetailState.task;

    if (taskDetailState.isFetching) {
      return CenterCircularProgressIndicator();
    }

    if (task == null) {
      return Container();
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TaskDetailFields(task),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(TaskEditPage.routeName,
                                    arguments: TaskEditArguments(task.id))
                                .then((value) {
                              taskDetailStateNotifier.fetchTaskById(task.id);
                            });
                          },
                          child: const Text('EDIT'),
                        )),
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                            onPressed: () async {
                              final result = await _showDeleteDialog(context);
                              if (result == 'OK') {
                                await taskDeleteStateNotifier
                                    .deleteTask(task.id);
                                if (!taskDeleteState.isError) {
                                  Navigator.of(context).pop();
                                  await Fluttertoast.showToast(
                                    msg: 'Deleted Task.',
                                    backgroundColor:
                                        _appConfig.toastBackgroundColor,
                                    textColor: _appConfig.toastTextColor,
                                  );
                                }
                              }
                            },
                            child: const Text('DELETE'))),
                  ]))
            ]));
  }

  Future<String> _showDeleteDialog(BuildContext context) async {
    return showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Delete Task'),
            content: const Text('Are you sure?'),
            actions: <Widget>[
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () => Navigator.pop(context, 'CANCEL'),
              ),
              FlatButton(
                child: const Text('OK'),
                onPressed: () => Navigator.pop(context, 'OK'),
              )
            ],
          );
        });
  }
}
