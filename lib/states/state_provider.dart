import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_flutter_sample/states/auth_state.dart';
import 'package:todo_flutter_sample/states/task/task_create_state.dart';
import 'package:todo_flutter_sample/states/task/task_delete_state.dart';
import 'package:todo_flutter_sample/states/task/task_detail_state.dart';
import 'package:todo_flutter_sample/states/task/task_list_state.dart';
import 'package:todo_flutter_sample/states/task/task_update_state.dart';

final authStateProvider =
    StateNotifierProvider((ref) => AuthStateNotifier(ref.read));
final taskListStateProvider =
    StateNotifierProvider((ref) => TaskListStateNotifier(ref.read));
final taskDetailStateProvider =
    StateNotifierProvider((ref) => TaskDetailStateNotifier(ref.read));
final taskCreateStateProvider =
    StateNotifierProvider((ref) => TaskCreateStateNotifier(ref.read));
final taskUpdateStateProvider =
    StateNotifierProvider((ref) => TaskUpdateStateNotifier(ref.read));
final taskDeleteStateProvider =
    StateNotifierProvider((ref) => TaskDeleteStateNotifier(ref.read));
