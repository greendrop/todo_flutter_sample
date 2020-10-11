import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

part 'task_update_state.freezed.dart';
part 'task_update_state.g.dart';

@freezed
abstract class TaskUpdateState with _$TaskUpdateState {
  const factory TaskUpdateState({
    OAuth2Token authToken,
    User authUser,
    @Default(false) bool isUpdating,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskUpdateState;
  factory TaskUpdateState.fromJson(Map<String, dynamic> json) {
    return _$TaskUpdateStateFromJson(json);
  }
}

class TaskUpdateStateNotifier extends StateNotifier<TaskUpdateState>
    with LocatorMixin {
  TaskUpdateStateNotifier() : super(const TaskUpdateState());

  @override
  void initState() {
    super.initState();

    state = state.copyWith(
        authToken: read<AuthState>().token, authUser: read<AuthState>().user);
  }

  @override
  void update(Locator watch) {
    super.update(watch);

    state = state.copyWith(
        authToken: watch<AuthState>().token, authUser: watch<AuthState>().user);
  }

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
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        state.authToken.accessToken;
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
