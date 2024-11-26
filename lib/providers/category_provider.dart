import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/category.dart';

final categoryProvider = Provider<List<Category>>((ref) {
  return [
    Category.dailyRoutine,
    Category.travel,
    Category.work,
  ];
});
