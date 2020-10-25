import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openapi/api.dart' as openapi;
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/config/app_config.dart';
import 'package:todo_flutter_sample/models/task.dart';
import 'package:todo_flutter_sample/states/state_provider.dart';

part 'task_list_state.freezed.dart';
part 'task_list_state.g.dart';

const _taskListPerPage = 10;

@freezed
abstract class TaskListState with _$TaskListState {
  const factory TaskListState({
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

class TaskListStateNotifier extends StateNotifier<TaskListState> {
  TaskListStateNotifier(this.read) : super(const TaskListState());

  final Reader read;

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

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    try {
      final response =
          await tasksApi.apiV1TasksGet(page: 1, perPage: _taskListPerPage);
      setTasks(
          response.data.map((item) => Task.fromJson(item.toJson())).toList());
      setPage(response.paging.currentPage.toInt());
      setPerPage(response.paging.limitValue.toInt());
      setTotalCount(response.paging.totalCount.toInt());
      setMaxPage(response.paging.totalPages.toInt());
    } on openapi.ApiException catch (error) {
      setIsError(true);
      setErrorStatusCode(error.code);
      setErrorBody(error.message);
    }

    setIsFetching(false);
    completer.complete(state);
    return completer.future;
  }

  Future<TaskListState> fetchAdditionalTasks(
      Map<String, String> queryParameters) async {
    final completer = Completer<TaskListState>();
    final page = state.page + 1;
    final perPage = state.perPage;

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
      final response =
          await tasksApi.apiV1TasksGet(page: page, perPage: perPage);
      setTasks(
          response.data.map((item) => Task.fromJson(item.toJson())).toList());
      setPage(response.paging.currentPage.toInt());
      setPerPage(response.paging.limitValue.toInt());
      setTotalCount(response.paging.totalCount.toInt());
      setMaxPage(response.paging.totalPages.toInt());
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
