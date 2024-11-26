import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/widgets/tile.dart';
import 'package:todo_app/widgets/recent_task_card.dart';
// import 'package:todo_app/data/task_data.dart';
import 'package:todo_app/providers/task_provider.dart';

class Todo extends ConsumerWidget {
  const Todo({super.key});
  // taskData

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const userIcon = 'assets/images/user-icon.jpg';
    final taskData = ref.watch(taskProvider);
    print(taskData);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/user-icon.jpg',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi User 👋',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'start logging your daily adventure',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_on),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 180,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Tile(),
                  Tile(),
                  Tile(),
                  Tile(),
                ],
              ),
            ),
            const Text(
              'Recent Tasks',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: taskData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return RecentTaskcard(task: taskData[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
