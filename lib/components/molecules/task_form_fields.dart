import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/task_form_state.dart';

class TaskFormFields extends StatefulWidget {
  @override
  _TaskFormFieldsState createState() => _TaskFormFieldsState();
}

class _TaskFormFieldsState extends State<TaskFormFields> {
  bool isInitialized = false;
  final _titleTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _titleTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
  }

  void _handleTitle() {
    context
        .read<TaskFormStateNotifier>()
        .handleTitle(_titleTextEditingController.text);
  }

  void _handleDescription() {
    context
        .read<TaskFormStateNotifier>()
        .handleDescription(_descriptionTextEditingController.text);
  }

  void _handleDone(bool value) {
    context.read<TaskFormStateNotifier>().handleDone(value);
  }

  @override
  Widget build(BuildContext context) {
    final taskForm = context.select<TaskFormState, TaskForm>(
        (state) => state.taskForm ?? TaskForm());

    if (isInitialized == false) {
      Timer(const Duration(), () {
        _titleTextEditingController.text = taskForm.title ?? '';
        _descriptionTextEditingController.text = taskForm.description ?? '';
        _titleTextEditingController.addListener(_handleTitle);
        _descriptionTextEditingController.addListener(_handleDescription);
        setState(() {
          isInitialized = true;
        });
      });

      return Container();
    }

    final themeData = Theme.of(context);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
              controller: _titleTextEditingController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: TaskForm.titleValidator),
          TextFormField(
            controller: _descriptionTextEditingController,
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
                    value: taskForm.done ?? false,
                    onChanged: _handleDone,
                  )
                ],
              ))
        ]);
  }
}
