import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/repositories/task_repository.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

part 'task_delete_state.freezed.dart';
part 'task_delete_state.g.dart';

@freezed
abstract class TaskDeleteState with _$TaskDeleteState {
  const factory TaskDeleteState({
    OAuth2Token authToken,
    User authUser,
    @Default(false) bool isDeleting,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskDeleteState;
  factory TaskDeleteState.fromJson(Map<String, dynamic> json) {
    return _$TaskDeleteStateFromJson(json);
  }
}

class TaskDeleteStateNotifier extends StateNotifier<TaskDeleteState>
    with LocatorMixin {
  TaskDeleteStateNotifier() : super(const TaskDeleteState());

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

    final taskRepository = TaskRepository()
      ..headerAuthorization = 'Bearer ${state.authToken.accessToken}';

    final response = await taskRepository.delete(id);

    if (!(response.statusCode >= 200 && response.statusCode < 300)) {
      setIsError(true);
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
    }
    setIsDeleting(false);
    completer.complete(state);
    return completer.future;
  }
}
