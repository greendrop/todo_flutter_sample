import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_flutter_sample/helpers/filter.dart';
import 'package:todo_flutter_sample/models/task.dart';

class TaskDetailFields extends HookWidget {
  const TaskDetailFields(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final titleTextEditingController =
        useTextEditingController(text: task.title ?? '');
    final descriptionTextEditingController =
        useTextEditingController(text: task.description ?? '');
    final done = useState(task.done);
    final createdAtTextEditingController =
        useTextEditingController(text: Filter.datetime(task.createdAt));
    final updatedAtTextEditingController =
        useTextEditingController(text: Filter.datetime(task.updatedAt));

    useEffect(() {
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
            readOnly: true,
          ),
          TextFormField(
            controller: descriptionTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Description',
            ),
            readOnly: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
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
                    onChanged: (value) {},
                  )
                ],
              )),
          TextFormField(
            controller: createdAtTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Created at',
            ),
            readOnly: true,
          ),
          TextFormField(
            controller: updatedAtTextEditingController,
            decoration: const InputDecoration(
              labelText: 'Updated at',
            ),
            readOnly: true,
          ),
        ]);
  }
}
