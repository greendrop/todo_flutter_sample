import 'dart:async';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/oauth2_token.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/models/user.dart';
import 'package:todo_flutter_sample/repositories/task_repository.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';

part 'task_list_state.freezed.dart';
part 'task_list_state.g.dart';

const _taskListPerPage = 10;

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
    OAuth2Token authToken,
    User authUser,
    List<Task> tasks,
    @Default(0) int totalCount,
    @Default(1) int page,
    @Default(_taskListPerPage) int perPage,
    @Default(1) int maxPage,
    @Default(true) bool isLastFetched,
    @Default(false) bool isFetching,
    @Default(false) bool isError,
    @Default(0) int errorStatusCode,
    @Default('') String errorBody,
  }) = _TaskListState;
  factory TaskListState.fromJson(Map<String, dynamic> json) {
    return _$TaskListStateFromJson(json);
  }
}

class TaskListStateNotifier extends StateNotifier<TaskListState>
    with LocatorMixin {
  TaskListStateNotifier() : super(const TaskListState());

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

  TaskListState setTasks(List<Task> tasks) {
    return state = state.copyWith(tasks: tasks);
  }

  TaskListState setTotalCount(int totalCount) {
    return state = state.copyWith(totalCount: totalCount);
  }

  TaskListState setPage(int page) {
    final isLastFetched = page >= state.maxPage;
    return state = state.copyWith(page: page, isLastFetched: isLastFetched);
  }

  TaskListState setPerPage(int perPage) {
    return state = state.copyWith(perPage: perPage);
  }

  TaskListState setMaxPage(int maxPage) {
    final isLastFetched = state.page >= maxPage;
    return state =
        state.copyWith(maxPage: maxPage, isLastFetched: isLastFetched);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskListState setIsFetching(bool isFetching) {
    return state = state.copyWith(isFetching: isFetching);
  }

  // ignore: avoid_positional_boolean_parameters
  TaskListState setIsError(bool isError) {
    return state = state.copyWith(isError: isError);
  }

  TaskListState setErrorStatusCode(int errorStatusCode) {
    return state = state.copyWith(errorStatusCode: errorStatusCode);
  }

  TaskListState setErrorBody(String errorBody) {
    return state = state.copyWith(errorBody: errorBody);
  }

  TaskListState clearTasks() {
    return state = state.copyWith(
        tasks: null, totalCount: 0, page: 1, maxPage: 1, isLastFetched: true);
  }

  TaskListState clear() {
    clearTasks();
    setIsFetching(false);
    setIsError(false);
    setErrorStatusCode(0);
    setErrorBody('');
    return state;
  }

  Future<TaskListState> fetchTasks(Map<String, String> queryParameters) async {
    final completer = Completer<TaskListState>();

    clearTasks();
    setIsFetching(true);
    setIsError(false);

    if (queryParameters['per_page'] == null) {
      queryParameters['per_page'] = _taskListPerPage.toString();
    }

    final taskRepository = TaskRepository()
      ..headerAuthorization = 'Bearer ${state.authToken.accessToken}';

    final response = await taskRepository.getList(queryParameters);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body) as List<dynamic>;
      setTasks(body
          .map((dynamic item) => Task.fromJson(item as Map<String, dynamic>))
          .toList());
      var resPage = 1;
      var resPerPage = _taskListPerPage;
      if (queryParameters['page'] != null) {
        resPage = int.parse(queryParameters['page']);
      }
      if (queryParameters['per_page'] != null) {
        resPerPage = int.parse(queryParameters['per_page']);
      }
      final resTotalCount = int.parse(response.headers['total-count']);
      setPage(resPage);
      setPerPage(resPerPage);
      setTotalCount(resTotalCount);
      setMaxPage(resTotalCount == 0 ? 1 : (resTotalCount / resPerPage).ceil());
    } else {
      setIsError(true);
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
    }
    setIsFetching(false);
    completer.complete(state);
    return completer.future;
  }

  Future<TaskListState> fetchAdditionalTasks(
      Map<String, String> queryParameters) async {
    final completer = Completer<TaskListState>();

    setIsFetching(true);
    setIsError(false);

    queryParameters['page'] = (state.page + 1).toString();
    queryParameters['per_page'] = state.perPage.toString();

    final taskRepository = TaskRepository()
      ..headerAuthorization = 'Bearer ${state.authToken.accessToken}';

    final response = await taskRepository.getList(queryParameters);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final body = json.decode(response.body) as List<dynamic>;
      final additionalTasks = body
          .map((dynamic item) => Task.fromJson(item as Map<String, dynamic>))
          .toList();
      final tasks = [
        ...state.tasks,
        ...additionalTasks,
      ];
      setTasks(tasks);
      final resPage = int.parse(queryParameters['page']);
      final resPerPage = int.parse(queryParameters['per_page']);
      final resTotalCount = int.parse(response.headers['total-count']);
      setPage(resPage);
      setPerPage(resPerPage);
      setTotalCount(resTotalCount);
      setMaxPage(resTotalCount == 0 ? 1 : (resTotalCount / resPerPage).ceil());
    } else {
      setIsError(true);
      setErrorStatusCode(response.statusCode);
      setErrorBody(response.body);
    }
    setIsFetching(false);
    completer.complete(state);
    return completer.future;
  }
}
