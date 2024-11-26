import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'package:todo_app/providers/category_provider.dart';
import 'package:todo_app/widgets/category_tag.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  NewTaskScreen({super.key, required this.selectPage});

  final Function selectPage;

  @override
  ConsumerState<NewTaskScreen> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends ConsumerState<NewTaskScreen> {
  DateTime? _selectedDate;

  final _formKey = GlobalKey<FormState>();
  bool _formHasError = false;
  var _title = '';
  var _description = '';
  var _dueDate = '';
  var _selectoryCategory = Category.dailyRoutine;
  final TextEditingController _dateController = TextEditingController();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(2100),
    );
    setState(() {
      _selectedDate = pickedDate;
      _dateController.text =
          "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}";
    });
  }

  void clearForm() {
    _formKey.currentState!.reset();
    _dateController.clear();
    setState(() {
      _selectoryCategory = Category.dailyRoutine;
    });
  }

  void _saveNewTask() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print("saving");
      ref.read(taskProvider.notifier).addTask(
            Task(
              title: _title,
              description: _description,
              category: _selectoryCategory as Category,
              percentageCompletion: 60,
            ),
          );
      print('form is valid');
      final url = Uri.https(
          'plan-ahead-77689-default-rtdb.firebaseio.com', 'task-list.json');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'title': _title,
          'description': _description,
          'category': _selectoryCategory.name,
          'percentageCompletion': 60,
        }),
      );
      // final task_list = json.decode(response);
      // response.statusCode == 200
      print(response.body);
      print(response.statusCode);
      print("response.statusCode");
      widget.selectPage(0);
    } else {
      setState(() {
        _formHasError = true;
      });
    }
  }

  void updateSelectedCategory(Category value) {
    print(value);
    print('category value');
    // _selectoryCategory = value;
    setState(() {
      _selectoryCategory = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final taskData = ref.watch(taskProvider);
    final categoryData = ref.watch(categoryProvider);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('New Task'),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 50,
                    decoration: InputDecoration(
                      label: const Text('Title'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1) {
                        return 'must be between 2 and 50 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _title = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLength: 150,
                    maxLines: null,
                    decoration: InputDecoration(
                      label: const Text('Description'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.trim().length <= 1) {
                        return 'must be between 10 and 150 characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _description = value!;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text('Due Dateee'),
                      border: OutlineInputBorder(),
                    ),
                    // readOnly: true,
                    onTap: _presentDatePicker,
                    controller: _dateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Due date is required';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _dueDate = value!;
                      print(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8.0, // Horizontal spacing between the children
              runSpacing: 4.0,
              children: categoryData
                  .map((category) => CategoryTag(
                        category: category,
                        onSelectCategory: updateSelectedCategory,
                        selectedCategory: _selectoryCategory,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  'Get alert for this task',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SwitchListTile(
                    value: true,
                    onChanged: (value) => false,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNewTask,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust radius as needed
                ),
                // minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Create Task',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                clearForm();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust radius as needed
                ),
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Clear form',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
