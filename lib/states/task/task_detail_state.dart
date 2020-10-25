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
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskDetailState;
  factory TaskDetailState.fromJson(Map<String, dynamic> json) {
    return _$TaskDetailStateFromJson(json);
  }
}

class TaskDetailStateNotifier extends StateNotifier<TaskDetailState> {
  TaskDetailStateNotifier(this.read) : super(const TaskDetailState());

  final Reader read;

  TaskDetailState setTask(Task task) {
    return state = state.copyWith(task: task);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskDetailState setIsFetching(bool isFetching) {
    return state = state.copyWith(isFetching: isFetching);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskDetailState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  TaskDetailState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  TaskDetailState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  TaskDetailState clear() {
    setTask(null);
    setIsFetching(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<TaskDetailState> fetchTaskById(int id) async {
    final completer = Completer<TaskDetailState>();

    setTask(null);
    setIsFetching(true);
    setIsError(false);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    try {
      final response = await tasksApi.apiV1TasksIdGet(id);
      setTask(Task.fromJson(response.toJson()));
    } on openapi.ApiException catch (error) {
      setIsError(true);
      setErrorStatusCode(error.code);
      setErrorBody(error.message);
    }

    setIsFetching(false);
    completer.complete(state);
    return completer.future;
  }
}
