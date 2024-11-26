import 'package:flutter/material.dart';
import 'package:todo_app/widgets/recent_task_card.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RecentTaskcard(),
            // RecentTaskcard(),
            // RecentTaskcard(),
            // RecentTaskcard(),
            // RecentTaskcard(),
            // RecentTaskcard(),
            // RecentTaskcard(),
          ],
        ),
      ),
    );
  }
}
