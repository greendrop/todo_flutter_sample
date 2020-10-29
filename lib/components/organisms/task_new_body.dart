import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_form_fields.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskNewBody extends HookWidget {
  final _appConfig = AppConfig();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskForm = useState(const TaskForm());
    final taskCreateStateNotifier = useProvider(taskCreateStateProvider);
    final taskCreateState = useProvider(taskCreateStateProvider.state);
    final isCreating = taskCreateState.isCreating;

    void handleChangeTitle(String value) {
      taskForm.value = taskForm.value.copyWith(title: value);
    }

    void handleChangeDescription(String value) {
      taskForm.value = taskForm.value.copyWith(description: value);
    }

    // ignore: avoid_positional_boolean_parameters
    void handleChangeDone(bool value) {
      taskForm.value = taskForm.value.copyWith(done: value);
    }

    if (isCreating) {
      return CenterCircularProgressIndicator();
    }

    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TaskFormFields(taskForm.value, handleChangeTitle,
                  handleChangeDescription, handleChangeDone),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              try {
                                await taskCreateStateNotifier
                                    .createTask(taskForm.value);

                                Navigator.of(context).pop();

                                await Fluttertoast.showToast(
                                  msg: 'Created Task.',
                                  backgroundColor:
                                      _appConfig.toastBackgroundColor,
                                  textColor: _appConfig.toastTextColor,
                                );
                              } on openapi.ApiException catch (_) {}
                            }
                          },
                          child: const Text('CREATE'),
                        ))
                  ]))
            ]));
  }
}
