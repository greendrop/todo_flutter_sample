import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/task_form.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/repositories/task_repository.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

part 'task_create_state.freezed.dart';
part 'task_create_state.g.dart';

@freezed
abstract class TaskCreateState with _$TaskCreateState {
  const factory TaskCreateState({
    OAuth2Token authToken,
    User authUser,
    @Default(false) bool isCreating,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskCreateState;
  factory TaskCreateState.fromJson(Map<String, dynamic> json) {
    return _$TaskCreateStateFromJson(json);
  }
}

class TaskCreateStateNotifier extends StateNotifier<TaskCreateState>
    with LocatorMixin {
  TaskCreateStateNotifier() : super(const TaskCreateState());

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

    final taskRepository = TaskRepository()
      ..headerAuthorization = 'Bearer ${state.authToken.accessToken}';

    final response = await taskRepository.create(taskForm);

    if (response.statusCode >= 200 && response.statusCode < 300) {
    } else {
      setIsError(true);
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
    }

    setIsCreating(false);
    completer.complete(state);
    return completer.future;
  }
}
