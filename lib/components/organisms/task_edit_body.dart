import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_form_fields.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/task/task_detail_state.dart';
import 'package:todo_flutter_sample/states/task/task_form_state.dart';
import 'package:todo_flutter_sample/states/task/task_update_state.dart';

class TaskEditBody extends StatefulWidget {
  @override
  _TaskEditBodyState createState() => _TaskEditBodyState();
}

class _TaskEditBodyState extends State<TaskEditBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final task = context.select<TaskDetailState, Task>((state) => state.task);
    final taskForm =
        context.select<TaskFormState, TaskForm>((state) => state.taskForm);
    final isFetching =
        context.select<TaskDetailState, bool>((state) => state.isFetching);
    final isUpdating =
        context.select<TaskUpdateState, bool>((state) => state.isUpdating);

    if (isFetching || isUpdating) {
      return CenterCircularProgressIndicator();
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TaskFormFields(),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              final taskUpdateState = await context
                                  .read<TaskUpdateStateNotifier>()
                                  .updateTask(task.id, taskForm);
                              if (!taskUpdateState.isError) {
                                Navigator.of(context).pop('Updated Task.');
                              }
                            }
                          },
                          child: const Text('UPDATE'),
                        ))
                  ]))
            ]));
  }
}
