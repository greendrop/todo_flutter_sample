import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_form_fields.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/task_create_state.dart';
import 'package:todo_flutter_sample/states/task_form_state.dart';

class TaskNewBody extends StatefulWidget {
  @override
  _TaskNewBodyState createState() => _TaskNewBodyState();
}

class _TaskNewBodyState extends State<TaskNewBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskForm =
        context.select<TaskFormState, TaskForm>((state) => state.taskForm);

    final isCreating =
        context.select<TaskCreateState, bool>((state) => state.isCreating);

    if (isCreating) {
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
                  child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        final success = await context
                            .read<TaskCreateStateNotifier>()
                            .createTask(taskForm);

                        if (success) {
                          Navigator.of(context).pop('Created Task.');
                        }
                      }
                    },
                    child: const Text('CREATE'),
                  ))
            ]));
  }
}
