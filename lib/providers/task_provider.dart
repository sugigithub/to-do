import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/models/task.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super(taskData);

  void addTask(Task task) {
    state = [...state, task];
  }
}

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});
