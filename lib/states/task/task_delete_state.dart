import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

part 'task_delete_state.freezed.dart';
part 'task_delete_state.g.dart';

@freezed
abstract class TaskDeleteState with _$TaskDeleteState {
  const factory TaskDeleteState({
    @Default(false) bool isDeleting,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskDeleteState;
  factory TaskDeleteState.fromJson(Map<String, dynamic> json) {
    return _$TaskDeleteStateFromJson(json);
  }
}

class TaskDeleteStateNotifier extends StateNotifier<TaskDeleteState> {
  TaskDeleteStateNotifier(this.read) : super(const TaskDeleteState());

  final Reader read;

  // ignore: avoid_positional_boolean_parameters
  TaskDeleteState setIsDeleting(bool isDeleting) {
    return state = state.copyWith(isDeleting: isDeleting);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskDeleteState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  TaskDeleteState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  TaskDeleteState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  TaskDeleteState clear() {
    setIsDeleting(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<TaskDeleteState> deleteTask(int id) async {
    final completer = Completer<TaskDeleteState>();

    setIsDeleting(true);
    setIsError(false);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    try {
      await tasksApi.apiV1TasksIdDelete(id);
    } on openapi.ApiException catch (error) {
      setIsError(true);
      setErrorStatusCode(error.code);
      setErrorBody(error.message);
    }

    setIsDeleting(false);
    completer.complete(state);
    return completer.future;
  }
}
