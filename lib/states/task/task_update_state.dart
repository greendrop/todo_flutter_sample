import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

part 'task_update_state.freezed.dart';
part 'task_update_state.g.dart';

@freezed
abstract class TaskUpdateState with _$TaskUpdateState {
  const factory TaskUpdateState({
    @Default(false) bool isUpdating,
  }) = _TaskUpdateState;
  factory TaskUpdateState.fromJson(Map<String, dynamic> json) {
    return _$TaskUpdateStateFromJson(json);
  }
}

class TaskUpdateStateNotifier extends StateNotifier<TaskUpdateState> {
  TaskUpdateStateNotifier(this.read) : super(const TaskUpdateState());

  final Reader read;

  // ignore: avoid_positional_boolean_parameters
  void setIsUpdating(bool isUpdating) {
    state = state.copyWith(isUpdating: isUpdating);
  }

  void clear() {
    setIsUpdating(false);
  }

  Future<void> updateTask(int id, TaskForm taskForm) async {
    final completer = Completer<void>();

    setIsUpdating(true);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);
    final taskFormSchema = openapi.TaskFormSchema()
      ..title = taskForm.title
      ..description = taskForm.description
      ..done = taskForm.done;
    final taskUpdateSchema = openapi.TaskUpdateSchema()..task = taskFormSchema;

    await tasksApi.apiV1TasksIdPatch(id, taskUpdateSchema: taskUpdateSchema);
    setIsUpdating(false);

    completer.complete();
    return completer.future;
  }
}
