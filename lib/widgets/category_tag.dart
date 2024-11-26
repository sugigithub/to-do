import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag(
      {super.key,
      required this.category,
      required this.onSelectCategory,
      required this.selectedCategory});

  final Category category;
  final onSelectCategory;
  final selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          onSelectCategory(category);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: selectedCategory.name == category.name
                ? Colors.orange
                : Colors.grey.withOpacity(0.3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            minimumSize: const Size(0, 0)),
        child: Text(
          category.name,
          style: const TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
