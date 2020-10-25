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
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskUpdateState;
  factory TaskUpdateState.fromJson(Map<String, dynamic> json) {
    return _$TaskUpdateStateFromJson(json);
  }
}

class TaskUpdateStateNotifier extends StateNotifier<TaskUpdateState> {
  TaskUpdateStateNotifier(this.read) : super(const TaskUpdateState());

  final Reader read;

  // ignore: avoid_positional_boolean_parameters
  TaskUpdateState setIsUpdating(bool isUpdating) {
    return state = state.copyWith(isUpdating: isUpdating);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskUpdateState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  TaskUpdateState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  TaskUpdateState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  TaskUpdateState clear() {
    setIsUpdating(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<TaskUpdateState> updateTask(int id, TaskForm taskForm) async {
    final completer = Completer<TaskUpdateState>();

    setIsUpdating(true);
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
    final taskUpdateSchema = openapi.TaskUpdateSchema()..task = taskFormSchema;

    try {
      await tasksApi.apiV1TasksIdPatch(id, taskUpdateSchema: taskUpdateSchema);
    } on openapi.ApiException catch (error) {
      setIsError(true);
      setErrorStatusCode(error.code);
      setErrorBody(error.message);
    }

    setIsUpdating(false);
    completer.complete(state);
    return completer.future;
  }
}
