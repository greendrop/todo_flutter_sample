import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_list_item.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

class TaskListBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final taskListStateNotifier = useProvider(taskListStateProvider);
    final taskListState = useProvider(taskListStateProvider.state);

    final tasks = taskListState.tasks;
    final isFetching = taskListState.isFetching;
    final isLastFetched = taskListState.isLastFetched;

    Future<void> _onRefresh() async {
      await taskListStateNotifier.fetchTasks({});
    }

    final listItems = <Widget>[
      ...(tasks ?? []).map((item) => TaskListItem(item))
    ];

    final listView =
        ListView.builder(itemBuilder: (BuildContext context, int index) {
      final length = listItems?.length ?? 0;

      if (index == length) {
        if (!isLastFetched) {
          Timer.run(() {
            taskListStateNotifier.fetchAdditionalTasks({});
          });

          return CenterCircularProgressIndicator();
        } else {
          if (isFetching) {
            return CenterCircularProgressIndicator();
          } else {
            return null;
          }
        }
      } else if (index > length) {
        return null;
      }

      return listItems[index];
    });

    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: listView,
    );
  }
}
