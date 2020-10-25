import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/organisms/task_new_body.dart';
import 'package:todo_flutter_sample/components/templates/page_template.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskNewPage extends HookWidget {
  static String routeName = '/task/new';

  @override
  Widget build(BuildContext context) {
    final isInitialized = useState(false);
    final taskCreateStateNotifier = useProvider(taskCreateStateProvider);

    useEffect(() {
      Timer.run(() {
        taskCreateStateNotifier.clear();
        isInitialized.value = true;
      });
      return () {};
    }, []);

    const title = 'New Task';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body:
          PageTemplate(body: isInitialized.value ? TaskNewBody() : Container()),
    );
  }
}
