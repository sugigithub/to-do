import 'package:flutter/material.dart';
import 'package:todo_app/screens/task_list_screen.dart';
import 'package:go_router/go_router.dart';

class Tile extends StatelessWidget {
  const Tile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.amber,
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (ctx) => const TaskListScreen(),
        //   ),
        // );
        GoRouter.of(context).pushNamed('new_task');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          color:
              const Color(0xFF66B2FF), // Replace with your desired blue color
          borderRadius: BorderRadius.circular(17.0), // Adjust radius as needed
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.5),
              ),
              child: const Icon(
                Icons.refresh, // Replace with your rotating arrow icon
                color: Colors.white,
                size: 24.0,
              ),
            ),
            const SizedBox(width: 15.0),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'On Going',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '24 Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
