import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/models/task.dart';

class RecentTaskcard extends StatelessWidget {
  const RecentTaskcard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return (Card(
      borderOnForeground: true,
      elevation: 0.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  task.description,
                  style: const TextStyle(color: Colors.black45, fontSize: 10),
                ),
                Text((task.category.name).toString()),
                Text(task.formattedDate),
              ],
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: task.percentageCompletion / 100,
                    color: Colors.teal,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    strokeWidth: 6,
                    semanticsLabel: 'label',
                    semanticsValue: '10',
                    strokeCap: StrokeCap.round,
                  ),
                ),
                Text('${task.percentageCompletion}%'),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
