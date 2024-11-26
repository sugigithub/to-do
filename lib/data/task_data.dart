import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/task.dart';

final taskData = [
  Task(
    title: "first task of the day",
    description: 'complete it no matter what',
    category: Category.work,
    percentageCompletion: 30,
  ),
  Task(
    title: "second task of the day",
    description: 'complete it no matter what',
    category: Category.dailyRoutine,
    percentageCompletion: 40,
  ),
  Task(
    title: "third task of the day",
    description: 'complete it no matter what',
    category: Category.travel,
    percentageCompletion: 0,
  ),
  Task(
    title: "fourth task of the day",
    description: 'complete it no matter what',
    category: Category.work,
    percentageCompletion: 90,
  ),
  Task(
    title: "last task of the day",
    description: 'complete it no matter what',
    category: Category.dailyRoutine,
    percentageCompletion: 60,
  ),
];
