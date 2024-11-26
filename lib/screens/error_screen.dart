import 'package:flutter/material.dart';
import 'package:todo_app/widgets/recent_task_card.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('page not found'),
        ),
        body: Container(
          child: Center(
            child: Text('error page'),
          ),
        ));
  }
}
