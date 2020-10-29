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
  }) = _TaskListState;
  factory TaskListState.fromJson(Map<String, dynamic> json) {
    return _$TaskListStateFromJson(json);
  }
}

class TaskListStateNotifier extends StateNotifier<TaskListState> {
  TaskListStateNotifier(this.read) : super(const TaskListState());

  final Reader read;

  void setTasks(List<Task> tasks) {
    state = state.copyWith(tasks: tasks);
  }

  void setTotalCount(int totalCount) {
    state = state.copyWith(totalCount: totalCount);
  }

  void setPage(int page) {
    final isLastFetched = page >= state.maxPage;
    state = state.copyWith(page: page, isLastFetched: isLastFetched);
  }

  void setPerPage(int perPage) {
    state = state.copyWith(perPage: perPage);
  }

  void setMaxPage(int maxPage) {
    final isLastFetched = state.page >= maxPage;
    state = state.copyWith(maxPage: maxPage, isLastFetched: isLastFetched);
  }

  // ignore: avoid_positional_boolean_parameters
  void setIsFetching(bool isFetching) {
    state = state.copyWith(isFetching: isFetching);
  }

  void clearTasks() {
    state = state.copyWith(
        tasks: null, totalCount: 0, page: 1, maxPage: 1, isLastFetched: true);
  }

  void clear() {
    clearTasks();
    setIsFetching(false);
  }

  Future<void> fetchTasks(Map<String, String> queryParameters) async {
    final completer = Completer<void>();

    clearTasks();
    setIsFetching(true);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    final response =
        await tasksApi.apiV1TasksGet(page: 1, perPage: _taskListPerPage);
    setTasks(
        response.data.map((item) => Task.fromJson(item.toJson())).toList());
    setPage(response.paging.currentPage.toInt());
    setPerPage(response.paging.limitValue.toInt());
    setTotalCount(response.paging.totalCount.toInt());
    setMaxPage(response.paging.totalPages.toInt());
    setIsFetching(false);

    completer.complete();
    return completer.future;
  }

  Future<void> fetchAdditionalTasks(Map<String, String> queryParameters) async {
    final completer = Completer<void>();
    final page = state.page + 1;
    final perPage = state.perPage;

    setIsFetching(true);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    final response = await tasksApi.apiV1TasksGet(page: page, perPage: perPage);
    setTasks(
        response.data.map((item) => Task.fromJson(item.toJson())).toList());
    setPage(response.paging.currentPage.toInt());
    setPerPage(response.paging.limitValue.toInt());
    setTotalCount(response.paging.totalCount.toInt());
    setMaxPage(response.paging.totalPages.toInt());
    setIsFetching(false);

    completer.complete();
    return completer.future;
  }
}
