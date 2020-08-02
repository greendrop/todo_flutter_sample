import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/repositories/task_repository.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

part 'task_detail_state.freezed.dart';
part 'task_detail_state.g.dart';

@freezed
abstract class TaskDetailState with _$TaskDetailState {
  const factory TaskDetailState({
    OAuth2Token authToken,
    User authUser,
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

class TaskDetailStateNotifier extends StateNotifier<TaskDetailState>
    with LocatorMixin {
  TaskDetailStateNotifier() : super(const TaskDetailState());

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

  void setTask(Task task) {
    state = state.copyWith(task: task);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsFetching(bool isFetching) {
    state = state.copyWith(isFetching: isFetching);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsError(bool isError) {
    state = state.copyWith(isError: isError);
  }

  void setErrorStatusCode(int errorStatusCode) {
    state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  void setErrorBody(String errorBody) {
    state = state.copyWith(errorBody: errorBody);
  }

  void clearTask() {
    state = state.copyWith(task: null);
  }

  Future<void> fetchTaskById(int id) async {
    clearTask();
    setIsFetching(true);
    setIsError(false);

    final taskRepository = TaskRepository()
      ..headerAuthorization = 'Bearer ${state.authToken.accessToken}';

    final response = await taskRepository.get(id);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body) as Map<String, dynamic>;
      setTask(Task.fromJson(body));
    } else {
      setIsError(true);
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
    }
    setIsFetching(false);
  }
}
