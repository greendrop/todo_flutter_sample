import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/helpers/filter.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/states/task_detail_state.dart';

class TaskDetailBody extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final task = context.select<TaskDetailState, Task>((state) => state.task);
    final isFetching =
        context.select<TaskDetailState, bool>((state) => state.isFetching);

    if (isFetching) {
      return CenterCircularProgressIndicator();
    } else if (task != null) {
      final titleTextEditingController = TextEditingController()
        ..text = task.title ?? '';
      final descriptionTextEditingController = TextEditingController()
        ..text = task.description ?? '';
      final createdAtTextEditingController = TextEditingController()
        ..text = Filter.datetime(task.createdAt);
      final updatedAtTextEditingController = TextEditingController()
        ..text = Filter.datetime(task.updatedAt);

      final themeData = Theme.of(context);

      return Form(
          key: _formKey,
          child: Column(
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
                          value: task.done,
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
              ]));
    } else {
      return Container();
    }
  }
}
