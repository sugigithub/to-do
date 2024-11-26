import 'package:todo_app/models/category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum TaskState { inProgress, completed, cancelled, pending }

class Task {
  Task({
    required this.title,
    required this.description,
    this.dueDate,
    required this.category,
    this.alert = false,
    this.percentageCompletion = 0,
    this.subTask = const [],
    this.taskState = TaskState.pending,
  })  : id = uuid,
        createdDate = DateTime.now();

  final Uuid id;
  final String title;
  final String description;
  final DateTime createdDate;
  final DateTime? dueDate;
  final Category category;
  final bool alert;
  final int percentageCompletion;
  final List<Task> subTask;
  final TaskState taskState;

  String get formattedDate {
    return "${createdDate.day}-${createdDate.month}-${createdDate.year}";
  }
}
