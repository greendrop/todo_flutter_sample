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
  }) = _TaskDeleteState;
  factory TaskDeleteState.fromJson(Map<String, dynamic> json) {
    return _$TaskDeleteStateFromJson(json);
  }
}

class TaskDeleteStateNotifier extends StateNotifier<TaskDeleteState> {
  TaskDeleteStateNotifier(this.read) : super(const TaskDeleteState());

  final Reader read;

  // ignore: avoid_positional_boolean_parameters
  void setIsDeleting(bool isDeleting) {
    state = state.copyWith(isDeleting: isDeleting);
  }

  void clear() {
    setIsDeleting(false);
  }

  Future<void> deleteTask(int id) async {
    final completer = Completer<void>();

    setIsDeleting(true);

    final appConfig = AppConfig();
    final apiClient =
        openapi.ApiClient(basePath: appConfig.envConfig.apiBaseUrl);
    final authState = read(authStateProvider.state);
    apiClient.getAuthentication<openapi.OAuth>('oauth2').accessToken =
        authState.token.accessToken;
    final tasksApi = openapi.TasksApi(apiClient);

    await tasksApi.apiV1TasksIdDelete(id);
    setIsDeleting(false);

    completer.complete();
    return completer.future;
  }
}
