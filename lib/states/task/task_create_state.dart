import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

part 'task_create_state.freezed.dart';
part 'task_create_state.g.dart';

@freezed
abstract class TaskCreateState with _$TaskCreateState {
  const factory TaskCreateState({
    @Default(false) bool isCreating,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskCreateState;
  factory TaskCreateState.fromJson(Map<String, dynamic> json) {
    return _$TaskCreateStateFromJson(json);
  }
}

class TaskCreateStateNotifier extends StateNotifier<TaskCreateState> {
  TaskCreateStateNotifier(this.read) : super(const TaskCreateState());

  final Reader read;

  // ignore: avoid_positional_boolean_parameters
  TaskCreateState setIsCreating(bool isCreating) {
    return state = state.copyWith(isCreating: isCreating);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskCreateState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  TaskCreateState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  TaskCreateState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  TaskCreateState clear() {
    setIsCreating(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<TaskCreateState> createTask(TaskForm taskForm) async {
    final completer = Completer<TaskCreateState>();

    setIsCreating(true);
    setIsError(false);

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
    final taskCreateSchema = openapi.TaskCreateSchema()..task = taskFormSchema;

    try {
      await tasksApi.apiV1TasksPost(taskCreateSchema: taskCreateSchema);
    } on openapi.ApiException catch (error) {
      setIsError(true);
      setErrorStatusCode(error.code);
      setErrorBody(error.message);
    }

    setIsCreating(false);
    completer.complete(state);
    return completer.future;
  }
}
