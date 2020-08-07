import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:todo_flutter_sample/models/task_form.dart';

part 'task_form_state.freezed.dart';
part 'task_form_state.g.dart';

@freezed
abstract class TaskFormState with _$TaskFormState {
  const factory TaskFormState({
    TaskForm taskForm,
  }) = _TaskFormState;
  factory TaskFormState.fromJson(Map<String, dynamic> json) {
    return _$TaskFormStateFromJson(json);
  }
}

class TaskFormStateNotifier extends StateNotifier<TaskFormState> {
  TaskFormStateNotifier() : super(const TaskFormState());

  void setTaskForm(TaskForm taskForm) {
    state = state.copyWith(taskForm: taskForm);
  }

  void initialize() {
    setTaskForm(TaskForm());
  }

  void handleTitle(String value) {
    final taskForm = TaskForm.fromJson(state.taskForm.toJson())..title = value;
    setTaskForm(taskForm);
  }

  void handleDescription(String value) {
    final taskForm = TaskForm.fromJson(state.taskForm.toJson())
      ..description = value;
    setTaskForm(taskForm);
  }

  // ignore: avoid_positional_boolean_parameters
  void handleDone(bool value) {
    final taskForm = TaskForm.fromJson(state.taskForm.toJson())..done = value;
    setTaskForm(taskForm);
  }
}
