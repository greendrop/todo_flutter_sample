import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_sample/components/atoms/center_circular_progress_indicator.dart';
import 'package:todo_flutter_sample/components/molecules/task_list_item.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/states/task/task_list_state.dart';

class TaskListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<void> _onRefresh() async {
      await context.read<TaskListStateNotifier>().fetchTasks({});
    }

    final tasks =
        context.select<TaskListState, List<Task>>((state) => state.tasks);
    final isFetching =
        context.select<TaskListState, bool>((state) => state.isFetching);
    final isLastFetched =
        context.select<TaskListState, bool>((state) => state.isLastFetched);

    final listItems = <Widget>[
      ...(tasks ?? []).map((item) => TaskListItem(item))
    ];

    final listView =
        ListView.builder(itemBuilder: (BuildContext context, int index) {
      final length = listItems?.length ?? 0;

      if (index == length) {
        if (!isLastFetched) {
          Timer(const Duration(), () {
            context.read<TaskListStateNotifier>().fetchAdditionalTasks({});
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
