import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

part 'task_detail_state.freezed.dart';
part 'task_detail_state.g.dart';

@freezed
abstract class TaskDetailState with _$TaskDetailState {
  const factory TaskDetailState({
    Task task,
    @Default(false) bool isFetching,
  }) = _TaskDetailState;
  factory TaskDetailState.fromJson(Map<String, dynamic> json) {
    return _$TaskDetailStateFromJson(json);
  }
}

class TaskDetailStateNotifier extends StateNotifier<TaskDetailState> {
  TaskDetailStateNotifier(this.read) : super(const TaskDetailState());

  final Reader read;

  void setTask(Task task) {
    state = state.copyWith(task: task);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsFetching(bool isFetching) {
    state = state.copyWith(isFetching: isFetching);
  }

  void clear() {
    setTask(null);
    setIsFetching(false);
  }

  Future<void> fetchTaskById(int id) async {
    final completer = Completer<void>();

    setTask(null);
    setIsFetching(true);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    final response = await tasksApi.apiV1TasksIdGet(id);
    setTask(Task.fromJson(response.toJson()));
    setIsFetching(false);

    completer.complete();
    return completer.future;
  }
}
