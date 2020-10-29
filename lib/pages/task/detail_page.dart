import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:todo_flutter_sample/components/organisms/task_detail_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskDetailPage extends HookWidget {
  static String routeName = '/task/detail';

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final arguments = useState<TaskDetailArguments>(null);
    final taskDetailStateNotifier = useProvider(taskDetailStateProvider);
    final taskDeleteStateNotifier = useProvider(taskDetailStateProvider);

    useEffect(() {
      Timer.run(() {
        arguments.value =
            ModalRoute.of(context).settings.arguments as TaskDetailArguments;
        taskDetailStateNotifier.clear();
        taskDeleteStateNotifier.clear();
        try {
          taskDetailStateNotifier.fetchTaskById(arguments.value.id);
        } on openapi.ApiException catch (_) {}
        isInitialized.value = true;
      });
      return () {};
    }, []);

    const title = 'Task detail';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: PageTemplate(body: TaskDetailBody()),
    );
  }
}

class TaskDetailArguments {
  TaskDetailArguments(this.id);

  int id;
}
