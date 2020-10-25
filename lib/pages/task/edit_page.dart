import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/organisms/task_edit_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskEditPage extends HookWidget {
  static String routeName = '/task/edit';

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final arguments = useState<TaskEditArguments>(null);
    final taskDetailStateNotifier = useProvider(taskDetailStateProvider);
    final taskUpdateStateNotifier = useProvider(taskUpdateStateProvider);

    useEffect(() {
      Timer.run(() async {
        arguments.value =
            ModalRoute.of(context).settings.arguments as TaskEditArguments;
        taskUpdateStateNotifier.clear();
        await taskDetailStateNotifier.fetchTaskById(arguments.value.id);
        isInitialized.value = true;
      });
      return () {};
    }, []);

    const title = 'Edit Task';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: PageTemplate(
          body: isInitialized.value ? TaskEditBody() : Container()),
    );
  }
}

class TaskEditArguments {
  TaskEditArguments(this.id);

  int id;
}
