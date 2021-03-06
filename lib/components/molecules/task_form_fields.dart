import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_flutter_sample/models/task_form.dart';

class TaskFormFields extends HookWidget {
  const TaskFormFields(this.taskForm, this.handleChangeTitle,
      this.handleChangeDescription, this.handleChangeDone);

  final TaskForm taskForm;
  final Function handleChangeTitle;
  final Function handleChangeDescription;
  final Function handleChangeDone;

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final titleTextEditingController =
        useTextEditingController(text: taskForm.title ?? '');
    final descriptionTextEditingController =
        useTextEditingController(text: taskForm.description ?? '');
    final done = useState(taskForm.done);

    useEffect(() {
      titleTextEditingController.addListener(() {
        handleChangeTitle(titleTextEditingController.text);
      });
      descriptionTextEditingController.addListener(() {
        handleChangeDescription(descriptionTextEditingController.text);
      });
      isInitialized.value = true;

      return () {};
    }, []);

    if (isInitialized.value == false) {
      return Container();
    }

    final themeData = Theme.of(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: titleTextEditingController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: TaskForm.titleValidator),
          TextFormField(
            controller: descriptionTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            validator: TaskForm.descriptionValidator,
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Done',
                      style: themeData.textTheme.subtitle1.copyWith(
                          color: themeData.disabledColor, fontSize: 12)),
                  Switch(
                    value: done.value,
                    onChanged: (value) {
                      done.value = value;
                      handleChangeDone(value);
                    },
                  )
                ],
              ))
        ]);
  }
}
