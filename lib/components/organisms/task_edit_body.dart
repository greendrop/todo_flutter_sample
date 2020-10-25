import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_form_fields.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskEditBody extends HookWidget {
  final _formKey = GlobalKey<FormState>();
  final _appConfig = AppConfig();

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final taskForm = useState(const TaskForm());
    final taskDetailState = useProvider(taskDetailStateProvider.state);
    final taskUpdateStateNotifier = useProvider(taskUpdateStateProvider);
    final taskUpdateState = useProvider(taskUpdateStateProvider.state);
    final task = taskDetailState.task;
    final isFetching = taskDetailState.isFetching;
    final isUpdating = taskUpdateState.isUpdating;

    useEffect(() {
      taskForm.value = TaskForm.fromJson(task.toJson());
      isInitialized.value = true;
      return () {};
    }, []);

    if (!isInitialized.value) {
      return Container();
    }

    if (isFetching || isUpdating) {
      return CenterCircularProgressIndicator();
    }

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
                              await taskUpdateStateNotifier.updateTask(
                                  task.id, taskForm.value);
                              if (!taskUpdateState.isError) {
                                Navigator.of(context).pop();
                                await Fluttertoast.showToast(
                                  msg: 'Updated Task.',
                                  backgroundColor:
                                      _appConfig.toastBackgroundColor,
                                  textColor: _appConfig.toastTextColor,
                                );
                              }
                            }
                          },
                          child: const Text('UPDATE'),
                        ))
                  ]))
            ]));
  }
}
